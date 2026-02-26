import unittest

from lc103_modern_cal.workflow import (
    WorkflowStep,
    is_do_next_after_pass_marker,
    is_next_range_marker,
    is_start_prompt_marker,
    is_wait_for_start_click_marker,
    match_comms_fault_marker,
    match_global_fail_marker,
    match_global_pass_marker,
    match_future_step_marker,
    match_softrev_path_action_marker,
    match_softrev_path_error_marker,
    match_step_fail_marker,
    match_step_marker,
    match_step_pass_marker,
    match_step_ready_marker,
    recovered_final_cal_workflow,
)


class WorkflowTests(unittest.TestCase):
    def test_match_current_step_marker(self) -> None:
        steps = recovered_final_cal_workflow()
        step = steps[0]  # software rev
        marker = match_step_marker(step, "Software Rev. Check")
        self.assertIsNotNone(marker)

    def test_match_future_step_marker(self) -> None:
        steps = recovered_final_cal_workflow()
        res = match_future_step_marker(steps, 0, "Capacitance Calibration")
        self.assertIsNotNone(res)
        assert res is not None
        idx, marker = res
        self.assertGreater(idx, 0)
        self.assertTrue(marker)

    def test_no_marker_match(self) -> None:
        steps = recovered_final_cal_workflow()
        step = steps[0]
        marker = match_step_marker(step, "random unrelated response")
        self.assertIsNone(marker)

    def test_ready_pass_fail_markers(self) -> None:
        step = WorkflowStep(
            id="x",
            title="x",
            prompt="x",
            ready_markers=["press 'enter' when ready"],
            pass_markers=["calibration passed"],
            fail_markers=["failed calibration"],
        )
        self.assertIsNotNone(match_step_ready_marker(step, "Press 'Enter' when ready."))
        self.assertIsNotNone(match_step_pass_marker(step, "Current Source Calibration Passed"))
        self.assertIsNotNone(match_step_fail_marker(step, "Failed Calibration. Offset Adjustment too high"))

    def test_next_range_marker(self) -> None:
        self.assertTrue(is_next_range_marker("Next Range to cal"))
        self.assertFalse(is_next_range_marker("No range change"))

    def test_legacy_flow_global_markers(self) -> None:
        self.assertTrue(is_do_next_after_pass_marker("Do next test if previous test passed"))
        self.assertTrue(is_wait_for_start_click_marker("Wait for start button to be clicked"))
        self.assertTrue(is_start_prompt_marker("Press ENTER when ready, choose test to perform and press START"))
        self.assertIsNotNone(match_global_fail_marker("RS-232 Connection Failed"))
        self.assertIsNotNone(match_global_pass_marker("Calibration successful"))
        self.assertIsNotNone(match_global_fail_marker("Timeout waiting for prompt"))
        self.assertIsNotNone(match_global_fail_marker("AbortedUnloadObject"))

    def test_comms_fault_and_softrev_path_markers(self) -> None:
        self.assertIsNotNone(match_comms_fault_marker("communication error."))
        self.assertIsNotNone(match_comms_fault_marker("DevAbort"))
        self.assertIsNotNone(match_comms_fault_marker("ChkHandlerTimeout"))

        self.assertIsNotNone(match_softrev_path_action_marker("Press F1 to change paths."))
        self.assertIsNotNone(
            match_softrev_path_action_marker("Please choose the file containing the capacitance calibration data")
        )
        self.assertIsNotNone(match_softrev_path_error_marker("Couldn't open the software rev. file"))
        self.assertIsNotNone(match_softrev_path_error_marker("An invalid Software Rev. number was specified."))


if __name__ == "__main__":
    unittest.main()
