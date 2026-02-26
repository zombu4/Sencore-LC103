# LC103 Legacy Logic Map (Recovered)

This document is the implementation reference for how legacy LC103 calibration logic is used in the modern app.

## 1) Runtime state machine used by the app

The wizard state machine is implemented in `lc103_modern_cal/app.py` + `lc103_modern_cal/workflow.py`:

- Start gate:
  - Step `startup_select` will not advance until RX shows a start marker such as:
    - `Press ENTER when ready, choose test to perform and press START`
    - `Press to start`
    - `Wait for start button to be clicked`
- Per-step READY gate:
  - If a step has `ready_markers`, `Continue` is blocked until one is seen.
- Per-step PASS gate:
  - If a step has `pass_markers`, `Continue` is blocked until pass is observed.
  - If fail markers are observed first, the step enters FAIL state and remains blocked.
- Auto advance/sync:
  - `Next Range to cal` advances high range -> next low range.
  - `Do next test if previous test passed` advances when pass gate is satisfied.
  - Future-step prompt matches can sync to the detected future step.

## 2) Legacy command families (recovered)

Recovered protocol tokens used in backup/restore/wizard probes:

- Query/read: `VER#?`, `SER#?`, `CALDATE?`, `CALF?`
- Control/test: `CALCHK`, `CALON`, `CALOFF`, `CALCLR`
- Value write: `CALSET`, `CALF`, `CALDATE`, `SER#`
- Cal-factor format clue recovered from legacy VI strings: `CALF_xx_x.xxxxExx`
- Cal-factor index span in EEPROM routines: `Start Cal Factor(0)` .. `End Cal Factor(59)`

## 3) Core calibration sequence mirrored in app

Implemented in `lc103_modern_cal/legacy_plan.py` with explicit stage options.

Default non-ringer flow:

1. Harness/Test Box Setup
2. Pass/Fail Indicator Visibility
3. Calibration Data File Selection
4. Software Rev. Check
5. Calibration Reset
6. Current Source Calibration
7. Gain Calibration
8. Capacitance Calibration (fixture + per-range low/high points)
9. ESR Calibration
10. Inductance Calibration (fixture + per-range low/high points)
11. Leakage Voltage Calibration
12. D/A Test
13. Leakage Voltage Test
14. Leakage Current Test
15. Calibration Stamp
16. Finish

Optional branches now included:

- Mainboard Fixture DIO Setup
- Lead Open Test (Caps)
- Lead Zero Short Test (Inductance/ESR)
- 10V Ref Calibration
- Ringer Calibration (Yokes/Flybacks + Switching Transformers)
- Power Board Tester Flow

## 4) Key comparator references used in stage prompts

These are encoded in prompt logic so the operator sees the target and pass window:

- 10V Ref: 10.000 V target, pass 9.995 .. 10.005 V
- Current Source Cal Factor: x1.0000 nominal, pass x0.9985 .. x1.0015
- Gain Cal Factor: x1.0000 nominal, pass x0.9 .. x1.1
- ESR internal window: 2.00E-8 .. 2.40E-8 (center 2.20E-8)
- Leakage Voltage points: 500 V and 1000 V references
- Leakage Current points: 100 uA and 10 mA with DVM reference 1.111E6 ohm
- D/A points: 0% D/A and 10% D/A references

## 5) Evidence anchors (recovered corpus)

- Primary extracted VI corpus:
  - `/Users/<user>/LC103/decompile_v1.53/lv_extract/lv3_1`
- Deep extraction report:
  - `/Users/<user>/LC103/decompile_v1.53/reports/lc103_logic_deep_extract_2026-02-25.md`
- Undiscovered-parts report:
  - `/Users/<user>/LC103/decompile_v1.53/reports/lc103_undiscovered_parts_2026-02-25.md`
- Threshold/triggers report:
  - `/Users/<user>/LC103/decompile_v1.53/reports/lc103_deep_thresholds_and_triggers_2026-02-25.md`

