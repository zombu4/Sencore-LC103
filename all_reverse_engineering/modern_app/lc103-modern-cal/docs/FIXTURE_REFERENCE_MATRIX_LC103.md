# LC103 Calibration Fixture and Reference Matrix (Recovered)

Purpose: build-target matrix for replicating legacy LC103 final calibration flow with explicit fixtures, references, units, and pass windows.

Scope:
- This mirrors what is currently recovered from legacy software/assets.
- Unknown/partially-decoded points are explicitly marked.

## 1) Required hardware items

- PA251 power adapter.
- RS-232 cable (host PC to LC103).
- 39G219 front-panel test lead cable.
- IEEE cable to RS232 interface port (legacy bench wiring).
- LC103 Final Test Box (or compatible replica).
- Capacitance decade box.
- Inductance decade box + low-inductance box.
- Ringer calibration box (Yolks/Flybacks + Switching Transformers positions).
- DVM (legacy path references Fluke 8840A/8842 style reads).

## 2) Load Select matrix (fixture core)

Recovered mapping:
- LS0 = `1.1 MOhm` to UUT leads (same function as LS9 path per string note)
- LS1 = `100 kOhm`
- LS2 = `10 kOhm`
- LS3 = `1 kOhm`
- LS4 = `100 Ohm`
- LS5 = `10 Ohm`
- LS6 = `2 kOhm`
- LS7 = `0% D/A` standard
- LS8 = `10% D/A` standard
- LS9 = `100 kOhm` (high-side path)

Named usage strings recovered:
- `1k (low voltage / gain)`
- `2k (gain)`
- `100k (V/I leakage)`

## 3) Stage-by-stage references and limits

### 3.1 Harness/Test setup
- Connect:
  - PA251 -> LC103 rear power
  - RS-232 host -> LC103 RS-232
  - 39G219 -> LC103 front panel -> Final Test Box
  - IEEE cable -> LC103 RS232 interface side
- Compare/limits: none (setup stage).

### 3.2 Software revision / profile selection
- Connect: serial link active.
- Reference data files:
  - `LC103 Cal Data.ini`
  - `P071_03.CAL` (cap)
  - `P072_1.cal` / `P072_10.CAL` (ind)
- Compare: FW revision should match selected profile version family.

### 3.3 10V reference calibration (optional recovered branch)
- Connect:
  - DVM `+` -> `TP1006`
  - DVM `-` -> `TP1020`
- Adjust: `R1045`
- Reference value: `10.000 V`
- Pass window: `9.995 V .. 10.005 V`

### 3.4 Current source calibration (`ISRC_CAL`)
- Connect: UUT/DVM through Final Test Box load-select path.
- Measured quantity: voltage readback internally normalized into `Cal Factor` (unitless ratio).
- Reference target: `Cal Factor = 1.0000`
- Pass window: `0.9985 .. 1.0015`
- Notes:
  - Legacy flow cues: "Lowest Current Range" first.
  - Exact per-substep LS index order remains partially decoded.

### 3.5 Gain calibration (`GAIN_CAL`)
- Connect: Final Test Box gain path.
- Fixture values:
  - LS3 `1 kOhm` (low voltage/gain)
  - LS6 `2 kOhm` (gain)
- Measured quantity: normalized gain factor (unitless ratio from voltage-domain readback path).
- Reference target: `1.0000`
- Pass window: `0.9 .. 1.1` (fail if adjustment >10%).

### 3.6 Capacitance calibration (`CAP_CAL`)
- Connect: capacitance standards via decade box as prompted.
- Reference values (F):
  - C0 low/high: `202.7e-12`, `1704.0e-12`
  - C1 low/high: `0.004e-6`, `0.018e-6`
  - C2 low/high: `0.04e-6`, `0.18e-6`
  - C3 low/high: `0.4e-6`, `1.765e-6`
  - C4 low/high: `3.849e-6`, `19.580e-6`
  - C5 low/high: `38.20e-6`, `171.21e-6`
  - C6 low/high: `381.04e-6`, `1709.20e-6`
- Compare behavior:
  - Uses selected cal-file low/high actual values as references.
  - Legacy SETLD_RD gate evidence indicates a 20% pre-check envelope around expected values.

### 3.7 ESR calibration (`ESR_CAL`)
- Connect: red UUT lead to H terminal of decade box.
- Fixture setpoint: `0.022 uF` (`0.0219` actual noted).
- Compared quantity: RC-time-constant derived ESR calibration value.
- Reference constants: `2.00e-8`, `2.20e-8`, `2.40e-8` (center `2.20e-8`).
- Fail cue recovered: calibrated value outlier text includes `>1 ohm` path.

### 3.8 Inductance calibration (`IND_CAL`)
- Connect: inductance standards/box as prompted.
- Reference values (H):
  - L0 low/high: `2.36e-6`, `10.32e-6`
  - L1 low/high: `37.14e-6`, `79.00e-6`
  - L2 low/high: `198.08e-6`, `1.4950e-3`
  - L3 low/high: `1.9983e-3`, `14.964e-3`
  - L4 low/high: `19.952e-3`, `149.42e-3`
  - L5 low/high: `0.19894`, `1.49680`
  - L6 low/high: `1.9948`, `8.1361`
- Compare behavior:
  - Uses selected cal-file low/high actual values as references.
  - Legacy flow cue: highest inductance range first.

### 3.9 Leakage voltage calibration (`Leak_CAL`)
- Connect: Final Test Box leakage-voltage path.
- Reference voltages recovered in flow/constants:
  - `500 V`, `1000 V`
  - additional branch/set constants seen: `1 V`, `16 V`, `32 V`, `33 V`, `125 V`, `875 V` (power-board branch + leakage math context)
- Compare/limits recovered:
  - ratio/window constants include `0.95`, `0.99`
  - fail strings include `Gain Adjustment >10%` and `Offset Adjustment too high`

### 3.10 D/A test (`DA_TEST`)
- Connect: D/A standards through LS7/LS8.
- Fixture standards:
  - LS7 = `0% D/A`
  - LS8 = `10% D/A`
- Compared quantity: D/A response in voltage-domain read path with derived compare math.
- Recovered constants: `-1.5`, `+1.5`, `0.01` plus `0.0` and `10.0` reference points.

### 3.11 Leakage voltage test (`LEAK_VLT`)
- Connect: Final Test Box leakage voltage test path.
- Reference points: `500 V`, `1000 V`.
- Pass constants seen in test block: `0.95`, `0.99` (ratio-domain compare).

### 3.12 Leakage current test (`LEAK_I`)
- Connect: Final Test Box with load-select + sense-resistor routing.
- Explicit reference points recovered:
  - `100 uA`
  - `10 mA`
- DVM/input reference recovered: `1.111E6 Ohm` (`1.111 MOhm`).
- Recovered matrix columns:
  - `Sense Resistor`
  - `Approx. Current`
  - `Cal Box Setup #`
  - `8842 Mult. factor`
- Pass window recovered: `0.937 .. 1.06` (ratio-domain).

### 3.13 Ringer trim stage
- Connect: Small ringer cal box to UUT as prompted.
- Position 1: `Yolks and Flybacks` -> adjust `R1144` to ring count specified on cal box.
- Position 2: `Switching Transformers` -> adjust `R1005` to ring count specified on cal box.
- Reference count source: external ringer box marking/value (not user-entered fixed number in recovered host flow).

## 4) Known unknowns (cannot be safely invented)

- Full electrical schematic/netlist and exact pinout of factory Final Test Box and ringer box.
- Exact per-index (`0..59`) `CALSET/CALF` argument schema and all conversion equations from static assets alone.
- Complete sense-resistor value table for each leakage-current substep.
- Absolute ring-count standards for ringer trim without the original cal box specification card.

## 5) Evidence anchors

- `/Users/<user>/LC103/lc103-modern-cal/docs/FIXTURE_SPEC_LC103.md`
- `/Users/<user>/LC103/decompile_v1.53/reports/lc103_threshold_matrix_2026-02-25.md`
- `/Users/<user>/LC103/decompile_v1.53/reports/lv3_1_wizard_prompts_2026-02-25.tsv`
- `/Users/<user>/LC103/decompile_v1.53/reports/lc103_logic_deep_extract_2026-02-25.md`
- `/Users/<user>/LC103/source_downloads/LC103 CALIBRATION PROCEDURE.txt`
