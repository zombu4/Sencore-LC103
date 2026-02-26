#!/usr/bin/env python3
import argparse
import csv
import json
import re
from collections import Counter, defaultdict
from dataclasses import dataclass, field
from pathlib import Path
from typing import Dict, List, Tuple

HEX_RE = re.compile(r"0x([0-9a-fA-F]{1,6})")
LISTING_RE = re.compile(r"^([0-9a-fA-F]{8}):")


@dataclass
class FuncInfo:
    start: int
    end: int
    bank: int
    source: str
    call_refs: int
    name: str = ""
    role: str = ""
    confidence: str = "low"
    tags: List[str] = field(default_factory=list)
    evidence: List[str] = field(default_factory=list)
    callers: List[int] = field(default_factory=list)
    callees: List[int] = field(default_factory=list)
    dptr_refs: List[int] = field(default_factory=list)
    movx_count: int = 0
    inst_count: int = 0


def slugify(s: str) -> str:
    s = s.lower().strip()
    s = re.sub(r"[^a-z0-9]+", "_", s)
    s = re.sub(r"_+", "_", s).strip("_")
    return s or "unknown"


def bank_of(addr: int) -> int:
    return 1 if addr >= 0x10000 else 0


def parse_immediates(ops: str) -> List[int]:
    out = []
    for h in HEX_RE.findall(ops):
        out.append(int(h, 16))
    return out


def load_csv_rows(path: Path) -> List[Dict[str, str]]:
    with path.open() as f:
        return list(csv.DictReader(f))


def load_tsv_rows(path: Path) -> List[Dict[str, str]]:
    with path.open() as f:
        return list(csv.DictReader(f, delimiter="\t"))


def classify_region(chunk: bytes, inst_count: int, fn_count: int, has_strings: bool, has_cmd_tokens: bool) -> str:
    if not chunk:
        return "empty"
    zero_ratio = chunk.count(0) / len(chunk)
    printable = sum(1 for b in chunk if 32 <= b <= 126)
    printable_ratio = printable / len(chunk)
    if has_cmd_tokens:
        return "command_string_table"
    if has_strings and printable_ratio > 0.35:
        return "ui_string_table"
    if inst_count > 40 or fn_count > 0:
        return "code"
    if zero_ratio > 0.80:
        return "padding_or_blank"
    if printable_ratio > 0.5:
        return "ascii_data"
    return "mixed_data"


def main() -> None:
    ap = argparse.ArgumentParser(description="Generate human-mapped annotated source artifacts.")
    ap.add_argument(
        "--base",
        default=str(Path(__file__).resolve().parents[1]),
        help="Base directory containing source/, maps/, reports/, and input/.",
    )
    args = ap.parse_args()

    base = Path(args.base).resolve()
    src = base / "source"
    maps = base / "maps"
    reports = base / "reports"
    out = src

    fw_csv = src / "fw153_full_source.csv"
    fw_lst = src / "fw153_full_source.lst"
    fw_bin = base / "input" / "firmware.bin"

    fstarts = load_tsv_rows(maps / "probable_function_starts.tsv")
    call_xrefs = load_tsv_rows(maps / "call_xrefs.tsv")
    proto = load_tsv_rows(reports / "protocol_strings_with_offsets.tsv")

    rows = load_csv_rows(fw_csv)
    firmware = fw_bin.read_bytes()

    # Instruction index
    inst_by_addr: Dict[int, Dict[str, str]] = {}
    addrs_sorted: List[int] = []
    for r in rows:
        a = int(r["offset_hex"], 16)
        inst_by_addr[a] = r
        addrs_sorted.append(a)
    addrs_sorted.sort()

    # Functions by bank from probable starts
    starts_bank = {0: [], 1: []}
    meta = {}
    for r in fstarts:
        a = int(r["address"], 16)
        b = bank_of(a)
        starts_bank[b].append(a)
        meta[a] = (r["source"], int(r["call_refs"]))
    for b in (0, 1):
        starts_bank[b].sort()

    funcs: Dict[int, FuncInfo] = {}
    for b in (0, 1):
        starts = starts_bank[b]
        bank_lo = 0x10000 * b
        bank_hi = bank_lo + 0x10000
        for i, s in enumerate(starts):
            e = starts[i + 1] - 1 if i + 1 < len(starts) else (bank_hi - 1)
            src_name, cref = meta[s]
            funcs[s] = FuncInfo(start=s, end=e, bank=b, source=src_name, call_refs=cref)

    # Build caller/callee maps
    callers_by_target: Dict[int, List[int]] = defaultdict(list)
    for r in call_xrefs:
        site = int(r["call_site"], 16)
        tgt = int(r["target"], 16)
        callers_by_target[tgt].append(site)

    # String catalog
    str_by_off: Dict[int, str] = {}
    for r in proto:
        o = int(r["offset_hex"], 16)
        str_by_off[o] = r["string"].strip()

    cmd_tokens = {
        "CALON", "CALOFF", "CALSET", "CALCLR", "CALF...", "CALCHK", "SER#", "SER#?",
        "CALF?", "CALDATE", "CALDATE?", "GAIN", "ISRC", "BEEP", "CLRPAR",
    }

    # Manual high-confidence labels for key recovered routines
    manual = {
        0x00000: ("bank0_boot_state_machine", "Top-level startup + mode dispatcher; contains early jump-table dispatch and readiness/error routing.", "high"),
        0x037F9: ("bank0_reset_init", "Reset/vector init: clears internal RAM, initializes stack, enters firmware init sequence.", "high"),
        0x10000: ("bank1_boot_state_machine", "Bank-1 top-level startup/state logic mirror with runtime differences.", "high"),
        0x137F9: ("bank1_reset_init", "Bank-1 reset/vector init mirror.", "high"),
        0x038C6: ("bank0_text_ptr_wrapper_a", "Text/resource pointer wrapper feeding shared print/format routine.", "high"),
        0x038CB: ("bank0_text_ptr_wrapper_b", "Text/resource pointer wrapper feeding shared print/format routine.", "high"),
        0x138C6: ("bank1_text_ptr_wrapper_a", "Bank-1 text/resource wrapper for shared print/format routine.", "high"),
        0x138CB: ("bank1_text_ptr_wrapper_b", "Bank-1 text/resource wrapper for shared print/format routine.", "high"),
        0x11F64: ("bank1_core_service_strobe", "Core service strobe toggling control bits via XDATA 0x8035/0x7B00; called across measurement/calibration flows.", "high"),
        0x11F97: ("bank1_measurement_wait_loop", "Stores parameters, invokes measurement compare path, loops until comparator/condition clears.", "high"),
        0x13B04: ("bank1_math_core_op_a", "Core multi-byte arithmetic/normalization primitive used by numeric engine.", "medium"),
        0x13CA6: ("bank1_math_core_compare", "Multi-byte compare/normalize routine used heavily in numeric pipeline.", "medium"),
        0x140AB: ("bank1_numeric_dispatch_a", "Jump-table-driven numeric operation dispatcher (fixed/multi-byte math helpers).", "medium"),
        0x1413C: ("bank1_mem_write_helper", "Generic write helper for internal/XDATA addressing modes.", "medium"),
        0x1420F: ("bank1_multibyte_add_helper", "Carry-aware multi-byte add helper on XDATA operands.", "medium"),
        0x143E8: ("bank1_multibyte_cmp_helper", "Signed/unsigned multi-byte compare helper used across math/calibration logic.", "medium"),
        0x1444A: ("bank1_store_u32_xdata", "Stores r4..r7 32-bit value to XDATA at DPTR.", "high"),
        0x14456: ("bank1_xdata_table_loader", "Indirect table loader/copy helper (MOVC/MOVX) used broadly by calibration/math paths.", "high"),
        0x1476B: ("bank1_numeric_dispatch_b", "Second jump-table numeric dispatcher with table at XDATA/ROM selector addresses.", "medium"),
        0x150F8: ("bank1_calibration_accumulator", "Calibration/state accumulator using 0x8B39..0x8B3F and math helpers.", "medium"),
        0x1A1E0: ("bank1_cal_capture_regs", "Captures and stages calibration registers from 0x865x into 0x8A8x working area.", "high"),
        0x1AA31: ("bank1_cal_compute_stage", "Calibration compute stage seeded from 0x8A86..0x8A8E with service/memory helpers.", "medium"),
        0x1EF5C: ("bank1_afe_sequence_a", "Analog front-end control sequence via 0x8054/0x7D02/0x7E01; used in measurement setup.", "high"),
        0x1EFDF: ("bank1_afe_sequence_b", "Alternate AFE sequence and mode-bit staging around 0x8AE2 + 0x7E01.", "high"),
        0x1EFFE: ("bank1_afe_clear_and_trigger", "Clears AFE control bits and starts trigger pulse path.", "high"),
        0x1F011: ("bank1_afe_pulse_trigger", "AFE pulse/trigger primitive toggling control bits then waiting for completion.", "high"),
        0x1F267: ("bank1_state_to_control_map", "Maps staged state in 0x8AD0..0x8AD3 to control-byte programming.", "medium"),
    }

    # Find owning function for an address
    starts_all = sorted(funcs)

    def owner_func(addr: int) -> int:
        bank = bank_of(addr)
        starts = starts_bank[bank]
        lo, hi = 0, len(starts) - 1
        best = starts[0] if starts else 0
        while lo <= hi:
            m = (lo + hi) // 2
            if starts[m] <= addr:
                best = starts[m]
                lo = m + 1
            else:
                hi = m - 1
        return best

    # Populate per-function instruction features
    for a in addrs_sorted:
        faddr = owner_func(a)
        fi = funcs.get(faddr)
        if not fi:
            continue
        r = inst_by_addr[a]
        mn = r["mnemonic"].strip()
        ops = r["operands"]
        fi.inst_count += 1
        if mn == "movx":
            fi.movx_count += 1
        if mn == "mov" and "dptr, #0x" in ops:
            vals = parse_immediates(ops)
            if vals:
                fi.dptr_refs.append(vals[0] & 0xFFFF)

    # Callers/callees
    callees_by_func: Dict[int, List[int]] = defaultdict(list)
    for r in call_xrefs:
        site = int(r["call_site"], 16)
        tgt = int(r["target"], 16)
        faddr = owner_func(site)
        callees_by_func[faddr].append(tgt)

    for s, fi in funcs.items():
        fi.callers = sorted(set(callers_by_target.get(s, [])))
        fi.callees = sorted(set(callees_by_func.get(s, [])))

    # Derive tags, names, roles
    for s in starts_all:
        fi = funcs[s]
        dset = sorted(set(fi.dptr_refs))
        fi.dptr_refs = dset
        tags = set()

        if fi.source == "vector":
            tags.add("vector_entry")
        if fi.movx_count > 0:
            tags.add("xdata_io")
        if any(0x8A00 <= d <= 0x8FFF for d in dset):
            tags.add("calibration_state")
        if any(d in {0x8035, 0x7B00} for d in dset):
            tags.add("service_strobe")
        if any(d in {0x8054, 0x7D02, 0x7E01} for d in dset):
            tags.add("analog_frontend")
        if any(0x8030 <= d <= 0x8060 for d in dset):
            tags.add("measurement_regs")
        if (0x03000 <= fi.start <= 0x033FF) or (0x13000 <= fi.start <= 0x133FF):
            tags.add("command_tables_region")
        if fi.call_refs >= 100:
            tags.add("high_fan_in_core")
        elif fi.call_refs >= 20:
            tags.add("shared_helper")
        if fi.inst_count > 250:
            tags.add("large_state_machine")

        # Inspect instruction mnemonics in function range for dispatcher pattern
        has_jmp_table = False
        arith_hits = 0
        for a in addrs_sorted:
            if a < fi.start or a > fi.end:
                continue
            r = inst_by_addr[a]
            if r["mnemonic"] == "jmp" and "@a+dptr" in r["operands"]:
                has_jmp_table = True
            if r["mnemonic"] in {"add", "addc", "subb", "mul", "div", "da", "rrc", "rlc", "xrl"}:
                arith_hits += 1
        if has_jmp_table:
            tags.add("jump_table_dispatch")
        if arith_hits > 20:
            tags.add("numeric_engine")

        # Manual labels win
        if s in manual:
            nm, rl, conf = manual[s]
            fi.name = nm
            fi.role = rl
            fi.confidence = conf
        else:
            # Auto role
            role_bits = []
            if "vector_entry" in tags:
                role_bits.append("Interrupt/reset vector handler entry")
            if "jump_table_dispatch" in tags:
                role_bits.append("jump-table dispatcher")
            if "calibration_state" in tags:
                role_bits.append("calibration state/XDATA handler")
            if "analog_frontend" in tags:
                role_bits.append("analog front-end control")
            if "measurement_regs" in tags:
                role_bits.append("measurement register path")
            if "numeric_engine" in tags:
                role_bits.append("numeric helper")
            if "large_state_machine" in tags:
                role_bits.append("large state machine")
            if not role_bits:
                role_bits.append("general helper / control-flow block")
            fi.role = "; ".join(role_bits)

            # Confidence heuristic
            if "vector_entry" in tags or "jump_table_dispatch" in tags:
                fi.confidence = "medium"
            if len(tags) >= 3:
                fi.confidence = "medium"
            if fi.call_refs >= 100 and len(tags) >= 2:
                fi.confidence = "medium"
            if fi.call_refs < 3 and len(tags) <= 1:
                fi.confidence = "low"

            tag_priority = [
                "jump_table_dispatch",
                "calibration_state",
                "analog_frontend",
                "measurement_regs",
                "numeric_engine",
                "service_strobe",
                "xdata_io",
                "shared_helper",
                "large_state_machine",
                "vector_entry",
                "command_tables_region",
                "high_fan_in_core",
            ]
            selected = [t for t in tag_priority if t in tags][:2]
            if not selected and tags:
                selected = sorted(tags)[:2]
            if selected:
                fi.name = f"bank{fi.bank}_{'_'.join(selected)}_{fi.start:05x}"
            else:
                fi.name = f"bank{fi.bank}_fn_{fi.start:05x}"

        fi.tags = sorted(tags)

        # Evidence strings
        ev = []
        if fi.call_refs:
            ev.append(f"call_refs={fi.call_refs}")
        if fi.callers:
            ev.append(f"unique_callers={len(fi.callers)}")
        if fi.callees:
            ev.append(f"unique_callees={len(fi.callees)}")
        if fi.dptr_refs:
            top = ", ".join(f"0x{x:04X}" for x in fi.dptr_refs[:8])
            ev.append(f"dptr_refs={top}{'...' if len(fi.dptr_refs) > 8 else ''}")
        if fi.movx_count:
            ev.append(f"movx_count={fi.movx_count}")
        fi.evidence = ev

    # Mirror analysis (bank1 to bank0 offset match)
    fw = firmware
    for s, fi in funcs.items():
        if fi.bank != 1:
            continue
        peer = s - 0x10000
        if peer not in funcs:
            continue
        p = funcs[peer]
        a0 = p.start
        b0 = min(p.end + 1, 0x10000)
        a1 = fi.start
        b1 = min(fi.end + 1, 0x20000)
        seg0 = fw[a0:b0]
        seg1 = fw[a1:b1]
        ln = min(len(seg0), len(seg1))
        if ln == 0:
            continue
        same = sum(1 for i in range(ln) if seg0[i] == seg1[i])
        ratio = same / ln
        fi.evidence.append(f"mirror_bank0=0x{peer:05X} similarity={ratio:.3f}")

    # Write function map CSV/JSON/MD
    fmap_csv = out / "fw153_function_map.csv"
    fmap_json = out / "fw153_function_map.json"
    fmap_md = out / "fw153_function_map.md"

    with fmap_csv.open("w", newline="", encoding="utf-8") as f:
        w = csv.writer(f)
        w.writerow([
            "name", "start_hex", "end_hex", "bank", "size_bytes", "source", "call_refs",
            "confidence", "role", "tags", "callers", "callees", "dptr_refs", "evidence",
        ])
        for s in sorted(funcs):
            fi = funcs[s]
            w.writerow([
                fi.name,
                f"0x{fi.start:05X}",
                f"0x{fi.end:05X}",
                fi.bank,
                fi.end - fi.start + 1,
                fi.source,
                fi.call_refs,
                fi.confidence,
                fi.role,
                ";".join(fi.tags),
                ";".join(f"0x{x:05X}" for x in fi.callers[:20]),
                ";".join(f"0x{x:05X}" for x in fi.callees[:20]),
                ";".join(f"0x{x:04X}" for x in fi.dptr_refs[:40]),
                " | ".join(fi.evidence),
            ])

    json_payload = []
    for s in sorted(funcs):
        fi = funcs[s]
        json_payload.append({
            "name": fi.name,
            "start": fi.start,
            "end": fi.end,
            "bank": fi.bank,
            "size": fi.end - fi.start + 1,
            "source": fi.source,
            "call_refs": fi.call_refs,
            "confidence": fi.confidence,
            "role": fi.role,
            "tags": fi.tags,
            "callers": fi.callers,
            "callees": fi.callees,
            "dptr_refs": fi.dptr_refs,
            "movx_count": fi.movx_count,
            "inst_count": fi.inst_count,
            "evidence": fi.evidence,
        })
    fmap_json.write_text(json.dumps(json_payload, indent=2) + "\n", encoding="utf-8")

    with fmap_md.open("w", encoding="utf-8") as f:
        f.write("# LC103 FW v1.53 Function Map (Human-Commented)\n\n")
        f.write("Generated from full disassembly with heuristic role inference and explicit confidence levels.\n")
        f.write("Unknown/uncertain semantics are marked by lower confidence.\n\n")
        f.write(f"Total mapped function starts: {len(funcs)}\n\n")
        f.write("## High-Value Named Routines\n\n")
        for s in sorted(funcs):
            fi = funcs[s]
            if s in manual:
                f.write(f"- `{fi.name}` @ `0x{fi.start:05X}` (`0x{fi.end:05X}`): {fi.role} [{fi.confidence}]\n")
        f.write("\n## Complete Function Index\n\n")
        f.write("| Start | End | Name | Role | Confidence | Tags |\n")
        f.write("|---|---|---|---|---|---|\n")
        for s in sorted(funcs):
            fi = funcs[s]
            f.write(
                f"| `0x{fi.start:05X}` | `0x{fi.end:05X}` | `{fi.name}` | {fi.role} | {fi.confidence} | {'; '.join(fi.tags)} |\n"
            )

    # Region map (0x100 granularity)
    region_csv = out / "fw153_region_map_0x100.csv"
    region_md = out / "fw153_region_map_0x100.md"

    inst_counts = Counter((a // 0x100) for a in addrs_sorted)
    fn_counts = Counter((s // 0x100) for s in funcs)
    str_regions = defaultdict(list)
    for o, text in str_by_off.items():
        str_regions[o // 0x100].append(text)

    with region_csv.open("w", newline="", encoding="utf-8") as f:
        w = csv.writer(f)
        w.writerow([
            "region_start_hex", "region_end_hex", "bank", "class", "inst_count", "function_starts",
            "ascii_ratio", "zero_ratio", "notes"
        ])
        for r in range(0, 0x20000, 0x100):
            chunk = firmware[r:r + 0x100]
            asc = sum(1 for b in chunk if 32 <= b <= 126) / 256.0
            zer = chunk.count(0) / 256.0
            bucket = r // 0x100
            texts = str_regions.get(bucket, [])
            has_cmd = any(t in cmd_tokens for t in texts)
            cls = classify_region(chunk, inst_counts.get(bucket, 0), fn_counts.get(bucket, 0), bool(texts), has_cmd)
            notes = []
            if texts:
                notes.append("strings=" + ",".join(texts[:4]))
            if fn_counts.get(bucket, 0):
                notes.append(f"fn_starts={fn_counts[bucket]}")
            w.writerow([
                f"0x{r:05X}",
                f"0x{r + 0xFF:05X}",
                bank_of(r),
                cls,
                inst_counts.get(bucket, 0),
                fn_counts.get(bucket, 0),
                f"{asc:.3f}",
                f"{zer:.3f}",
                " | ".join(notes),
            ])

    with region_md.open("w", encoding="utf-8") as f:
        f.write("# LC103 FW v1.53 Region Map (0x100-byte blocks)\n\n")
        f.write("Each block is classified as code/data/string/padding with block-level evidence.\n\n")
        f.write("See `fw153_region_map_0x100.csv` for full machine-readable map.\n")

    # Symbol include file
    sym_inc = out / "fw153_symbols.inc"
    with sym_inc.open("w", encoding="utf-8") as f:
        f.write("; LC103 FW v1.53 inferred symbol map\n")
        for s in sorted(funcs):
            fi = funcs[s]
            sym = fi.name.upper()
            sym = re.sub(r"[^A-Z0-9_]", "_", sym)
            f.write(f"{sym} EQU 0x{fi.start:05X} ; {fi.role} [{fi.confidence}]\n")
        f.write("\n; Protocol/string anchors\n")
        for o in sorted(str_by_off):
            t = str_by_off[o]
            nm = "STR_" + slugify(t).upper()
            f.write(f"{nm[:50]} EQU 0x{o:05X} ; \"{t}\"\n")

    # Annotated listing with dev comments
    annotated = out / "fw153_full_source_annotated.lst"
    func_by_start = {fi.start: fi for fi in funcs.values()}

    with fw_lst.open("r", encoding="utf-8", errors="replace") as fi, annotated.open("w", encoding="utf-8") as fo:
        fo.write("; LC103 FW v1.53 FULL SOURCE (annotated for humans)\n")
        fo.write("; Generated from full disassembly + inferred function map\n")
        fo.write("; Confidence legend: high=strong direct evidence, medium=multi-signal inference, low=structural only\n\n")

        for line in fi:
            m = LISTING_RE.match(line)
            if m:
                a = int(m.group(1), 16)
                if a in func_by_start:
                    fn = func_by_start[a]
                    size = fn.end - fn.start + 1
                    fo.write(";------------------------------------------------------------------------------\n")
                    fo.write(
                        f"; FUNCTION {fn.name} @ 0x{fn.start:05X}..0x{fn.end:05X} ({size} bytes)\n"
                    )
                    fo.write(f"; Role: {fn.role}\n")
                    fo.write(f"; Confidence: {fn.confidence}\n")
                    fo.write(f"; Tags: {', '.join(fn.tags) if fn.tags else 'none'}\n")
                    if fn.evidence:
                        fo.write(f"; Evidence: {' | '.join(fn.evidence)}\n")
                    fo.write(";------------------------------------------------------------------------------\n")

                if a in str_by_off:
                    t = str_by_off[a]
                    klass = "RS232 command token" if t in cmd_tokens else "UI/protocol text"
                    fo.write(f"; STRING 0x{a:05X}: \"{t}\" ({klass})\n")

            fo.write(line)

    # Coverage sanity note
    sanity = out / "fw153_mapping_sanity.json"
    sanity.write_text(json.dumps({
        "function_count": len(funcs),
        "instruction_rows": len(rows),
        "region_blocks": 0x200,
        "annotated_listing": str(annotated),
        "function_map_csv": str(fmap_csv),
        "region_map_csv": str(region_csv),
    }, indent=2) + "\n", encoding="utf-8")

    print(str(annotated))
    print(str(fmap_md))
    print(str(region_csv))


if __name__ == "__main__":
    main()
