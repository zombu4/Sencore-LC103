from __future__ import annotations

from configparser import RawConfigParser
from dataclasses import dataclass
from pathlib import Path
import re
from typing import Dict, Iterable, List, Optional, Sequence, Tuple


@dataclass(frozen=True)
class CalibrationRange:
    family: str
    index: int
    low_label: str
    low_actual: float
    high_label: str
    high_actual: float


@dataclass(frozen=True)
class CalPair:
    index: int
    high: float
    low: float


@dataclass(frozen=True)
class CalDataIdentity:
    model: Optional[str]
    version: Optional[str]


def _parse_float(value: str) -> float:
    return float(value.strip())


def _section_ranges(parser: RawConfigParser, prefix: str, family: str) -> List[CalibrationRange]:
    out: List[CalibrationRange] = []
    for section in parser.sections():
        if not section.startswith(prefix):
            continue
        idx_txt = section.replace(prefix, "").strip()
        if not idx_txt.isdigit():
            continue
        idx = int(idx_txt)

        low_label = ""
        high_label = ""
        low_actual: Optional[float] = None
        high_actual: Optional[float] = None

        # preserve original order to tie labels to low/high values
        for key, value in parser.items(section):
            if key == "low_actual" and value is not None:
                low_actual = _parse_float(value)
                continue
            if key == "high_actual" and value is not None:
                high_actual = _parse_float(value)
                continue
            # bare keys in original INI are labels
            if value is None:
                if not low_label:
                    low_label = key
                elif not high_label:
                    high_label = key

        if low_actual is None or high_actual is None:
            continue

        out.append(
            CalibrationRange(
                family=family,
                index=idx,
                low_label=low_label,
                low_actual=low_actual,
                high_label=high_label,
                high_actual=high_actual,
            )
        )
    out.sort(key=lambda r: r.index)
    return out


def load_cal_data_ini(path: Path) -> List[CalibrationRange]:
    parser = RawConfigParser(allow_no_value=True)
    parser.optionxform = str.lower
    parser.read(path, encoding="utf-8")

    ranges: List[CalibrationRange] = []
    ranges.extend(_section_ranges(parser, "C Range", "C"))
    ranges.extend(_section_ranges(parser, "L Range", "L"))
    return ranges


MODEL_SECTION_RE = re.compile(r"^(LC\d+)\s+SW$", re.IGNORECASE)


def load_cal_data_ini_identity(path: Path) -> CalDataIdentity:
    parser = RawConfigParser(allow_no_value=True)
    parser.optionxform = str.lower
    parser.read(path, encoding="utf-8")

    model: Optional[str] = None
    version: Optional[str] = None
    for section in parser.sections():
        sec = section.strip()
        m = MODEL_SECTION_RE.match(sec)
        if not m:
            continue
        model = m.group(1).upper()
        if parser.has_option(section, "ver"):
            value = parser.get(section, "ver").strip()
            version = value or None
        break
    return CalDataIdentity(model=model, version=version)


def load_cal_data_ini_version(path: Path) -> Optional[str]:
    return load_cal_data_ini_identity(path).version


def parse_cal_values(lines: Iterable[str]) -> List[float]:
    vals: List[float] = []
    for raw in lines:
        stripped = raw.strip()
        if not stripped:
            continue
        try:
            vals.append(_parse_float(stripped))
        except ValueError:
            # Some field files append explanatory text after numeric rows.
            continue
    return vals


def load_cal_file_pairs(path: Path) -> List[CalPair]:
    values = parse_cal_values(path.read_text(encoding="utf-8", errors="replace").splitlines())
    if len(values) % 2 != 0:
        raise ValueError(f"Expected even number of calibration values in {path}, got {len(values)}")

    pairs: List[CalPair] = []
    # Observed convention in field notes: high then low per range.
    for i in range(0, len(values), 2):
        pair_index = i // 2
        pairs.append(CalPair(index=pair_index, high=values[i], low=values[i + 1]))
    return pairs


def ranges_for_family(ranges: Sequence[CalibrationRange], family: str) -> List[CalibrationRange]:
    fam = family.upper()
    out = [r for r in ranges if r.family.upper() == fam]
    out.sort(key=lambda r: r.index)
    return out


def calibration_fit_score(
    pairs: Sequence[CalPair], ranges: Sequence[CalibrationRange], family: str
) -> Optional[float]:
    fam_ranges = ranges_for_family(ranges, family)
    if not fam_ranges or not pairs:
        return None

    range_by_index: Dict[int, CalibrationRange] = {r.index: r for r in fam_ranges}
    pair_by_index: Dict[int, CalPair] = {p.index: p for p in pairs}
    common_idx = sorted(set(range_by_index.keys()) & set(pair_by_index.keys()))
    if not common_idx:
        return None

    def rel_err(observed: float, expected: float) -> float:
        denom = max(abs(expected), 1e-30)
        return abs(observed - expected) / denom

    total_normal = 0.0
    total_swapped = 0.0
    count = 0
    for idx in common_idx:
        r = range_by_index[idx]
        p = pair_by_index[idx]
        total_normal += rel_err(p.high, r.high_actual) + rel_err(p.low, r.low_actual)
        total_swapped += rel_err(p.high, r.low_actual) + rel_err(p.low, r.high_actual)
        count += 2

    missing_penalty = (len(range_by_index) - len(common_idx)) + (len(pair_by_index) - len(common_idx))
    penalty = float(missing_penalty) * 5.0
    return min(total_normal / count, total_swapped / count) + penalty


def summarize_ranges(ranges: List[CalibrationRange]) -> str:
    if not ranges:
        return "No ranges parsed."
    lines = []
    for r in ranges:
        lines.append(
            f"{r.family}{r.index}: low={r.low_actual:.9g} ({r.low_label}) | "
            f"high={r.high_actual:.9g} ({r.high_label})"
        )
    return "\n".join(lines)


def summarize_pairs(title: str, pairs: List[CalPair]) -> str:
    if not pairs:
        return f"{title}: none"
    lines = [f"{title} ({len(pairs)} ranges):"]
    for p in pairs:
        lines.append(f"  range {p.index}: high={p.high:.9g}, low={p.low:.9g}")
    return "\n".join(lines)
