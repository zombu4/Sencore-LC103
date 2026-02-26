import unittest

from lc103_modern_cal.caldata import CalPair, CalibrationRange
from lc103_modern_cal.legacy_plan import (
    build_legacy_plan,
    default_stage_selection,
    human_readable_wizard_rundown,
)


class LegacyPlanTests(unittest.TestCase):
    def _sample_ranges(self):
        return [
            CalibrationRange("C", 0, "200pF", 200e-12, "1700pF", 1700e-12),
            CalibrationRange("L", 0, "2.0uH", 2e-6, "10uH", 10e-6),
        ]

    def test_default_non_ringer(self) -> None:
        sel = default_stage_selection(include_ringer=False)
        self.assertTrue(sel.get("harness_setup"))
        self.assertTrue(sel.get("pass_fail_indicator"))
        self.assertTrue(sel.get("cal_data_paths"))
        self.assertTrue(sel.get("software_rev"))
        self.assertFalse(sel.get("ringer"))
        self.assertFalse(sel.get("ten_v_ref"))
        self.assertFalse(sel.get("mainboard_fixture_dio"))
        self.assertTrue(sel.get("lead_open_test"))
        self.assertTrue(sel.get("lead_short_test"))
        self.assertFalse(sel.get("power_board_test"))

    def test_build_plan_with_cap_ind_points(self) -> None:
        selected = {
            "software_rev",
            "ten_v_ref",
            "capacitance",
            "inductance",
            "calibration_stamp",
        }
        plan = build_legacy_plan(
            selected_stage_ids=selected,
            ranges=self._sample_ranges(),
            c_pairs=[CalPair(index=0, high=1700e-12, low=200e-12)],
            l_pairs=[CalPair(index=0, high=10e-6, low=2e-6)],
        )
        ids = [s.id for s in plan]
        self.assertIn("software_rev", ids)
        self.assertIn("ten_v_ref", ids)
        self.assertIn("cap_r0_low", ids)
        self.assertIn("cap_r0_high", ids)
        self.assertIn("ind_r0_low", ids)
        self.assertIn("ind_r0_high", ids)
        self.assertIn("calibration_stamp", ids)

    def test_ten_v_ref_prompt_contains_tp_and_r1045(self) -> None:
        plan = build_legacy_plan(
            selected_stage_ids={"ten_v_ref"},
            ranges=[],
            c_pairs=[],
            l_pairs=[],
        )
        step = next(s for s in plan if s.id == "ten_v_ref")
        self.assertIn("TP1006", step.prompt)
        self.assertIn("TP1020", step.prompt)
        self.assertIn("R1045", step.prompt)

    def test_harness_and_cal_data_path_steps_include_recovered_text(self) -> None:
        plan = build_legacy_plan(
            selected_stage_ids={"harness_setup", "pass_fail_indicator", "cal_data_paths"},
            ranges=[],
            c_pairs=[],
            l_pairs=[],
        )
        harness = next(s for s in plan if s.id == "harness_setup")
        pass_fail = next(s for s in plan if s.id == "pass_fail_indicator")
        files = next(s for s in plan if s.id == "cal_data_paths")
        self.assertIn("PA251", harness.prompt)
        self.assertIn("39G219", harness.prompt)
        self.assertIn("final test box", harness.prompt.lower())
        self.assertIn("Fluke 8840A", harness.prompt)
        self.assertIn("50 pin ribbon cable", harness.prompt)
        self.assertIn("Pass/ Fail Indicator", pass_fail.prompt)
        self.assertIn("P071_03.CAL", files.prompt)
        self.assertIn("P072_1.CAL", files.prompt)
        self.assertTrue(any("press f1 to change paths" in m.lower() for m in files.expected_markers))

    def test_software_rev_includes_recovered_invalid_rev_and_disk_prompts(self) -> None:
        plan = build_legacy_plan(
            selected_stage_ids={"software_rev"},
            ranges=[],
            c_pairs=[],
            l_pairs=[],
        )
        step = next(s for s in plan if s.id == "software_rev")
        joined = " ".join(step.expected_markers).lower()
        self.assertIn("invalid software rev. number", joined)
        self.assertIn("flopply disk in the computer now", joined)
        self.assertIn("f1", step.prompt.lower())
        self.assertTrue(any("couldn't open the software rev. file" in m.lower() for m in step.fail_markers))

    def test_cal_data_paths_includes_cal_wildcard_and_fail_markers(self) -> None:
        plan = build_legacy_plan(
            selected_stage_ids={"cal_data_paths"},
            ranges=[],
            c_pairs=[],
            l_pairs=[],
        )
        step = next(s for s in plan if s.id == "cal_data_paths")
        self.assertTrue(any("*.cal" in m.lower() for m in step.expected_markers))
        self.assertTrue(any("couldn't retrieve the proper software rev. number" in m.lower() for m in step.fail_markers))

    def test_plan_contains_start_and_finish(self) -> None:
        plan = build_legacy_plan(
            selected_stage_ids={"software_rev"},
            ranges=[],
            c_pairs=[],
            l_pairs=[],
        )
        self.assertEqual("startup_select", plan[0].id)
        self.assertEqual("finish", plan[-1].id)
        self.assertTrue(plan[0].ready_markers)
        self.assertIn("press to start", [m.lower() for m in plan[0].expected_markers])

    def test_plan_has_no_template_commands(self) -> None:
        plan = build_legacy_plan(
            selected_stage_ids={"capacitance", "inductance", "da_test"},
            ranges=self._sample_ranges(),
            c_pairs=[CalPair(index=0, high=1700e-12, low=200e-12)],
            l_pairs=[CalPair(index=0, high=10e-6, low=2e-6)],
        )
        for step in plan:
            for cmd in step.commands:
                self.assertFalse(cmd.startswith("#"))

    def test_range_steps_include_range_metadata(self) -> None:
        plan = build_legacy_plan(
            selected_stage_ids={"capacitance", "inductance"},
            ranges=self._sample_ranges(),
            c_pairs=[CalPair(index=0, high=1700e-12, low=200e-12)],
            l_pairs=[CalPair(index=0, high=10e-6, low=2e-6)],
        )
        cap_low = next(s for s in plan if s.id == "cap_r0_low")
        ind_high = next(s for s in plan if s.id == "ind_r0_high")
        self.assertEqual("C", cap_low.range_family)
        self.assertEqual(0, cap_low.range_index)
        self.assertEqual("low", cap_low.range_kind)
        self.assertEqual("L", ind_high.range_family)
        self.assertEqual(0, ind_high.range_index)
        self.assertEqual("high", ind_high.range_kind)

    def test_critical_stages_have_ready_or_pass_fail_markers(self) -> None:
        selected = {"current_source", "gain", "esr", "leakage_v_cal", "calibration_stamp"}
        plan = build_legacy_plan(
            selected_stage_ids=selected,
            ranges=self._sample_ranges(),
            c_pairs=[CalPair(index=0, high=1700e-12, low=200e-12)],
            l_pairs=[CalPair(index=0, high=10e-6, low=2e-6)],
        )
        by_id = {s.id: s for s in plan}
        self.assertTrue(by_id["current_source"].ready_markers)
        self.assertTrue(by_id["current_source"].pass_markers)
        self.assertTrue(by_id["current_source"].fail_markers)
        self.assertTrue(by_id["gain"].pass_markers)
        self.assertTrue(any("range !gain calibration failed" in m.lower() for m in by_id["gain"].expected_markers))
        self.assertTrue(any("gain adjustment>10%" in m.lower() for m in by_id["gain"].fail_markers))
        self.assertTrue(by_id["esr"].pass_markers)
        self.assertTrue(by_id["leakage_v_cal"].pass_markers)
        self.assertTrue(any("set high ls to 1000v" in m.lower() for m in by_id["leakage_v_cal"].expected_markers))
        self.assertTrue(by_id["calibration_stamp"].ready_markers)
        self.assertIn("Lowest Current Range", by_id["current_source"].prompt)
        self.assertTrue(any("cal offset" in m.lower() for m in by_id["current_source"].expected_markers))
        self.assertTrue(any("range +current source calibration passed" in m.lower() for m in by_id["current_source"].pass_markers))
        self.assertTrue(any("set serial number" in m.lower() for m in by_id["calibration_stamp"].expected_markers))

    def test_ringer_and_leakage_prompts_include_new_unfiltered_findings(self) -> None:
        selected = {"ringer", "leakage_i_test"}
        plan = build_legacy_plan(
            selected_stage_ids=selected,
            ranges=[],
            c_pairs=[],
            l_pairs=[],
        )
        by_id = {s.id: s for s in plan}
        self.assertIn("Small Ringer Cal Box", by_id["ringer_yokes"].prompt)
        self.assertIn("Switch the cal box to Switching Transformers", by_id["ringer_switching"].prompt)
        self.assertIn("Load Select", by_id["leakage_i_test"].prompt)
        self.assertIn("1.111E6", by_id["leakage_i_test"].prompt)
        self.assertTrue(any("sense resistor" in m.lower() for m in by_id["leakage_i_test"].expected_markers))

    def test_da_leakage_v_and_inductance_prompts_include_recovered_details(self) -> None:
        selected = {"da_test", "leakage_v_cal", "leakage_v_test", "inductance"}
        plan = build_legacy_plan(
            selected_stage_ids=selected,
            ranges=self._sample_ranges(),
            c_pairs=[],
            l_pairs=[],
        )
        by_id = {s.id: s for s in plan}
        self.assertIn("Switch in D/A Standard", by_id["da_test"].prompt)
        self.assertIn("0% D/A", by_id["da_test"].prompt)
        self.assertIn("10% D/A", by_id["da_test"].prompt)
        self.assertIn("1000V", by_id["leakage_v_cal"].prompt)
        self.assertIn("500V", by_id["leakage_v_test"].prompt)
        self.assertIn("Low Value Inductance Box", by_id["ind_conn"].prompt)

    def test_pair_values_auto_resolve_when_reversed(self) -> None:
        selected = {"capacitance", "inductance"}
        plan = build_legacy_plan(
            selected_stage_ids=selected,
            ranges=self._sample_ranges(),
            c_pairs=[CalPair(index=0, high=200e-12, low=1700e-12)],
            l_pairs=[CalPair(index=0, high=2e-6, low=10e-6)],
        )
        by_id = {s.id: s for s in plan}
        self.assertIn("actual 2e-10 F", by_id["cap_r0_low"].prompt)
        self.assertIn("actual 1.7e-09 F", by_id["cap_r0_high"].prompt)
        self.assertIn("actual 2e-06 H", by_id["ind_r0_low"].prompt)
        self.assertIn("actual 1e-05 H", by_id["ind_r0_high"].prompt)

    def test_implausible_pair_values_fall_back_to_ini_actuals(self) -> None:
        selected = {"inductance"}
        plan = build_legacy_plan(
            selected_stage_ids=selected,
            ranges=self._sample_ranges(),
            c_pairs=[],
            l_pairs=[CalPair(index=0, high=8.1288, low=1.9915)],
        )
        by_id = {s.id: s for s in plan}
        self.assertIn("actual 2e-06 H", by_id["ind_r0_low"].prompt)
        self.assertIn("actual 1e-05 H", by_id["ind_r0_high"].prompt)
        self.assertNotIn("8.1288 H", by_id["ind_r0_high"].prompt)

    def test_human_readable_rundown_contains_numbered_steps_and_commands(self) -> None:
        selected = {"ten_v_ref", "current_source"}
        plan = build_legacy_plan(
            selected_stage_ids=selected,
            ranges=[],
            c_pairs=[],
            l_pairs=[],
        )
        txt = human_readable_wizard_rundown(plan)
        self.assertIn("LC103 CALIBRATION WIZARD RUNDOWN", txt)
        self.assertIn("1. All (Not Ringer) / Start Button", txt)
        self.assertIn("10V Ref Calibration", txt)
        self.assertIn("Current Source Calibration", txt)
        self.assertIn("Commands: CALCHK", txt)

    def test_optional_tester_and_lead_steps_include_recovered_markers(self) -> None:
        selected = {
            "mainboard_fixture_dio",
            "lead_open_test",
            "lead_short_test",
            "power_board_test",
        }
        plan = build_legacy_plan(
            selected_stage_ids=selected,
            ranges=[],
            c_pairs=[],
            l_pairs=[],
        )
        by_id = {s.id: s for s in plan}
        self.assertIn("send DIO setting to tester", by_id["mainboard_fixture_dio"].prompt)
        self.assertIn("Lead Open Test/Caps", by_id["lead_open_test"].prompt)
        self.assertIn("Lead Zero Short Test/Inductance", by_id["lead_short_test"].prompt)
        self.assertIn("Turn Safety switch ON", by_id["power_board_test"].prompt)
        self.assertTrue(any("mainboard tester (#74c216-1)" in m.lower() for m in by_id["mainboard_fixture_dio"].expected_markers))


if __name__ == "__main__":
    unittest.main()
