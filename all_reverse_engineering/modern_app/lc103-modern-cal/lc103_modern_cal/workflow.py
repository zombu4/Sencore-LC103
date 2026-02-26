from __future__ import annotations

from dataclasses import dataclass, field
from typing import List, Optional, Sequence, Tuple

GLOBAL_FAIL_MARKERS = (
    "rs-232 connection failed",
    "communications error",
    "failed calibration",
    "communication error",
    "out of range",
    "timeout",
    "aborted",
    "abort",
    "devabort",
    "chkhandlertimeout",
    "onoccurrencewithtimeout",
    "error\\fc in",
    "error\\fc out",
)

GLOBAL_PASS_MARKERS = (
    "calibration passed",
    "calibration successful",
    "pass/fail",
)

COMMS_FAULT_MARKERS = (
    "rs-232 connection failed",
    "communications error",
    "communication error",
    "timeout",
    "aborted",
    "abort",
    "devabort",
    "chkhandlertimeout",
    "onoccurrencewithtimeout",
    "error\\fc in",
    "error\\fc out",
)

SOFTREV_PATH_ERROR_MARKERS = (
    "wrong rev. number",
    "an invalid software rev. number was specified",
    "couldn't retrieve the proper software rev. number",
    "couldn't open the software rev. file",
)

SOFTREV_PATH_ACTION_MARKERS = (
    "press f1 to change paths",
    "please choose the file containing the capacitance calibration data",
    "please choose the file containing the inductance calibration data",
    "*.cal",
)


@dataclass(frozen=True)
class WorkflowStep:
    id: str
    title: str
    prompt: str
    commands: List[str] = field(default_factory=list)
    expected_markers: List[str] = field(default_factory=list)
    ready_markers: List[str] = field(default_factory=list)
    pass_markers: List[str] = field(default_factory=list)
    fail_markers: List[str] = field(default_factory=list)
    range_family: Optional[str] = None
    range_index: Optional[int] = None
    range_kind: Optional[str] = None


def _contains_ci(text: str, marker: str) -> bool:
    return marker.lower() in text.lower()


def match_markers(text: str, markers: Sequence[str]) -> Optional[str]:
    for marker in markers:
        if _contains_ci(text, marker):
            return marker
    return None


def match_step_marker(step: WorkflowStep, text: str) -> Optional[str]:
    return match_markers(text, step.expected_markers)


def match_step_ready_marker(step: WorkflowStep, text: str) -> Optional[str]:
    return match_markers(text, step.ready_markers)


def match_step_pass_marker(step: WorkflowStep, text: str) -> Optional[str]:
    return match_markers(text, step.pass_markers)


def match_step_fail_marker(step: WorkflowStep, text: str) -> Optional[str]:
    return match_markers(text, step.fail_markers)


def is_next_range_marker(text: str) -> bool:
    return _contains_ci(text, "next range to cal")


def is_do_next_after_pass_marker(text: str) -> bool:
    return _contains_ci(text, "do next test if previous test passed")


def is_wait_for_start_click_marker(text: str) -> bool:
    return _contains_ci(text, "wait for start button to be clicked")


def is_start_prompt_marker(text: str) -> bool:
    return _contains_ci(text, "press to start") or _contains_ci(
        text, "press enter when ready, choose test to perform and press start"
    )


def match_global_fail_marker(text: str) -> Optional[str]:
    return match_markers(text, GLOBAL_FAIL_MARKERS)


def match_global_pass_marker(text: str) -> Optional[str]:
    return match_markers(text, GLOBAL_PASS_MARKERS)


def match_comms_fault_marker(text: str) -> Optional[str]:
    return match_markers(text, COMMS_FAULT_MARKERS)


def match_softrev_path_error_marker(text: str) -> Optional[str]:
    return match_markers(text, SOFTREV_PATH_ERROR_MARKERS)


def match_softrev_path_action_marker(text: str) -> Optional[str]:
    return match_markers(text, SOFTREV_PATH_ACTION_MARKERS)


def match_future_step_marker(
    steps: Sequence[WorkflowStep], current_index: int, text: str
) -> Optional[Tuple[int, str]]:
    start = max(0, current_index + 1)
    for i in range(start, len(steps)):
        marker = match_step_marker(steps[i], text)
        if marker:
            return i, marker
    return None


def recovered_final_cal_workflow() -> List[WorkflowStep]:
    # Ordered from recovered legacy prompts + LC103 calibration procedure.
    return [
        WorkflowStep(
            id="setup_power_and_links",
            title="Connect Power and Test Links",
            prompt=(
                "1) Connect PA251 power adapter to rear of LC103.\n"
                "2) Connect RS232 cable from computer to LC103 RS232 port.\n"
                "3) Connect 39G219 test lead from LC103 front panel to final test box.\n"
                "4) Connect IEEE cable to RS232 interface port on back-left side of UUT."
            ),
            expected_markers=["connect the uut and/or dvm leads", "cal box setup", "software rev. check"],
        ),
        WorkflowStep(
            id="power_on_and_detect",
            title="Power On and Detect Revision",
            prompt=(
                "Power the LC103 on. Confirm displayed software revision and serial identity. "
                "Wizard probes revision/serial now."
            ),
            commands=["VER#?", "SER#?"],
            expected_markers=["software rev", "ver", "ser#"],
        ),
        WorkflowStep(
            id="load_cal_files",
            title="Load Calibration Data Files",
            prompt=(
                "Use firmware-matched files:\n"
                "- Capacitance file: P071_03.CAL\n"
                "- Inductance file: P072_1.CAL (or approved matching variant)\n"
                "Wizard auto-selects these by model/revision when available."
            ),
            expected_markers=[
                "please choose the file containing the capacitance calibration data",
                "please choose the file containing the inductance calibration data",
                "capacitance box cal data file",
                "inductance box cal data file",
            ],
        ),
        WorkflowStep(
            id="start_non_ringer",
            title="Start Non-Ringer Calibration Block",
            prompt=(
                "Select ALL (NOT RINGER) and press Start. Follow prompts in order. "
                "Do not skip steps or change fixture wiring out of sequence."
            ),
            expected_markers=["all  (not ringer)", "start button", "press to start"],
        ),
        WorkflowStep(
            id="cal_reset_gate",
            title="Calibration Reset Gate",
            prompt=(
                "Legacy flow warns reset clears existing calibration. Proceed only if backup is captured.\n"
                "Recommended: run Backup Calibration Data before any mutating path."
            ),
            commands=["CALCHK", "CALDATE?"],
            expected_markers=["calibration reset", "warning:  choosing 'calibration reset'"],
        ),
        WorkflowStep(
            id="current_source_cal",
            title="Current Source Calibration",
            prompt=(
                "Connect UUT/DVM leads exactly as prompted by fixture. "
                "Advance only after stable reading and pass indication."
            ),
            commands=["CALCHK"],
            expected_markers=["current source calibration", "current source calibration passed"],
        ),
        WorkflowStep(
            id="gain_cal",
            title="Gain Calibration",
            prompt=(
                "Maintain required fixture connections and run gain stage. "
                "If fail text appears (adjusted >10% / gain failed), stop and investigate fixtures."
            ),
            commands=["CALCHK"],
            expected_markers=["gain calibration", "gain calibration failed", "failed calibration. adjusted >10%"],
        ),
        WorkflowStep(
            id="cap_decade_connect",
            title="Capacitance Decade Box Connections",
            prompt=(
                "Capacitance wiring sequence:\n"
                "- Ensure red UUT lead disconnected when prompted.\n"
                "- Short UUT leads to capacitance decade box.\n"
                "- Connect black lead to LOW terminal.\n"
                "- Connect red lead to HIGH terminal."
            ),
            expected_markers=[
                "capacitance calibration",
                "short the uut leads to the capacitance decade box",
                "now connect the red uut to the h  terminal of the decade box",
            ],
        ),
        WorkflowStep(
            id="esr_step",
            title="ESR Calibration",
            prompt=(
                "ESR-specific fixture setting:\n"
                "- Keep red lead on H terminal.\n"
                "- Set capacitance decade box to 0.022uF (0.0219).\n"
                "Proceed only after ESR pass confirmation."
            ),
            commands=["CALCHK"],
            expected_markers=["esr calibration", "set the  box to 0.022uf", "esr calibration passed"],
        ),
        WorkflowStep(
            id="ind_decade_connect",
            title="Inductance Decade Box Connections",
            prompt=(
                "Inductance wiring sequence:\n"
                "- Short UUT leads when requested.\n"
                "- Connect to L terminal first as prompted.\n"
                "- Move red lead to H terminal when prompted."
            ),
            expected_markers=[
                "inductance calibration",
                "inductance decade box (l terminal)",
                "inductance decade box (h terminal)",
            ],
        ),
        WorkflowStep(
            id="leak_voltage_cal",
            title="Leakage Voltage Calibration",
            prompt=(
                "Follow fixture prompt for leakage voltage calibration. "
                "Use correct DVM/test-box connections before continuing."
            ),
            commands=["CALCHK"],
            expected_markers=["leakage voltage calibration"],
        ),
        WorkflowStep(
            id="leak_voltage_test",
            title="Leakage Voltage Test",
            prompt=(
                "Run leakage voltage test stage and verify expected behavior before next step."
            ),
            commands=["CALCHK"],
            expected_markers=["leakage voltage test"],
        ),
        WorkflowStep(
            id="leak_current_test",
            title="Leakage Current Test",
            prompt=(
                "Run leakage current test stage. If fail text appears, stop and correct fixture/lead setup."
            ),
            commands=["CALCHK"],
            expected_markers=["leakage current test"],
        ),
        WorkflowStep(
            id="stamp_and_complete_non_ringer",
            title="Set Calibration Stamp/Date",
            prompt=(
                "Finalize non-ringer calibration date/stamp. Verify date response before power cycle."
            ),
            commands=["CALDATE?", "CALCHK"],
            expected_markers=["set cal date", "set calibration date", "calibration successful"],
        ),
        WorkflowStep(
            id="ringer_yokes",
            title="Ringer Adjust: Yolks and Flybacks",
            prompt=(
                "After non-ringer block:\n"
                "- Move leads to ringer cal box.\n"
                "- Set box to YOLKS AND FLYBACKS.\n"
                "- Press YOLKS AND FLYBACKS on UUT.\n"
                "- Hold INDUCTOR RINGER and adjust R1144 to the ring count specified on cal box."
            ),
            expected_markers=["yolks and flybacks", "adjust r1144"],
        ),
        WorkflowStep(
            id="ringer_switching",
            title="Ringer Adjust: Switching Transformers",
            prompt=(
                "- Set ringer cal box to SWITCHING TRANSFORMERS.\n"
                "- Press SWITCHING TRANSFORMERS on UUT.\n"
                "- Hold INDUCTOR RINGER and adjust R1005 to ring count specified on cal box."
            ),
            expected_markers=["switching transformers", "adjust r1005"],
        ),
        WorkflowStep(
            id="post_checks",
            title="Post-Calibration Electrical Checks",
            prompt=(
                "Run required post checks:\n"
                "- Battery % check at ~12.65V and ~11V supply points.\n"
                "- Leakage check at 25V with shorted leads (>20mA flashing expected).\n"
                "- Inductance short check (0.00) and box reading verification.\n"
                "- High-cap box reading verification per standards book."
            ),
            expected_markers=[">20ma", "short", "inductance"],
        ),
        WorkflowStep(
            id="closeout",
            title="Closeout",
            prompt=(
                "Power off UUT, disconnect fixtures, and document completion/aging handoff. "
                "Save wizard parity report and transcript for traceability."
            ),
            commands=["VER#?", "SER#?", "CALDATE?"],
            expected_markers=["calibration successful", "caldate"],
        ),
    ]
