from __future__ import annotations

from dataclasses import dataclass
from pathlib import Path
import re
from typing import Iterable, List, Optional, Sequence, Tuple

from .caldata import calibration_fit_score, load_cal_data_ini_identity, load_cal_data_ini_version, load_cal_file_pairs

MODEL_RE = re.compile(r"\b(LC\d{2,4})\b", re.IGNORECASE)
VERSION_RE = re.compile(r"(?:VER\s*)?(\d+\.\d+)", re.IGNORECASE)


@dataclass(frozen=True)
class DeviceIdentity:
    model: Optional[str]
    version: Optional[str]


@dataclass(frozen=True)
class IniCandidate:
    path: Path
    model: Optional[str]
    version: Optional[str]


@dataclass(frozen=True)
class CalFileSelection:
    cap_path: Optional[Path]
    ind_path: Optional[Path]
    cap_reason: str
    ind_reason: str


def parse_device_identity(text: str) -> DeviceIdentity:
    model_m = MODEL_RE.search(text)
    version_m = VERSION_RE.search(text)
    model = model_m.group(1).upper() if model_m else None
    version = version_m.group(1) if version_m else None
    return DeviceIdentity(model=model, version=version)


def parse_version_from_device_text(text: str) -> Optional[str]:
    return parse_device_identity(text).version


def _candidate_ini_paths(base: Path) -> List[Path]:
    bundled = Path(__file__).resolve().parent / "profiles" / "LC103"
    fixed = [
        bundled / "LC103 Cal Data.ini",
        base / "Downloads" / "LC103" / "LC103 Final Cal" / "LC103 Cal Data.ini",
        base / "LC103" / "LC103 Final Cal" / "LC103 Cal Data.ini",
        base / "LC103" / "source_downloads" / "LC103 Final Cal" / "LC103 Cal Data.ini",
    ]
    roots = [
        bundled,
        base / "Downloads",
        base / "LC103",
        base / "LC103" / "source_downloads",
    ]

    found: List[Path] = []
    seen = set()

    for p in fixed:
        rp = p.resolve()
        if rp in seen:
            continue
        seen.add(rp)
        if rp.exists():
            found.append(rp)

    for root in roots:
        if not root.exists():
            continue
        for p in root.rglob("*.ini"):
            low = p.name.lower()
            if "cal data" not in low:
                continue
            rp = p.resolve()
            if rp in seen:
                continue
            seen.add(rp)
            found.append(rp)
    return found


def discover_ini_candidates(home: Optional[Path] = None) -> List[IniCandidate]:
    base = home or Path.home()
    out: List[IniCandidate] = []
    for path in _candidate_ini_paths(base):
        model = None
        version = None
        try:
            ident = load_cal_data_ini_identity(path)
            model = ident.model
            version = ident.version
        except Exception:
            version = None
            try:
                version = load_cal_data_ini_version(path)
            except Exception:
                version = None
        out.append(IniCandidate(path=path, model=model, version=version))
    return out


def choose_best_ini_candidate(
    candidates: Sequence[IniCandidate],
    preferred_version: Optional[str] = None,
    preferred_model: Optional[str] = None,
    strict_model: bool = False,
) -> Tuple[Optional[IniCandidate], str]:
    if not candidates:
        return None, "no_candidates"

    model_target = preferred_model.strip().upper() if preferred_model else None
    version_target = preferred_version.strip().lower() if preferred_version else None

    pool = list(candidates)
    if strict_model and model_target:
        strict = [c for c in candidates if c.model and c.model.upper() == model_target]
        if strict:
            pool = strict
        else:
            return None, "strict_model_no_match"

    if model_target and version_target:
        for c in pool:
            if c.model and c.version and c.model.upper() == model_target and c.version.strip().lower() == version_target:
                return c, "model_version_match"

    if model_target:
        for c in pool:
            if c.model and c.model.upper() == model_target:
                return c, "model_match"

    if version_target:
        for c in pool:
            if c.version and c.version.strip().lower() == version_target:
                return c, "version_match"

    for c in pool:
        if c.model:
            return c, "fallback_with_model"

    for c in pool:
        if c.version:
            return c, "fallback_with_version"

    return pool[0], "fallback_first"


def format_candidate_list(candidates: Iterable[IniCandidate]) -> str:
    entries = []
    for c in candidates:
        model = c.model if c.model else "unknown-model"
        ver = c.version if c.version else "unknown-ver"
        entries.append(f"{c.path} [model={model}, ver={ver}]")
    return "; ".join(entries)


def _candidate_score(path: Path, preferred_name: str) -> Tuple[int, int, int]:
    name = path.name.lower()
    parts = {p.lower() for p in path.parts}
    old_penalty = 1 if "old cal files" in parts else 0
    exact_preferred = 1 if name == preferred_name else 0
    in_root_bonus = 1 if len(path.parts) >= 2 and path.parent.name.lower() == "lc103" else 0
    return (old_penalty, -exact_preferred, -in_root_bonus)


def _pick_best(
    paths: Sequence[Path],
    preferred_name: str,
    family: str,
    ranges,
) -> Tuple[Optional[Path], str]:
    if not paths:
        return None, "not_found"

    scored = []
    for p in paths:
        fit_score = None
        if ranges:
            try:
                pairs = load_cal_file_pairs(p)
                fit_score = calibration_fit_score(pairs, ranges, family)
            except Exception:
                fit_score = None

        heur = _candidate_score(p, preferred_name)
        fit_rank = 1 if fit_score is None else 0
        fit_val = 1e9 if fit_score is None else float(fit_score)
        scored.append((fit_rank, fit_val, heur, str(p).lower(), p, fit_score))

    scored.sort(key=lambda x: (x[0], x[1], x[2], x[3]))
    best = scored[0]
    best_path = best[4]
    best_fit = best[5]
    if best_path.name.lower() == preferred_name and best_fit is not None:
        return best_path, f"exact_preferred_fit={best_fit:.6g}"
    if best_path.name.lower() == preferred_name:
        return best_path, "exact_preferred"
    if best_fit is not None:
        return best_path, f"fit_best={best_fit:.6g}"
    return best_path, "fallback"


def discover_cap_ind_cal_files(
    home: Optional[Path] = None,
    ini_path: Optional[Path] = None,
    ranges=None,
) -> CalFileSelection:
    base = home or Path.home()
    bundled = Path(__file__).resolve().parent / "profiles" / "LC103"
    roots = []
    if ini_path is not None:
        ini_parent = ini_path.resolve().parent
        roots.append(ini_parent)
        if ini_parent.parent != ini_parent:
            roots.append(ini_parent.parent)
    roots.extend(
        [
            bundled,
            base / "Downloads" / "LC103",
            base / "LC103",
            base / "LC103" / "source_downloads",
        ]
    )

    unique_roots: List[Path] = []
    seen = set()
    for r in roots:
        rr = r.resolve()
        if rr in seen or not rr.exists():
            continue
        seen.add(rr)
        unique_roots.append(rr)

    cap_candidates: List[Path] = []
    ind_candidates: List[Path] = []
    for root in unique_roots:
        for p in root.rglob("*"):
            if not p.is_file():
                continue
            name = p.name.lower()
            if not name.endswith(".cal"):
                continue
            rp = p.resolve()
            if name.startswith("p071"):
                cap_candidates.append(rp)
            elif name.startswith("p072"):
                ind_candidates.append(rp)

    cap_best, cap_reason = _pick_best(cap_candidates, "p071_03.cal", "C", ranges)
    ind_best, ind_reason = _pick_best(ind_candidates, "p072_1.cal", "L", ranges)
    return CalFileSelection(
        cap_path=cap_best,
        ind_path=ind_best,
        cap_reason=cap_reason,
        ind_reason=ind_reason,
    )
