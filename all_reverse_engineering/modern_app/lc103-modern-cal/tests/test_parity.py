import unittest

from lc103_modern_cal.caldata import CalPair, CalibrationRange
from lc103_modern_cal.legacy_plan import build_legacy_plan
from lc103_modern_cal.parity import extract_rx_lines_from_text, replay_legacy_workflow


class ParityReplayTests(unittest.TestCase):
    def _sample_ranges(self):
        return [
            CalibrationRange("C", 0, "200pF", 200e-12, "1700pF", 1700e-12),
        ]

    def test_extract_rx_lines_accepts_prefixed_and_raw(self) -> None:
        text = "[12:00:00.000] RX: Software Rev. Check\nRAW RX LINE\n[12:00] TX: CALCHK\n"
        lines = extract_rx_lines_from_text(text)
        self.assertEqual("Software Rev. Check", lines[0])
        self.assertIn("RAW RX LINE", lines)

    def test_replay_advances_start_and_do_next(self) -> None:
        steps = build_legacy_plan(
            selected_stage_ids={"software_rev", "current_source"},
            ranges=self._sample_ranges(),
            c_pairs=[CalPair(index=0, high=1700e-12, low=200e-12)],
            l_pairs=[],
        )
        rx = [
            "Wait for start button to be clicked",
            "Press ENTER when ready, choose test to perform and press START.",
            "All  (Not Ringer)",
            "Software Rev. Check",
            "Press 'Enter' when ready.",
            "Current Source Calibration",
            "Press 'Enter' when ready.",
            "Current Source Calibration Passed",
            "$$$Do next test if previous test passed",
        ]
        result = replay_legacy_workflow(steps, rx, auto_sync=True, auto_advance=True)
        self.assertTrue(result.start_gate_passed)
        self.assertIn("startup_select", result.completed_step_ids)
        self.assertIn("software_rev", result.completed_step_ids)
        self.assertIn("current_source", result.completed_step_ids)
        self.assertEqual("finish", steps[result.final_index].id)

    def test_replay_next_range_advances_high_to_next_low(self) -> None:
        ranges = [
            CalibrationRange("C", 0, "200pF", 200e-12, "1700pF", 1700e-12),
            CalibrationRange("C", 1, "0.004uF", 0.004e-6, "0.018uF", 0.018e-6),
        ]
        steps = build_legacy_plan(
            selected_stage_ids={"capacitance"},
            ranges=ranges,
            c_pairs=[
                CalPair(index=0, high=1700e-12, low=200e-12),
                CalPair(index=1, high=0.018e-6, low=0.004e-6),
            ],
            l_pairs=[],
        )
        rx = [
            "Press to start",
            "all  (not ringer)",
            "capacitance calibration",
            "press 'enter' when ready",
            "capacitance calibration",
            "and press 'enter' when ready",
            "next range to cal",
        ]
        result = replay_legacy_workflow(steps, rx, auto_sync=True, auto_advance=True)
        self.assertTrue(result.start_gate_passed)
        self.assertIn("cap_r0_high", result.completed_step_ids)
        self.assertEqual("cap_r1_low", steps[result.final_index].id)


if __name__ == "__main__":
    unittest.main()
