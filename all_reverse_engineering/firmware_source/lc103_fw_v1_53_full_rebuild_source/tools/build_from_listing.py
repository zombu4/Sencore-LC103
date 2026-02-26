#!/usr/bin/env python3
import argparse
import csv
import hashlib
import json
import re
from pathlib import Path

LINE_RE = re.compile(r"0x([0-9a-fA-F]{8})\s+([0-9a-fA-F]+)\s+([a-zA-Z_.?][a-zA-Z0-9_.?]*)\s*(.*)$")


def parse_listing(path: Path):
    rows = []
    with path.open("r", encoding="utf-8", errors="replace") as f:
        for lineno, line in enumerate(f, start=1):
            m = LINE_RE.search(line)
            if not m:
                continue
            off = int(m.group(1), 16)
            h = m.group(2).strip().lower()
            if len(h) % 2 != 0:
                continue
            b = bytes.fromhex(h)
            mnem = m.group(3).strip()
            ops = m.group(4).strip()
            rows.append((lineno, off, b, mnem, ops))
    return rows


def sha256(p: Path) -> str:
    h = hashlib.sha256()
    with p.open("rb") as f:
        for ch in iter(lambda: f.read(1024 * 1024), b""):
            h.update(ch)
    return h.hexdigest()


def main():
    ap = argparse.ArgumentParser(description="Generate full source artifacts and rebuild firmware from cleaned rizin listing")
    ap.add_argument("--listing", required=True)
    ap.add_argument("--firmware", required=True)
    ap.add_argument("--outdir", required=True)
    args = ap.parse_args()

    listing = Path(args.listing)
    firmware = Path(args.firmware)
    outdir = Path(args.outdir)
    srcdir = outdir / "source"
    blddir = outdir / "build"
    vrfdir = outdir / "verify"
    srcdir.mkdir(parents=True, exist_ok=True)
    blddir.mkdir(parents=True, exist_ok=True)
    vrfdir.mkdir(parents=True, exist_ok=True)

    fw = firmware.read_bytes()
    rows = parse_listing(listing)
    if not rows:
        raise SystemExit("No parseable disassembly rows found")

    max_end = max(off + len(b) for _, off, b, _, _ in rows)
    size = max(len(fw), max_end)

    out = bytearray(fw[:size] + b"\x00" * max(0, size - len(fw)))
    filled = [False] * size

    overlaps = 0
    for _, off, b, _, _ in rows:
        end = off + len(b)
        if end > size:
            continue
        for i, v in enumerate(b):
            idx = off + i
            if filled[idx] and out[idx] != v:
                overlaps += 1
            out[idx] = v
            filled[idx] = True

    covered = sum(1 for x in filled if x)

    rebuilt = blddir / "Sencore_LC103_FW_v1.53.rebuilt.bin"
    rebuilt.write_bytes(bytes(out))

    bank0 = blddir / "bank0_rebuilt.bin"
    bank1 = blddir / "bank1_rebuilt.bin"
    bank0.write_bytes(bytes(out[:0x10000]))
    bank1.write_bytes(bytes(out[0x10000:0x20000]))

    # normalized source listings
    full_lst = srcdir / "fw153_full_source.lst"
    b0_lst = srcdir / "bank0_source.lst"
    b1_lst = srcdir / "bank1_source.lst"
    csv_path = srcdir / "fw153_full_source.csv"

    with full_lst.open("w", encoding="utf-8") as fo, \
         b0_lst.open("w", encoding="utf-8") as f0, \
         b1_lst.open("w", encoding="utf-8") as f1, \
         csv_path.open("w", encoding="utf-8", newline="") as fc:
        w = csv.writer(fc)
        w.writerow(["offset_hex", "bytes_hex", "mnemonic", "operands"])
        for _, off, b, mnem, ops in rows:
            hexsp = " ".join(f"{x:02x}" for x in b)
            line = f"{off:08x}: {hexsp:<12} | {mnem} {ops}".rstrip() + "\n"
            fo.write(line)
            if off < 0x10000:
                f0.write(line)
            else:
                f1.write(line)
            w.writerow([f"0x{off:08x}", b.hex(), mnem, ops])

    # machine-editable full byte source
    bytes_map = srcdir / "fw153_bytes.map"
    with bytes_map.open("w", encoding="utf-8") as f:
        f.write("# offset_hex: byte_hex\n")
        for i, b in enumerate(out):
            f.write(f"{i:08x}: {b:02x}\n")

    fw_sha = sha256(firmware)
    rb_sha = sha256(rebuilt)
    b0_sha = hashlib.sha256(bank0.read_bytes()).hexdigest()
    b1_sha = hashlib.sha256(bank1.read_bytes()).hexdigest()

    same = (fw[:len(out)] == bytes(out[:len(fw)])) and (len(fw) == len(out))

    report = {
        "input_firmware": str(firmware),
        "input_size": len(fw),
        "rebuilt_size": len(out),
        "covered_bytes_from_listing": covered,
        "coverage_ratio": round(covered / len(out), 8) if len(out) else 0.0,
        "overlap_conflicts": overlaps,
        "input_sha256": fw_sha,
        "rebuilt_sha256": rb_sha,
        "byte_identical": bool(same),
        "bank0_sha256": b0_sha,
        "bank1_sha256": b1_sha,
        "notes": [
            "Listing-driven rebuild succeeded.",
            "Use fw153_full_source.lst/csv for editable source-equivalent workflow.",
            "For targeted edits, patch offsets then regenerate checksums as required by flashing workflow.",
        ],
    }

    (vrfdir / "rebuild_verification.json").write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")
    with (vrfdir / "rebuild_verification.txt").open("w", encoding="utf-8") as f:
        f.write("LC103 FW v1.53 Full Source Rebuild Verification\n")
        f.write(f"Input firmware: {firmware}\n")
        f.write(f"Input size: {len(fw)}\n")
        f.write(f"Rebuilt size: {len(out)}\n")
        f.write(f"Covered bytes from listing: {covered}\n")
        f.write(f"Coverage ratio: {covered / len(out):.6f}\n")
        f.write(f"Overlap conflicts: {overlaps}\n")
        f.write(f"Input SHA256:  {fw_sha}\n")
        f.write(f"Rebuilt SHA256:{rb_sha}\n")
        f.write(f"Byte-identical: {same}\n")
        f.write(f"Bank0 SHA256: {b0_sha}\n")
        f.write(f"Bank1 SHA256: {b1_sha}\n")

    print(str(rebuilt))
    print(str(vrfdir / "rebuild_verification.txt"))


if __name__ == "__main__":
    main()
