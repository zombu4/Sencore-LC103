# LC103 Deep Thresholds and Trigger Evidence (2026-02-25)

Primary evidence source: `/Users/<user>/Downloads/LC103/Source/LV3_1/103f_cal.llb` (original LabVIEW VI library).

## Current Source Calibration
- `Lowest Current Range is calibrated first.` at `0x2b0696`
- Numeric pair adjacent to this prompt: `0.9985` at `0x2b06de`, `1.0015` at `0x2b06fe`
- `Initialize Cal Factor nominally to 1.0` at `0x2b0a82`
- Pass/fail text nearby: `Current Source Calibration Passed` and `Failed Calibration.` in same ISRC block

Interpretation: ISRC pass window is encoded as a narrow cal-factor band around 1.0 (`0.9985..1.0015`) in source assets.

## Gain Calibration
- `Current MUST be Calibrated First` at `0x27a6b1`
- Fail condition text: `Failed Calibration. Adjusted >10%` at `0x27a766` and again in summary block at `0x27b23c`
- Threshold constants in same GAIN block: `1.1` at `0x27a9db`, `0.9` at `0x27a9f9`

Interpretation: Gain adjustment acceptance is effectively ±10% around nominal (0.9 to 1.1), matching fail text.

## Leakage Calibration (related comparator constants)
- Fail text: `Gain Adjustment>10%` at `0x2ca0fa`; `Offset Adjustment too high` at `0x2ca84c`
- Nearby constants: `1.1` at `0x2ca1e9`, `0.75` at `0x2ca207`, `32.0/1000.0/33.0` at `0x2caf66/0x2caf78/0x2caf83`, `0.99` (multiple), `0.95`, `0.937`

## Command/Protocol Clues
- `Cal Factor Command` with explicit template `CALF_xx_x.xxxxExx` at `0x1a3cd9`..`0x1a3ced`
- `Start Cal Factor(0)` and `End Cal Factor(59)` repeated across EEPROM/cal-factor routines
- `0-Ver. Cmnd(CAP)` and `0-Ver. Cmnd(IND)` repeatedly referenced in UUT comm flows

## Wizard/Prompt Evidence
- Explicit guided prompts recovered for ESR and ringer phases, including:
  - connect red lead to H terminal and set 0.022uF
  - short UUT leads to decade box
  - adjust R1144 / R1005 based on ring count and cal-box switch position
- Generic per-test connect prompt for many modes: `Connect the UUT and/or DVM leads to the LC103 Final Test Box.`

## Cross-version check
- Same critical constants/text also appear in LV5_1 and in the built EXE overlay, increasing confidence this is production logic.

Artifacts:
- `lv3_1_deep_evidence_2026-02-25.tsv`
- `lv3_1_wizard_prompts_2026-02-25.tsv`
