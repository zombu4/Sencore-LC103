import tempfile
import unittest
from pathlib import Path

from lc103_modern_cal.autoselect import (
    choose_best_ini_candidate,
    discover_cap_ind_cal_files,
    discover_ini_candidates,
    parse_device_identity,
    parse_version_from_device_text,
)


def _write_ini(path: Path, version: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(f"[LC103 SW]\nver={version}\n", encoding="utf-8")


class AutoSelectTests(unittest.TestCase):
    def test_parse_version_from_device_text(self) -> None:
        self.assertEqual("1.53", parse_version_from_device_text("LC103 SOFTWARE VER1.53"))
        self.assertEqual("1.50", parse_version_from_device_text("VER 1.50"))
        self.assertIsNone(parse_version_from_device_text("HELLO"))
        ident = parse_device_identity("LC103 SOFTWARE VER1.53")
        self.assertEqual("LC103", ident.model)
        self.assertEqual("1.53", ident.version)

    def test_choose_best_candidate_version_match(self) -> None:
        with tempfile.TemporaryDirectory() as td:
            home = Path(td)
            p153 = home / "Downloads" / "LC103" / "LC103 Final Cal" / "LC103 Cal Data.ini"
            p150 = home / "LC103" / "LC103 Final Cal" / "LC103 Cal Data.ini"
            _write_ini(p153, "1.53")
            _write_ini(p150, "1.50")

            candidates = discover_ini_candidates(home=home)
            chosen, reason = choose_best_ini_candidate(
                candidates, preferred_version="1.50", preferred_model="LC103", strict_model=True
            )

        self.assertIsNotNone(chosen)
        assert chosen is not None
        self.assertEqual("1.50", chosen.version)
        self.assertEqual("model_version_match", reason)

    def test_choose_best_candidate_fallback(self) -> None:
        with tempfile.TemporaryDirectory() as td:
            home = Path(td)
            p153 = home / "Downloads" / "LC103" / "LC103 Final Cal" / "LC103 Cal Data.ini"
            _write_ini(p153, "1.53")

            candidates = discover_ini_candidates(home=home)
            chosen, reason = choose_best_ini_candidate(
                candidates, preferred_version="9.99", preferred_model="LC103", strict_model=True
            )

        self.assertIsNotNone(chosen)
        assert chosen is not None
        self.assertEqual("1.53", chosen.version)
        self.assertEqual("model_match", reason)

    def test_discover_cap_ind_cal_files(self) -> None:
        with tempfile.TemporaryDirectory() as td:
            home = Path(td)
            lc = home / "Downloads" / "LC103"
            lc.mkdir(parents=True, exist_ok=True)
            (lc / "P071_03.CAL").write_text("1\n2\n", encoding="utf-8")
            (lc / "P072_1.cal").write_text("3\n4\n", encoding="utf-8")
            (lc / "Old Cal Files").mkdir(parents=True, exist_ok=True)
            (lc / "Old Cal Files" / "P072_10.CAL").write_text("5\n6\n", encoding="utf-8")

            sel = discover_cap_ind_cal_files(home=home)

        self.assertIsNotNone(sel.cap_path)
        self.assertIsNotNone(sel.ind_path)
        assert sel.cap_path is not None and sel.ind_path is not None
        self.assertEqual("p071_03.cal", sel.cap_path.name.lower())
        self.assertEqual("p072_1.cal", sel.ind_path.name.lower())


if __name__ == "__main__":
    unittest.main()
