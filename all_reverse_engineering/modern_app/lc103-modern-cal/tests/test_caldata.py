import tempfile
import unittest
from pathlib import Path

from lc103_modern_cal.caldata import load_cal_data_ini, load_cal_data_ini_version, load_cal_file_pairs


INI_SAMPLE = """[LC103 SW]
ver=1.53

[C Range0]
200pF (73P71)
low_actual=202.7E-12
1700pF (73P71)
high_actual=1704.0E-12

[L Range0]
2.00uH (74A144)
low_actual=2.36E-6
10.0uH (74A144)
high_actual=10.32E-6
"""


class CalDataTests(unittest.TestCase):
    def test_load_cal_data_ini(self) -> None:
        with tempfile.TemporaryDirectory() as td:
            p = Path(td) / "LC103 Cal Data.ini"
            p.write_text(INI_SAMPLE, encoding="utf-8")
            ranges = load_cal_data_ini(p)

        self.assertEqual(2, len(ranges))
        self.assertEqual("C", ranges[0].family)
        self.assertEqual(0, ranges[0].index)
        self.assertAlmostEqual(202.7e-12, ranges[0].low_actual)
        self.assertAlmostEqual(1704.0e-12, ranges[0].high_actual)

    def test_load_cal_file_pairs(self) -> None:
        with tempfile.TemporaryDirectory() as td:
            p = Path(td) / "P071_03.CAL"
            p.write_text("1.0\n2.0\n3.0\n4.0\n", encoding="utf-8")
            pairs = load_cal_file_pairs(p)

        self.assertEqual(2, len(pairs))
        self.assertEqual(0, pairs[0].index)
        self.assertEqual(1.0, pairs[0].high)
        self.assertEqual(2.0, pairs[0].low)

    def test_load_cal_file_pairs_with_comment_lines(self) -> None:
        with tempfile.TemporaryDirectory() as td:
            p = Path(td) / "P072_1.cal"
            p.write_text(
                "8.1\n1.9\n1.4\n0.2\n\nThere are 7 cal ranges.\nmore words\n",
                encoding="utf-8",
            )
            pairs = load_cal_file_pairs(p)
        self.assertEqual(2, len(pairs))

    def test_load_ini_version(self) -> None:
        with tempfile.TemporaryDirectory() as td:
            p = Path(td) / "LC103 Cal Data.ini"
            p.write_text(INI_SAMPLE, encoding="utf-8")
            ver = load_cal_data_ini_version(p)
        self.assertEqual("1.53", ver)


if __name__ == "__main__":
    unittest.main()
