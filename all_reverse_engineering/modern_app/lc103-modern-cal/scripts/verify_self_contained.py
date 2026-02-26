#!/usr/bin/env python3
from __future__ import annotations

from pathlib import Path
import hashlib
import json
import sys

ROOT = Path(__file__).resolve().parents[1]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from lc103_modern_cal.autoselect import discover_cap_ind_cal_files, discover_ini_candidates
from lc103_modern_cal.caldata import load_cal_data_ini, load_cal_data_ini_identity, load_cal_file_pairs


def sha256(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as f:
        for chunk in iter(lambda: f.read(1024 * 1024), b""):
            h.update(chunk)
    return h.hexdigest()


def main() -> None:
    root = ROOT
    profile = root / "lc103_modern_cal" / "profiles" / "LC103"
    required = [
        profile / "LC103 Cal Data.ini",
        profile / "P071_03.CAL",
        profile / "P072_1.cal",
    ]
    missing = [str(p) for p in required if not p.exists()]
    if missing:
        raise SystemExit("Missing required bundled files: " + ", ".join(missing))

    ident = load_cal_data_ini_identity(required[0])
    ranges = load_cal_data_ini(required[0])
    c_pairs = load_cal_file_pairs(required[1])
    l_pairs = load_cal_file_pairs(required[2])

    ini_candidates = discover_ini_candidates(home=root)
    cal_sel = discover_cap_ind_cal_files(home=root, ini_path=required[0], ranges=ranges)

    report = {
        "profile_dir": str(profile),
        "identity": {"model": ident.model, "version": ident.version},
        "ranges_count": len(ranges),
        "c_pairs": len(c_pairs),
        "l_pairs": len(l_pairs),
        "auto_ini_candidates": [str(c.path) for c in ini_candidates],
        "auto_cap": str(cal_sel.cap_path) if cal_sel.cap_path else None,
        "auto_ind": str(cal_sel.ind_path) if cal_sel.ind_path else None,
        "hashes": {p.name: sha256(p) for p in required},
    }

    print(json.dumps(report, indent=2))


if __name__ == "__main__":
    main()
