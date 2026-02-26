# LC103 Calibration Threshold Matrix (v1.53 assets)

## Proven thresholds (directly decoded from legacy artifacts)

1. 10V Ref Calibration (`10V_Set.vi`)
- Setpoint: `10.000 V`
- Allowed window: `+/- 0.005 V`
- Prompt text: `Adjust R1045 for 10.000V +/- 0.005.`

2. Current Source Calibration (`ISRC_CAL.vi`)
- Cal-factor lower bound: `0.9985`
- Cal-factor upper bound: `1.0015`
- Nominal reference: `1.0`
- Context text: `Lowest Current Range is calibrated first.` and `Initialize Cal Factor nominally to 1.0`

3. Gain Calibration (`GAIN_CAL.vi`)
- Fail condition text: `Adjusted >10%`
- Equivalent limits: `0.9 .. 1.1` around nominal
- Additional constant present in block: `1000.0`

4. Leakage Current Test (`LEAK_I.vi`)
- Pass-window constants in test block: `0.937 .. 1.06`
- Cal-box/scaling constants in same block: `1.111E6`, `100.0E3`, `10.0E3`, `1.00E3`
- Range labels present: `100uA`, `1mA`, `10mA`

5. Leakage Voltage Test (`LEAK_VLT.vi`)
- Pass/fail comparator constants in test block: `0.95`, `0.99`
- Additional constants in same block: `10.0`, `200.0`

6. ESR Calibration (`ESR_CAL.vi`)
- RC-time constants in ESR block: `2.0E-8`, `2.20E-8`, `2.40E-8`
- Additional comparator constants in same block: `0.001`, `0.005`, `0.05`
- ESR fail cue text present: `Cal'ed value >1ohm:`

7. D/A Test (`DA_TEST.vi`)
- Standard points: `0% D/A` (`0.0`) and `10% D/A` (`10.0`)
- Comparator/tolerance constants in same block: `-1.5`, `1.5`, `0.01`
- Fail cue text: `Measurement beyond specs.`

## Partially decoded (constants present, exact comparator role not fully proven)

8. Leakage Voltage Calibration (`Leak_CAL.vi`)
- Explicit fail condition text: `Gain Adjustment>10%`
- Explicit fail condition text: `Offset Adjustment too high`
- Constants in same flow: `1.1`, `0.75`, `0.99`, `10.0`, `16.0`, `32.0`, `33.0`, `200.0`, `1000.0`, `-0.0250`
- Marked setup values present: `32V`, `33V`, `1000V`, `1V`

9. Capacitance Calibration (`CAP_CAL.vi`)
- Per-range calibration standards are loaded from `*.cal` file
- Constants in cap-cal logic: repeated `0.0003` plus `1.0E+6`
- Fail cue text: `Cap Cal Failed Range`
- Ordering cue: `Lowest Cap Range is Cal'd First`

10. Inductance Calibration (`IND_CAL.vi`)
- Per-range calibration standards are loaded from `*.cal` file
- Constants in ind-cal logic: repeated `0.0003`, plus `8.102900E+0`
- Fail cue text: `Ind Cal Failed Range`
- Ordering cue: `Highest Inductance Range Calibrated First.`

## Calibration data files (external standards used by cap/ind steps)

- Cap standards (example): `200pF(.0001)` ... `1800uF`
- Ind standards (example): `40.0uH` ... `8.00H`
- Legacy loader prompts: `Please choose the file containing the capacitance calibration data.` and `Please choose the file containing the inductance calibration data.`

## Source evidence locations

- `/Users/<user>/LC103/decompile_v1.53/reports/lv3_1_deep_evidence_2026-02-25.tsv`
- `/Users/<user>/LC103/decompile_v1.53/lv_extract/lv3_1/ISRC_CAL.vi`
- `/Users/<user>/LC103/decompile_v1.53/lv_extract/lv3_1/GAIN_CAL.vi`
- `/Users/<user>/LC103/decompile_v1.53/lv_extract/lv3_1/Leak_CAL.vi`
- `/Users/<user>/LC103/decompile_v1.53/lv_extract/lv3_1/LEAK_I.vi`
- `/Users/<user>/LC103/decompile_v1.53/lv_extract/lv3_1/LEAK_VLT.vi`
- `/Users/<user>/LC103/decompile_v1.53/lv_extract/lv3_1/ESR_CAL.vi`
- `/Users/<user>/LC103/decompile_v1.53/lv_extract/lv3_1/DA_TEST.vi`
- `/Users/<user>/LC103/decompile_v1.53/lv_extract/lv3_1/CAP_CAL.vi`
- `/Users/<user>/LC103/decompile_v1.53/lv_extract/lv3_1/IND_CAL.vi`
- `/Users/<user>/LC103/decompile_v1.53/lv_extract/lv3_1/10V_Set.vi`
