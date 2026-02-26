import unittest

from lc103_modern_cal.backup import (
    BACKUP_QUERY_COMMANDS,
    build_restore_commands,
    build_snapshot,
    parse_calf_factors,
    restore_commands_from_backup_doc,
    snapshot_to_dict,
)


class BackupTests(unittest.TestCase):
    def test_parse_calf_factors(self) -> None:
        text = "R0=1.23E-3\n1,2.5\nRANGE 2: 3.75e-6\n"
        factors = parse_calf_factors(text)
        self.assertEqual(3, len(factors))
        self.assertAlmostEqual(1.23e-3, factors[0])
        self.assertAlmostEqual(2.5, factors[1])
        self.assertAlmostEqual(3.75e-6, factors[2])

    def test_build_restore_commands(self) -> None:
        cmds = build_restore_commands({2: 0.22, 0: 1.0}, calibration_date="2026-02-24")
        self.assertEqual("CALON", cmds[0])
        self.assertIn("CALF 00 1.0000E+00", cmds)
        self.assertIn("CALF 02 2.2000E-01", cmds)
        self.assertIn("CALDATE 2026-02-24", cmds)
        self.assertEqual("CALOFF", cmds[-1])

    def test_build_snapshot_and_doc(self) -> None:
        responses = {
            "SER#?": ["SER#: LC103-ABC123"],
            "VER#?": ["LC103 SOFTWARE VER1.53"],
            "CALDATE?": ["02/24/2026"],
            "CALCHK": ["OK"],
            "CALF?": ["0,1.0", "1,0.5"],
        }
        snap = build_snapshot(responses=responses, transcript=["RX sample"], query_commands=BACKUP_QUERY_COMMANDS)
        doc = snapshot_to_dict(snap)

        self.assertEqual("LC103", doc["device_model"])
        self.assertEqual("1.53", doc["firmware_revision"])
        self.assertEqual("LC103-ABC123", doc["serial_number"])
        self.assertEqual("2026-02-24", doc["calibration_date"])
        self.assertTrue(doc["restore_commands"])  # factors parsed

    def test_restore_commands_from_doc_fallback(self) -> None:
        doc = {
            "parsed_calf_factors": {"0": 1.0, "1": 0.5},
            "calibration_date": "02/24/2026",
        }
        cmds = restore_commands_from_backup_doc(doc)
        self.assertTrue(cmds)
        self.assertEqual("CALON", cmds[0])
        self.assertIn("CALF 00 1.0000E+00", cmds)
        self.assertIn("CALF 01 5.0000E-01", cmds)


if __name__ == "__main__":
    unittest.main()
