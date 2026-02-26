from __future__ import annotations

from dataclasses import dataclass
from typing import Dict, Iterable, List, Sequence

from .caldata import CalPair, CalibrationRange, ranges_for_family
from .workflow import WorkflowStep


@dataclass(frozen=True)
class LegacyStageOption:
    id: str
    label: str
    default_enabled: bool
    is_ringer: bool = False


LEGACY_STAGE_OPTIONS: List[LegacyStageOption] = [
    LegacyStageOption("harness_setup", "Harness/Test Box Setup", True),
    LegacyStageOption("mainboard_fixture_dio", "Mainboard Fixture DIO Setup", False),
    LegacyStageOption("pass_fail_indicator", "Pass/Fail Indicator Visibility", True),
    LegacyStageOption("cal_data_paths", "Calibration Data File Selection", True),
    LegacyStageOption("software_rev", "Software Rev. Check", True),
    LegacyStageOption("calibration_reset", "Calibration Reset", True),
    LegacyStageOption("lead_open_test", "Lead Open Test (Caps)", True),
    LegacyStageOption("lead_short_test", "Lead Zero Short Test (Inductance/ESR)", True),
    LegacyStageOption("ten_v_ref", "10V Ref Calibration", False),
    LegacyStageOption("current_source", "Current Source Calibration", True),
    LegacyStageOption("gain", "Gain Calibration", True),
    LegacyStageOption("capacitance", "Capacitance Calibration", True),
    LegacyStageOption("esr", "ESR Calibration", True),
    LegacyStageOption("inductance", "Inductance Calibration", True),
    LegacyStageOption("ringer", "Ringer Calibration", False, is_ringer=True),
    LegacyStageOption("leakage_v_cal", "Leakage Voltage Calibration", True),
    LegacyStageOption("da_test", "D/A Test", True),
    LegacyStageOption("leakage_v_test", "Leakage Voltage Test", True),
    LegacyStageOption("leakage_i_test", "Leakage Current Test", True),
    LegacyStageOption("calibration_stamp", "Calibration Stamp", True),
    LegacyStageOption("power_board_test", "Power Board Tester Flow", False),
]


def default_stage_selection(include_ringer: bool = False) -> Dict[str, bool]:
    out: Dict[str, bool] = {}
    for opt in LEGACY_STAGE_OPTIONS:
        if opt.is_ringer and not include_ringer:
            out[opt.id] = False
        else:
            out[opt.id] = opt.default_enabled or (include_ringer and opt.is_ringer)
    return out


def _label_from_range(r: CalibrationRange, kind: str) -> str:
    if kind == "low":
        return r.low_label.strip() or f"range {r.index} low"
    return r.high_label.strip() or f"range {r.index} high"


def _pair_map(pairs: Sequence[CalPair]) -> Dict[int, CalPair]:
    return {p.index: p for p in pairs}


def _resolved_pair_values(r: CalibrationRange, pair: CalPair | None) -> tuple[float, float]:
    if pair is None:
        return r.low_actual, r.high_actual
    normal_low = pair.low
    normal_high = pair.high
    swapped_low = pair.high
    swapped_high = pair.low

    # Some captured .CAL files and field notes disagree on row order (high/low vs low/high).
    # Resolve per-range by choosing the orientation that best matches the INI low/high actuals.
    def rel_err(observed: float, expected: float) -> float:
        return abs(observed - expected) / max(abs(expected), 1e-30)

    normal_err = rel_err(normal_low, r.low_actual) + rel_err(normal_high, r.high_actual)
    swapped_err = rel_err(swapped_low, r.low_actual) + rel_err(swapped_high, r.high_actual)
    best_err = min(normal_err, swapped_err)

    # If neither orientation resembles the known physical range values, trust INI values.
    if best_err > 0.5:
        return r.low_actual, r.high_actual
    if swapped_err < normal_err:
        return swapped_low, swapped_high
    return normal_low, normal_high


def human_readable_wizard_rundown(steps: Sequence[WorkflowStep]) -> str:
    lines: List[str] = []
    lines.append("LC103 CALIBRATION WIZARD RUNDOWN")
    lines.append("")
    for idx, step in enumerate(steps, start=1):
        lines.append(f"{idx}. {step.title}")
        for raw_line in step.prompt.splitlines():
            txt = raw_line.strip()
            if txt:
                lines.append(txt)
        if step.commands:
            lines.append(f"Commands: {', '.join(step.commands)}")
        lines.append("")
    return "\n".join(lines).rstrip() + "\n"


def build_legacy_plan(
    selected_stage_ids: Iterable[str],
    ranges: Sequence[CalibrationRange],
    c_pairs: Sequence[CalPair],
    l_pairs: Sequence[CalPair],
) -> List[WorkflowStep]:
    selected = set(selected_stage_ids)
    steps: List[WorkflowStep] = []

    steps.append(
        WorkflowStep(
            id="startup_select",
            title="All (Not Ringer) / Start Button",
            prompt=(
                "Legacy UI flow: select stage set (typically All (Not Ringer)), then press Start Button. "
                "Use Continue Button to advance each prompt. "
                "Gate text recovered from old flow: 'Press ENTER when ready, choose test to perform and press START.'"
            ),
            expected_markers=[
                "all  (not ringer)",
                "start button",
                "press to start",
                "wait for start button to be clicked",
                "continue button",
            ],
            ready_markers=[
                "press enter when ready, choose test to perform and press start",
                "press ready when previous step is complete",
            ],
        )
    )

    if "harness_setup" in selected:
        steps.append(
            WorkflowStep(
                id="harness_setup",
                title="Harness/Test Box Setup",
                prompt=(
                    "Prepare legacy final-cal bench harness before calibration:\n"
                    "1) Connect PA251 power adapter to rear of LC103.\n"
                    "2) Connect RS-232 cable from host PC to LC103 RS-232 port.\n"
                    "3) Connect 39G219 test-lead cable from LC103 front panel to final test box.\n"
                    "4) Connect IEEE cable to RS232 interface port on back-left side of UUT.\n"
                    "5) Power on UUT and verify software revision display.\n"
                    "Legacy fixture variant also appears in source:\n"
                    "- Mainboard tester (#74C216-1) with Fluke 8840A and 50 pin ribbon cable."
                ),
                expected_markers=[
                    "connect the 39g219-test lead cable from the front of the uut to the final test box",
                    "hook up the ieee cable to the rs232 interface port located on the back left side of the uut",
                    "attach power adapter and rs-232 cable to lc103",
                    "connect fluke 8840a to dvm plugs on front panel of test box",
                    "connect 50 pin ribbon cable from pc to right side of test box",
                    "press enter when ready, choose test to perform and press start",
                ],
                ready_markers=["press 'enter' when ready", "press ready when previous step is complete"],
            )
        )

    if "pass_fail_indicator" in selected:
        steps.append(
            WorkflowStep(
                id="pass_fail_indicator",
                title="Pass/Fail Indicator Visibility",
                prompt=(
                    "Set Pass/ Fail Indicator and make it visible before running tests. "
                    "Recovered flow also toggles Pass/Fail button invisible in some transitions; ensure visible for operator run."
                ),
                expected_markers=[
                    "set pass/ fail indicator and make it visible",
                    "pass/ fail",
                    "set pass/fail button to invisible",
                ],
                ready_markers=["press 'enter' when ready", "press ready when previous step is complete"],
            )
        )

    if "mainboard_fixture_dio" in selected:
        steps.append(
            WorkflowStep(
                id="mainboard_fixture_dio",
                title="Mainboard Fixture DIO Setup",
                prompt=(
                    "Legacy mainboard fixture branch (74C216-1):\n"
                    "1) Plug in and turn on LC103 mainboard test box.\n"
                    "2) Attach power adapter and RS-232 to LC103.\n"
                    "3) Connect Fluke 8840A to DVM plugs on test box.\n"
                    "4) Connect Lo Capacity leads to UUT plugs.\n"
                    "5) Connect 50 pin ribbon cable from PC to test box.\n"
                    "Then send DIO setting to tester and continue."
                ),
                expected_markers=[
                    "mainboard tester (#74c216-1)",
                    "send dio setting to tester",
                    "plug in and turn on lc103 mainboard test box",
                    "connect 50 pin ribbon cable from pc to right side of test box",
                ],
                ready_markers=["press 'enter' when ready", "press ready when previous step is complete"],
            )
        )

    if "cal_data_paths" in selected:
        steps.append(
            WorkflowStep(
                id="cal_data_paths",
                title="Calibration Data File Selection",
                prompt=(
                    "Use F1/path controls first if prompted, then select calibration data files:\n"
                    "- Capacitance: P071_03.CAL\n"
                    "- Inductance: P072_1.CAL or approved matching variant.\n"
                    "If file/path prompts loop, re-open path selector with F1 and re-select both .CAL files before continuing."
                ),
                expected_markers=[
                    "press f1 to change paths",
                    "please choose the file containing the capacitance calibration data",
                    "please choose the file containing the inductance calibration data",
                    "*.cal",
                ],
                fail_markers=["couldn't open the software rev. file", "couldn't retrieve the proper software rev. number"],
                ready_markers=["press 'enter' when ready", "press ready when previous step is complete"],
            )
        )

    if "software_rev" in selected:
        steps.append(
            WorkflowStep(
                id="software_rev",
                title="Software Rev. Check",
                prompt=(
                    "Confirm software revision matches unit display. If software rev file cannot be read, "
                    "set revision manually on front panel and continue. "
                    "If revision is invalid or file/path lookup fails, use F1 to fix paths, re-select .CAL files, and retry probe. "
                    "Recovered warning path: place floppy disk in computer and fix invalid rev after calibration fails."
                ),
                commands=["VER#?", "SER#?"],
                expected_markers=[
                    "software rev. check",
                    "software rev",
                    "last known lc103 software rev. is:",
                    "couldn't retrieve the proper software rev. number",
                    "couldn't open the software rev. file",
                    "wrong rev. number",
                    "an invalid software rev. number was specified",
                    "place the flopply disk in the computer now",
                    "press f1 to change paths",
                ],
                fail_markers=[
                    "wrong rev. number",
                    "an invalid software rev. number was specified",
                    "couldn't retrieve the proper software rev. number",
                    "couldn't open the software rev. file",
                ],
                ready_markers=[
                    "press 'enter' when ready",
                    "press ready when previous step is complete",
                    "press enter when ready, choose test to perform and press start",
                ],
            )
        )

    if "calibration_reset" in selected:
        steps.append(
            WorkflowStep(
                id="calibration_reset",
                title="Calibration Reset",
                prompt=(
                    "Warning: Choosing Calibration Reset removes all calibration from the UUT. "
                    "Take backup first, then continue only if intended."
                ),
                commands=["CALCHK", "CALDATE?"],
                expected_markers=["calibration reset", "warning:  choosing 'calibration reset'"],
                ready_markers=["press 'enter' when ready"],
            )
        )

    if "lead_open_test" in selected:
        steps.append(
            WorkflowStep(
                id="lead_open_test",
                title="Lead Open Test (Caps)",
                prompt=(
                    "Run lead-open integrity check before calibration ranges:\n"
                    "- Use Lead Open Test/Caps branch.\n"
                    "- Ensure lead state matches prompt (open when requested).\n"
                    "- Continue only after pass/ready indication."
                ),
                expected_markers=[
                    "lead open test/caps",
                    "make sure the red uut lead is not connected",
                    "test leads?",
                ],
                ready_markers=["press 'enter' when ready", "press ready when previous step is complete"],
            )
        )

    if "lead_short_test" in selected:
        steps.append(
            WorkflowStep(
                id="lead_short_test",
                title="Lead Zero Short Test (Inductance/ESR)",
                prompt=(
                    "Run lead-short integrity and zero check:\n"
                    "- Make sure UUT leads are shorted together.\n"
                    "- Execute Lead Zero Short Test/Inductance and Lead Zero Short Test/ESR checks.\n"
                    "- Continue only after pass/ready indication."
                ),
                expected_markers=[
                    "lead zero short test",
                    "lead zero short test/inductance",
                    "lead zero short test/esr",
                    "make sure the uut leads are shorted together",
                ],
                ready_markers=["press 'enter' when ready", "press ready when previous step is complete"],
            )
        )

    if "ten_v_ref" in selected:
        steps.append(
            WorkflowStep(
                id="ten_v_ref",
                title="10V Ref Calibration",
                prompt=(
                    "Connection:\n"
                    "- DVM + to TP1006, DVM - to TP1020.\n"
                    "Target:\n"
                    "- Adjust R1045 until measured reference is 10.000V +/-0.005V.\n"
                    "Pass/Fail:\n"
                    "- PASS inside 9.995V..10.005V; FAIL outside that window."
                ),
                commands=["CALCHK"],
                expected_markers=["10v ref calibration", "tp1006", "tp1020", "r1045 for 10.000v +/- 0.005"],
                ready_markers=["press 'enter' when finished", "press 'enter' when ready"],
                pass_markers=["test passed", "test passed!!"],
                fail_markers=["test failed", "communications error", "failed calibration"],
            )
        )

    if "current_source" in selected:
        steps.append(
            WorkflowStep(
                id="current_source",
                title="Current Source Calibration",
                prompt=(
                    "Connection:\n"
                    "- UUT leads to LC103 Final Test Box. DVM on test-box DVM jacks if instructed by fixture.\n"
                    "- Load Select map recovered from legacy source:\n"
                    "  0=1.1 MOhm to UUT leads (same as 9 high-side path),\n"
                    "  1=100 kOhm, 2=10 kOhm, 3=1 kOhm, 4=100 Ohm, 5=10 Ohm, 6=2 kOhm,\n"
                    "  7=0% D/A, 8=10% D/A, 9=100 kOhm (high-voltage side).\n"
                    "- Named load usage recovered: 100k(low voltage), 10k(low voltage), 1k(low voltage/gain), 2k(gain), 100k(V/I leakage).\n"
                    "Comparison quantity:\n"
                    "- Current-source Cal Factor (dimensionless ratio) where x1.0000 means no correction (on target).\n"
                    "- This is not a direct volts/amps setpoint; it is a correction multiplier.\n"
                    "- Under-the-hood meter path is voltage readback (volts) converted internally to the ratio.\n"
                    "- Flow cue: Lowest Current Range is calibrated first.\n"
                    "Pass/Fail:\n"
                    "- PASS when Cal Factor is inside 0.9985..1.0015.\n"
                    "- FAIL outside this window or on comms/calibration fault."
                ),
                commands=["CALCHK"],
                expected_markers=[
                    "current source calibration",
                    "lowest current range is calibrated first",
                    "cal offset",
                    "initialize cal factor nominally to 1.0",
                    "sources calibrated",
                    "cal. factor",
                ],
                ready_markers=["press 'enter' when ready"],
                pass_markers=[
                    "current source calibration passed",
                    "range +current source calibration passed",
                    "test passed",
                ],
                fail_markers=["failed calibration", "test failed", "communication error", "communications error."],
            )
        )

    if "gain" in selected:
        steps.append(
            WorkflowStep(
                id="gain",
                title="Gain Calibration",
                prompt=(
                    "Connection:\n"
                    "- UUT leads to LC103 Final Test Box.\n"
                    "- Fixture load-select path uses 1k (low voltage/gain) and 2k (gain), from recovered Load Select map.\n"
                    "Comparison quantity:\n"
                    "- Gain factor ratio target = x1.0000 (dimensionless correction multiplier).\n"
                    "- Physical readback path is voltage (V) across known fixture resistance, normalized internally.\n"
                    "Pass/Fail:\n"
                    "- PASS when ratio is inside 0.9..1.1.\n"
                    "- FAIL if adjustment exceeds 10% or gain calibration failed marker is returned."
                ),
                commands=["CALCHK"],
                expected_markers=[
                    "gain calibration",
                    "sources calibrated",
                    "range !gain calibration failed",
                    "on range !gain calibration failed",
                ],
                ready_markers=["press 'enter' when ready"],
                pass_markers=["gain calibration passed"],
                fail_markers=[
                    "gain calibration failed",
                    "failed calibration. adjusted >10%",
                    "failed calibration. gain adjustment>10%",
                ],
            )
        )

    c_ranges = ranges_for_family(ranges, "C")
    c_pair_by_idx = _pair_map(c_pairs)
    if "capacitance" in selected:
        steps.append(
            WorkflowStep(
                id="cap_conn",
                title="Capacitance Fixture Setup",
                prompt=(
                    "Make sure the red UUT lead is not connected. "
                    "Short UUT leads to the Capacitance Decade Box (L Terminal). "
                    "Connect black UUT lead to the Capacitance Decade Box (Low Terminal), then move red lead to the "
                    "Capacitance Decade Box (High Terminal)."
                ),
                expected_markers=["capacitance calibration", "short the uut leads to the capacitance decade box"],
                ready_markers=["press 'enter' when ready"],
            )
        )
        for r in c_ranges:
            pair = c_pair_by_idx.get(r.index)
            low_src, high_src = _resolved_pair_values(r, pair)
            steps.append(
                WorkflowStep(
                    id=f"cap_r{r.index}_low",
                    title=f"Capacitance Range {r.index} Low Point",
                    prompt=(
                        f"Set capacitance decade box to low point for range {r.index}: "
                        f"{_label_from_range(r, 'low')} (actual {low_src:.12g} F), then Continue."
                    ),
                    commands=[
                        "CALSET",
                        "CALCHK",
                    ],
                    expected_markers=["capacitance calibration"],
                    ready_markers=["press 'enter' when ready", "and press 'enter' when ready"],
                    fail_markers=["cap cal failed range", "failed calibration"],
                    range_family="C",
                    range_index=r.index,
                    range_kind="low",
                )
            )
            steps.append(
                WorkflowStep(
                    id=f"cap_r{r.index}_high",
                    title=f"Capacitance Range {r.index} High Point",
                    prompt=(
                        f"Set capacitance decade box to high point for range {r.index}: "
                        f"{_label_from_range(r, 'high')} (actual {high_src:.12g} F), then Continue."
                    ),
                    commands=[
                        "CALSET",
                        "CALCHK",
                    ],
                    expected_markers=["capacitance calibration"],
                    ready_markers=["press 'enter' when ready", "and press 'enter' when ready"],
                    fail_markers=["cap cal failed range", "failed calibration"],
                    range_family="C",
                    range_index=r.index,
                    range_kind="high",
                )
            )

    if "esr" in selected:
        steps.append(
            WorkflowStep(
                id="esr",
                title="ESR Calibration",
                prompt=(
                    "Connection:\n"
                    "- Red UUT lead to capacitance decade box H terminal.\n"
                    "- Set decade box to 0.022uF (actual 0.0219uF).\n"
                    "Comparison quantity:\n"
                    "- ESR/RC internal calibration constant centered near 2.20E-8.\n"
                    "Pass/Fail:\n"
                    "- PASS window: 2.00E-8..2.40E-8.\n"
                    "- FAIL if ESR calibration failed marker appears or cal'ed ESR value exceeds 1 ohm."
                ),
                commands=["CALCHK"],
                expected_markers=["esr calibration", "set the  box to 0.022uf"],
                ready_markers=["press 'enter' when ready"],
                pass_markers=["esr calibration passed"],
                fail_markers=["failed calibration"],
            )
        )

    l_ranges = ranges_for_family(ranges, "L")
    l_pair_by_idx = _pair_map(l_pairs)
    if "inductance" in selected:
        steps.append(
            WorkflowStep(
                id="ind_conn",
                title="Inductance Fixture Setup",
                prompt=(
                    "Short the UUT leads to the Inductance Decade Box (L Terminal). "
                    "Now connect the red lead to the Inductance Decade Box (H Terminal). "
                    "Recovered variants also mention a Low Value Inductance Box on some flows."
                ),
                expected_markers=[
                    "inductance calibration",
                    "inductance decade box (l terminal)",
                    "now connect the red lead to the",
                    "low value inductance box",
                ],
                ready_markers=["press 'enter' when ready"],
            )
        )
        for r in l_ranges:
            pair = l_pair_by_idx.get(r.index)
            low_src, high_src = _resolved_pair_values(r, pair)
            steps.append(
                WorkflowStep(
                    id=f"ind_r{r.index}_low",
                    title=f"Inductance Range {r.index} Low Point",
                    prompt=(
                        f"Set inductance decade box to low point for range {r.index}: "
                        f"{_label_from_range(r, 'low')} (actual {low_src:.12g} H), then Continue."
                    ),
                    commands=[
                        "CALSET",
                        "CALCHK",
                    ],
                    expected_markers=["inductance calibration"],
                    ready_markers=["press 'enter' when ready", "and press 'enter' when ready"],
                    fail_markers=["ind cal failed range", "failed calibration"],
                    range_family="L",
                    range_index=r.index,
                    range_kind="low",
                )
            )
            steps.append(
                WorkflowStep(
                    id=f"ind_r{r.index}_high",
                    title=f"Inductance Range {r.index} High Point",
                    prompt=(
                        f"Set inductance decade box to high point for range {r.index}: "
                        f"{_label_from_range(r, 'high')} (actual {high_src:.12g} H), then Continue."
                    ),
                    commands=[
                        "CALSET",
                        "CALCHK",
                    ],
                    expected_markers=["inductance calibration"],
                    ready_markers=["press 'enter' when ready", "and press 'enter' when ready"],
                    fail_markers=["ind cal failed range", "failed calibration"],
                    range_family="L",
                    range_index=r.index,
                    range_kind="high",
                )
            )

    if "ringer" in selected:
        steps.extend(
            [
                WorkflowStep(
                    id="ringer_yokes",
                    title="Ringer Calibration: Yolks and Flybacks",
                    prompt=(
                        "Connect UUT leads to the Small Ringer Cal Box set to Yolks and Flybacks. "
                        "Press corresponding UUT button, hold Inductor Ringer, and adjust R1144 to the "
                        "number of rings specified on the cal box."
                    ),
                    expected_markers=[
                        "small ringer cal box set to",
                        "yokes and flybacks",
                        "yolks and flybacks",
                        "adjust r1144",
                        "number of rings specified on the cal box",
                    ],
                    ready_markers=["press 'enter' when ready", "press 'enter' when finished"],
                ),
                WorkflowStep(
                    id="ringer_switching",
                    title="Ringer Calibration: Switching Transformers",
                    prompt=(
                        "Switch the cal box to Switching Transformers. Press corresponding UUT button, hold "
                        "Inductor Ringer, and adjust R1005 to the number of rings specified on the cal box."
                    ),
                    expected_markers=[
                        "switch the cal box to",
                        "switching transformers",
                        "adjust r1005",
                        "number of rings specified on the cal box",
                    ],
                    ready_markers=["press 'enter' when ready", "press 'enter' when finished"],
                ),
            ]
        )

    if "leakage_v_cal" in selected:
        steps.append(
            WorkflowStep(
                id="leakage_v_cal",
                title="Leakage Voltage Calibration",
                prompt=(
                    "Connection:\n"
                    "- UUT leads to LC103 Final Test Box. DVM attached to fixture voltage monitor path.\n"
                    "Set values (fixture points):\n"
                    "- High-voltage points include 500 V and 1000 V selections.\n"
                    "Comparison quantity:\n"
                    "- Leakage-voltage gain/offset calibration at low and high ranges including 500V/1000V fixture points.\n"
                    "- Recovered constants in this stage: 0.75, 0.99, 10.0, 16.0, 32.0, 33.0, 200.0, 1000.0, -0.0250.\n"
                    "Pass/Fail:\n"
                    "- FAIL on 'offset adjustment too high' or 'gain adjustment >10%' markers.\n"
                    "- PASS when stage returns pass markers without fail markers."
                ),
                commands=["CALCHK"],
                expected_markers=[
                    "leakage voltage calibration",
                    "leakage calibration",
                    "low range",
                    "high range",
                    "1000v",
                    "set high ls to 500v",
                    "set high ls to 1000v",
                    "failed calibration. offset adjustment too high",
                    "failed calibration. gain adjustment>10%",
                ],
                ready_markers=["press 'enter' when ready"],
                pass_markers=["pass/fail", "test passed", "test passed!!"],
                fail_markers=["fail", "test failed", "failed calibration", "communication error."],
            )
        )

    if "da_test" in selected:
        steps.append(
            WorkflowStep(
                id="da_test",
                title="D/A Test",
                prompt=(
                    "Connection:\n"
                    "- UUT leads to LC103 Final Test Box, then Switch in D/A Standard path.\n"
                    "Set values (fixture points):\n"
                    "- D/A reference points: 0% D/A and 10% D/A.\n"
                    "- Voltage references used by the routine: -1.5 V and +1.5 V.\n"
                    "Comparison quantity:\n"
                    "- D/A response at 0% D/A and 10% D/A standards using -1.5 V and +1.5 V reference checks.\n"
                    "- Recovered constants include +/-1.5 and 0.01 scaling.\n"
                    "Pass/Fail:\n"
                    "- PASS when D/A measurements stay in allowed window.\n"
                    "- FAIL on 'measurement beyond specs' marker."
                ),
                commands=["CALCHK"],
                expected_markers=[
                    "d/a test",
                    "switch in d/a standard",
                    "0% d/a",
                    "10% d/a",
                    "-1.5v",
                    "1.5",
                    "measurement beyond specs.",
                ],
                ready_markers=["press 'enter' when ready"],
                pass_markers=["pass/fail", "test passed", "test passed!!"],
                fail_markers=["fail", "test failed", "measurement beyond specs.", "communications error"],
            )
        )

    if "leakage_v_test" in selected:
        steps.append(
            WorkflowStep(
                id="leakage_v_test",
                title="Leakage Voltage Test",
                prompt=(
                    "Connection:\n"
                    "- UUT leads to LC103 Final Test Box with DVM correction path active.\n"
                    "Set values (fixture points):\n"
                    "- Apply/check 500 V point.\n"
                    "- Apply/check 1000 V point.\n"
                    "Comparison quantity:\n"
                    "- Leakage test voltage at 500V and 1000V points.\n"
                    "Pass/Fail:\n"
                    "- Recovered compare windows include 0.95 and 0.99 ratio thresholds.\n"
                    "- PASS with pass marker and no fail marker; FAIL otherwise."
                ),
                commands=["CALCHK"],
                expected_markers=["leakage voltage test", "500v", "1000v", "dvm correction"],
                ready_markers=["press 'enter' when ready"],
                pass_markers=["pass/fail", "test passed", "test passed!!"],
                fail_markers=["fail", "test failed", "communications error"],
            )
        )

    if "leakage_i_test" in selected:
        steps.append(
            WorkflowStep(
                id="leakage_i_test",
                title="Leakage Current Test",
                prompt=(
                    "Connection:\n"
                    "- UUT leads to LC103 Final Test Box, using fixture Load Select and Sense Resistor routing.\n"
                    "Set values (fixture points):\n"
                    "- Low-current point: 100 uA.\n"
                    "- High-current point: 10 mA.\n"
                    "Comparison quantity:\n"
                    "- Leakage current response across setup matrix columns recovered in LEAK_I: Sense Resistor, Approx Current, Cal Box Setup #, 8842 multiplier.\n"
                    "- Recovered references include DVM input resistance about 1.111E6 ohms (1.111 MOhm / 1,111,000 ohms), and 100 uA / 10 mA points.\n"
                    "Pass/Fail:\n"
                    "- Recovered ratio limits include x0.937..x1.06 (unitless correction ratio).\n"
                    "- PASS with pass marker and no fail marker; FAIL otherwise."
                ),
                commands=["CALCHK"],
                expected_markers=[
                    "leakage current test",
                    "load select",
                    "sense resistor",
                    "cal box setup #",
                    "8842 mult. factor",
                    "dvm resistance",
                    "1.111e6",
                    "100ua",
                    "10ma",
                ],
                ready_markers=["press 'enter' when ready"],
                pass_markers=["pass/fail", "test passed", "test passed!!"],
                fail_markers=["fail", "test failed", "communications error"],
            )
        )

    if "calibration_stamp" in selected:
        steps.append(
            WorkflowStep(
                id="calibration_stamp",
                title="Calibration Stamp",
                prompt=(
                    "Set Calibration Date / Stamp and verify response. "
                    "Set Serial Number when requested. Use Enter/finished prompts to close the stage."
                ),
                commands=["CALDATE?", "CALCHK"],
                expected_markers=[
                    "set cal date",
                    "set serial number",
                    "calibration stamp",
                    "calibration successful",
                ],
                ready_markers=["press 'enter' when finished", "press 'enter' when ready"],
            )
        )

    if "power_board_test" in selected:
        steps.append(
            WorkflowStep(
                id="power_board_test",
                title="Power Board Tester Flow",
                prompt=(
                    "Legacy power-board tester branch (separate from non-ringer final-cal sequence):\n"
                    "- Turn Safety switch ON.\n"
                    "- Turn tester power ON.\n"
                    "- Verify battery voltage stage.\n"
                    "- Remove UUT from tester and proceed to next UUT when complete."
                ),
                expected_markers=[
                    "power board test version",
                    "turn safety switch on",
                    "turn tester power on",
                    "batt. voltage.",
                    "remove uut from tester, proceed to next uut",
                ],
                ready_markers=["press 'enter' when ready", "press 'enter' when finished"],
            )
        )

    steps.append(
        WorkflowStep(
            id="finish",
            title="Finish",
            prompt=(
                "Power-cycle, disconnect fixtures in reverse order, and save report/transcript. "
                "Recovered post-flow hint: remove UUT from tester and proceed to next UUT."
            ),
            commands=["VER#?", "SER#?", "CALDATE?"],
            expected_markers=["calibration successful", "remove uut from tester, proceed to next uut"],
        )
    )
    return steps
