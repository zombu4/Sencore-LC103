# LC103 Full Calibration - Parts, Wiring, and Exact Steps

This document is written for doing the calibration on a real bench.
It tells you what hardware you need, what values must exist in the fixture, and what to connect/set at each step.

## 1) Required hardware (no placeholders)

### 1.1 Mandatory base items

- 1x Sencore LC103 (UUT)
- 1x PA251 power adapter
- 1x RS-232 cable (PC <-> LC103)
- 1x 39G219 front-panel lead cable (LC103 <-> fixture)
- 1x IEEE cable used by the legacy fixture path
- 1x DVM (Fluke 8840A/8842 class path is what legacy flow expects)
- Host computer running the calibration app

### 1.2 Calibration files required by software

- `LC103 Cal Data.ini`
- `P071_03.CAL` (cap ranges)
- `P072_1.cal` (ind ranges)
- optional approved variant: `P072_10.CAL`

### 1.3 Fixture hardware you must have (factory box or DIY equivalent)

You need either the original LC103 Final Test Box or a compatible box that provides all of these resources.

#### A) Load-select resistor matrix (required)

- LS0: `1.1 MOhm` to UUT leads (same function as LS9 path)
- LS1: `100 kOhm`
- LS2: `10 kOhm`
- LS3: `1 kOhm` (used in gain path)
- LS4: `100 Ohm`
- LS5: `10 Ohm`
- LS6: `2 kOhm` (used in gain path)
- LS7: `0% D/A standard`
- LS8: `10% D/A standard`
- LS9: `100 kOhm` (high-side path)

#### B) Leakage-current sense network (required)

- Sense resistor path 0: `1.111 MOhm` (approx `9 uA`, setup `9`, multiplier `10.0`)
- Sense resistor path 1: `100 kOhm` (approx `100 uA`, setup `1`, multiplier `1.0`)
- Sense resistor path 2: `10 kOhm` (approx `1 mA`, setup `2`, multiplier `1.0`)
- Sense resistor path 3: `1 kOhm` (approx `10 mA`, setup `3`, multiplier `1.0`)

#### C) Voltage source points available in fixture path (required)

- `1 V`, `16 V`, `32 V`, `33 V`, `500 V`, `1000 V`

#### D) External standards/devices used by prompts

- Capacitance decade box (L/H terminal wiring)
- Inductance decade box (L/H terminal wiring)
- ESR point: ability to set `0.022 uF` (`0.0219 uF` actual)
- Small ringer calibration box with two switch positions:
  - `Yolks/Flybacks`
  - `Switching Transformers`

## 2) What each hardware item is used for

- PA251: powers LC103 during calibration.
- RS-232: command/response channel for all calibration actions.
- 39G219 + Final Test Box: routes UUT leads into the correct calibration loads and standards.
- DVM: verifies analog reference points and fixture voltage/current behavior.
- Cap decade box: provides cap range low/high standards.
- Ind decade box: provides inductor range low/high standards.
- Ringer box: provides ring-count reference for R1144/R1005 trims.

## 3) Hard numeric references (what pass/fail is based on)

- 10V reference trim:
  - connect DVM `+` to `TP1006`, DVM `-` to `TP1020`
  - adjust `R1045` to `10.000 V +/- 0.005 V`
  - pass range: `9.995 V .. 10.005 V`

- Current source calibration (`ISRC_CAL`):
  - compare target: `x1.0000` correction ratio
  - pass window: `0.9985 .. 1.0015`
  - firmware modes present: `1uA`, `10uA`, `33uA`, `100uA`, `1mA`, `10mA`, `100mA`, `OFF`

- Gain calibration (`GAIN_CAL`):
  - compare target: `x1.0000` correction ratio
  - pass window: `0.9 .. 1.1`

- Leakage current test (`LEAK_I`):
  - pass window: `0.937 .. 1.06` ratio

- Leakage voltage test (`LEAK_VLT`):
  - recovered compare constants include `0.95` and `0.99`

- ESR calibration (`ESR_CAL`):
  - recovered constants: `2.00E-8`, `2.20E-8`, `2.40E-8`
  - fail cue path includes `Cal'ed value >1 ohm`

## 4) Step-by-step operator procedure (exact actions)

### 4.1 Bench setup

1. Connect `PA251` to LC103 rear power.
2. Connect RS-232 from PC to LC103 RS-232.
3. Connect `39G219` between LC103 front panel and Final Test Box.
4. Connect the IEEE cable path used by the legacy fixture setup.
5. Power on LC103.

### 4.2 App setup

6. Open calibration app.
7. Use path setup (F1 behavior in legacy flow) to select files:
   - `P071_03.CAL`
   - `P072_1.cal` (or approved `P072_10.CAL`)
8. Verify software revision/profile alignment.

### 4.3 Pre-checks

9. Run lead-open check.
10. Run lead-short/zero checks (including Inductance and ESR branches).
11. Continue only if pre-checks pass.

### 4.4 10V reference stage

12. Connect DVM `+` to `TP1006`.
13. Connect DVM `-` to `TP1020`.
14. Adjust `R1045` until DVM reads `10.000 V`.
15. Confirm it is inside `9.995 .. 10.005 V`.

### 4.5 Current source stage

16. Keep UUT connected through Final Test Box current path.
17. Run Current Source Calibration.
18. Accept only results inside `0.9985 .. 1.0015`.

### 4.6 Gain stage

19. Keep UUT through Final Test Box gain path.
20. Ensure fixture can route LS3 (`1k`) and LS6 (`2k`).
21. Run Gain Calibration.
22. Accept only results inside `0.9 .. 1.1`.

### 4.7 Capacitance calibration (7 ranges, low/high each)

23. Fixture lead setup for cap branch:
   - Follow prompt order: short/low terminal setup first, then red lead to high terminal.

24. Set decade box for each range pair and run the step:

| Range | Low setpoint | High setpoint |
|---|---|---|
| C0 | 200 pF | 1700 pF |
| C1 | 0.004 uF | 0.018 uF |
| C2 | 0.04 uF | 0.18 uF |
| C3 | 0.4 uF | 1.80 uF |
| C4 | 4.0 uF | 18.0 uF |
| C5 | 40.0 uF | 180 uF |
| C6 | 400 uF | 1800 uF |

Reference actuals used by profile:
- C0: `202.7E-12` / `1704.0E-12`
- C1: `0.004E-6` / `0.018E-6`
- C2: `0.04E-6` / `0.18E-6`
- C3: `0.4E-6` / `1.765E-6`
- C4: `3.849E-6` / `19.580E-6`
- C5: `38.20E-6` / `171.21E-6`
- C6: `381.04E-6` / `1709.20E-6`

### 4.8 ESR calibration

25. Connect red UUT lead to capacitance box H terminal as prompted.
26. Set capacitance decade to `0.022 uF` (`0.0219 uF` actual).
27. Run ESR calibration and accept only pass status.

### 4.9 Inductance calibration (7 ranges, low/high each)

28. Fixture lead setup for ind branch:
   - short to L terminal path, then move red lead to H terminal path as prompted.

29. Set decade box for each range pair and run the step:

| Range | Low setpoint | High setpoint |
|---|---|---|
| L0 | 2.00 uH | 10.0 uH |
| L1 | 40.0 uH | 80.0 uH |
| L2 | 200 uH | 1.50 mH |
| L3 | 2.00 mH | 15.0 mH |
| L4 | 20.0 mH | 150 mH |
| L5 | 200 mH | 1.50 H |
| L6 | 2.00 H | 8.00 H |

Reference actuals used by profile:
- L0: `2.36E-6` / `10.32E-6`
- L1: `37.14E-6` / `79.00E-6`
- L2: `198.08E-6` / `1.4950E-3`
- L3: `1.9983E-3` / `14.964E-3`
- L4: `19.952E-3` / `149.42E-3`
- L5: `0.19894` / `1.49680`
- L6: `1.9948` / `8.1361`

### 4.10 Leakage voltage calibration + leakage voltage test

30. Keep UUT in final test box leakage path.
31. Run leakage voltage calibration stage.
32. Run leakage voltage test stage.
33. Fixture path must support these points: `1, 16, 32, 33, 500, 1000 V`.

### 4.11 D/A stage

34. Switch fixture to D/A standards.
35. Run D/A test for:
   - LS7 = `0% D/A`
   - LS8 = `10% D/A`
36. Continue only on pass.

### 4.12 Leakage current stage

37. Run leakage current stage with sense paths:
   - `1.111M`, `100k`, `10k`, `1k`
38. Confirm pass window behavior `0.937 .. 1.06`.

### 4.13 Ringer trim stage

39. Connect UUT leads to small ringer cal box.
40. Set ringer box to `Yolks/Flybacks`, adjust `R1144` to ring count shown on the box.
41. Switch ringer box to `Switching Transformers`, adjust `R1005` to ring count shown on the box.

### 4.14 Finalize

42. Save/write calibration stamp/date/serial if required.
43. Power-cycle unit.
44. Export/backup calibration data.

## 5) If you do NOT have the original Final Test Box

You cannot safely run full write calibration until your DIY fixture reproduces:

- the full LS matrix values,
- leakage-current sense network values,
- leakage voltage source points,
- D/A standard switching,
- cap/ind standard routing,
- ringer reference path.

Minimum safe workflow without full fixture:
- run read-only connectivity/tests,
- run lead checks,
- do not run write-enabled CAL stages.

## 6) Known hard limits (not yet decoded from static files)

- Full factory Final Test Box netlist/pinout is not fully recovered.
- Complete per-index `CALSET` payload semantics are not fully recovered.

These two limits do not change the concrete parts/values listed above, but they do matter if you are building a perfect clone fixture.
