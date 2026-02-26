# LC103 Full Calibration Procedure (Human-Readable)

This is a plain-language operator procedure for full LC103 calibration using recovered legacy workflow data.

## 1) Safety first

- This procedure includes high-voltage steps up to 1000 V.
- Use insulated probes/leads and keep one hand away from chassis during HV checks.
- Do not run write/calibration steps until communication and fixture wiring are verified in read-only mode.

## 2) What you need on the bench

- LC103 unit under test (UUT).
- PA251 power adapter.
- RS-232 cable (PC to LC103).
- 39G219 test lead cable (LC103 front panel to fixture).
- IEEE cable to the LC103 interface side (legacy fixture path).
- LC103 Final Test Box.
- Capacitance decade box.
- Inductance decade box (plus low-inductance fixture branch if your setup uses it).
- Small ringer calibration box (Yolks/Flybacks and Switching Transformers positions).
- DVM (Fluke 8840A/8842 class path is what the legacy flow expects).

## 3) Files you must load in the app

- `LC103 Cal Data.ini`
- `P071_03.CAL` (capacitance standards)
- `P072_1.cal` (inductance standards)
- `P072_10.CAL` may be used only if that is the approved profile for your unit.

## 4) Important numeric references (quick list)

- 10 V reference trim: adjust `R1045` to `10.000 V +/- 0.005 V`.
- Current Source Cal pass window: `0.9985 .. 1.0015` (ratio).
- Gain Cal pass window: `0.9 .. 1.1` (ratio).
- Leakage Current test pass window: `0.937 .. 1.06` (ratio).
- Leakage Voltage constants seen in compare path: `0.95`, `0.99`.
- ESR center constant: `2.20E-8` with recovered band `2.00E-8 .. 2.40E-8`.
- ESR fixture point: `0.022 uF` (`0.0219 uF` actual noted in prompts).

## 5) Full sequence (operator order)

1. Power/wiring setup.
- Connect PA251 to LC103.
- Connect RS-232 PC to LC103.
- Connect 39G219 from LC103 front panel to LC103 Final Test Box.
- Connect IEEE cable path used by your legacy fixture.
- Power on the LC103.

2. Open app and load files.
- Use F1/path setup if needed.
- Load `P071_03.CAL` for capacitance.
- Load `P072_1.cal` (or approved `P072_10.CAL`) for inductance.
- Confirm software revision/profile match.

3. Run lead integrity checks first.
- Lead open check.
- Lead short/zero check (including Inductance and ESR branches).
- Continue only if these pass.

4. Current Source Calibration.
- Keep UUT connected through Final Test Box as prompted.
- Run Current Source Cal.
- Accept only pass values inside `0.9985 .. 1.0015`.

5. Gain Calibration.
- Keep UUT connected through Final Test Box gain path.
- Run Gain Cal.
- Accept only pass values inside `0.9 .. 1.1`.

6. Capacitance Calibration (7 ranges).
- Follow prompts to move black/red lead and shorting exactly as instructed.
- Apply low and high standard for each range below.

| Range | Low (F) | High (F) |
|---|---:|---:|
| C0 | 202.7e-12 | 1704.0e-12 |
| C1 | 0.004e-6 | 0.018e-6 |
| C2 | 0.04e-6 | 0.18e-6 |
| C3 | 0.4e-6 | 1.765e-6 |
| C4 | 3.849e-6 | 19.580e-6 |
| C5 | 38.20e-6 | 171.21e-6 |
| C6 | 381.04e-6 | 1709.20e-6 |

7. ESR Calibration.
- Set cap decade box to `0.022 uF` (`0.0219 uF` actual).
- Run ESR calibration step.
- Fail condition includes `Cal'ed value >1 ohm` path.

8. Inductance Calibration (7 ranges).
- Follow prompts for L-terminal short and H-terminal lead connection.
- Apply low and high standard for each range below.

| Range | Low (H) | High (H) |
|---|---:|---:|
| L0 | 2.36e-6 | 10.32e-6 |
| L1 | 37.14e-6 | 79.00e-6 |
| L2 | 198.08e-6 | 1.4950e-3 |
| L3 | 1.9983e-3 | 14.964e-3 |
| L4 | 19.952e-3 | 149.42e-3 |
| L5 | 0.19894 | 1.49680 |
| L6 | 1.9948 | 8.1361 |

9. Leakage Voltage Calibration and Leakage Voltage Test.
- Keep UUT on Final Test Box leakage path.
- Run leakage voltage calibration/test steps.
- Legacy flow includes points at `500 V` and `1000 V`.

10. D/A Test.
- Run D/A test using 0% and 10% standards through fixture switch path.
- Proceed only on pass.

11. Leakage Current Test.
- Run leakage current stage.
- Legacy points include `100 uA` and `10 mA`.
- Accept only pass values inside `0.937 .. 1.06`.

12. Ringer trim stage.
- Set ringer box to Yolks/Flybacks and adjust `R1144` to the ring count shown on the ringer box.
- Switch ringer box to Switching Transformers and adjust `R1005` to the ring count shown on the ringer box.

13. Finalize.
- Write calibration stamp/date/serial if required by workflow.
- Save/export backup calibration data immediately after successful run.

## 6) Extra wiring references recovered from legacy prompts

- 10V trim measurement points:
  - DVM `+` to `TP1006`
  - DVM `-` to `TP1020`

## 7) Known limits of recovered data (do not guess)

- Full internal netlist/pinout of the original Final Test Box is not fully recovered.
- Complete per-index CALSET payload schema is not fully recovered from static assets.
- If your fixture differs from factory fixture, validate each stage in read-only mode before write-enable.
