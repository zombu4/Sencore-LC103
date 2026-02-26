# LC103 Fixture Spec and Reference Values (Recovered)

This is the working build/reference spec extracted from legacy LC103 calibration assets.

## 1) Required fixture items

High-confidence items (from `LC103 CALIBRATION PROCEDURE.txt` and legacy prompts):

- PA251 power adapter.
- RS-232 cable (PC <-> LC103).
- 39G219 test lead cable (LC103 front panel <-> final test box).
- IEEE cable to RS232 interface port (UUT back-left side).
- LC103 Final Test Box.
- Capacitance decade box (with low/high terminal wiring).
- Inductance decade box and low-value inductance box.
- Small ringer cal box (Yolks/Flybacks + Switching Transformers positions).
- DVM (legacy references Fluke 8840A repeatedly in mainboard/power branches).

Evidence anchors:

- `/Users/<user>/LC103/source_downloads/LC103 CALIBRATION PROCEDURE.txt`
- `/Users/<user>/LC103/software_decompile_2026-02-24/exhaustive/strings_offsets/Source_LV5_1_103f_cal.llb.txt`
- `/Users/<user>/LC103/software_decompile_2026-02-24/exhaustive/strings_offsets/Source_LV5_1_Mainb_ii.llb.txt`

## 2) Load Select map (critical for fixture build)

Recovered directly from legacy source strings:

- `0 = 1.1MOhm connected to UUT leads (same as 9)`
- `1 = 100k`
- `2 = 10k`
- `3 = 1k`
- `4 = 100`
- `5 = 10`
- `6 = 2k`
- `7 = 0% (DA)`
- `8 = 10% (DA)`
- `9 = 100k` (high side)

Named usage strings:

- `100k (low voltage)`
- `10k (low voltage)`
- `1k (low voltage / gain)`
- `2k (gain)`
- `100k (V/I leakage)`

Evidence anchors:

- `Source_LV3_1_103f_cal.llb.txt:26819c..268239`
- `Source_LV5_1_103f_cal.llb.txt:14e4a1..14e53e`
- `Source_LV6_103f_cal.llb.txt:1b9184..1b9221`

## 3) Leakage source reference levels

### Final-cal leakage stage points

- High LS points explicitly used: `500V`, `1000V`.
- Leakage current points explicitly used: `100uA`, `10mA`.
- Leakage current DVM reference seen: `1.111E6` ohm.
- LEAK_I column map:
  - `0: Sense Resistor`
  - `1: Approx. Current`
  - `2: Cal Box Setup #`
  - `3: 8842 Mult. factor`

Evidence anchors:

- `LEAK_VLT.vi` / `LEAK_I.vi` strings in `/Users/<user>/LC103/decompile_v1.53/lv_extract/lv3_1`
- `Source_LV3_1_103f_cal.llb.txt:29d9bf..29da18`

### Power-board branch additional LS levels (separate branch)

Recovered LS meter points (power-board workflow, not default final-cal non-ringer):

- Low LS: `0V`, `1V`, `4V`, `16V`, `28V`, `32V`.
- High LS: `0V`, `33V`, `125V`, `500V`, `875V`, `1000V`.

Evidence anchor:

- `Source_LV5_1_Pwrtest.llb.txt:167496..16d6c2`

## 4) Stage-specific hard references

- 10V reference calibration:
  - DVM `+` to `TP1006`, `-` to `TP1020`, adjust `R1045` to `10.000V +/- 0.005`.
- ESR calibration:
  - Set decade box to `0.022uF` (`.0219` actual) on H terminal path.
- D/A test:
  - Uses `0% D/A` and `10% D/A` standards via Load Select map.
- Ringer:
  - Adjust `R1144` (Yolks/Flybacks) and `R1005` (Switching Transformers) to the ring count shown on ringer box.

Evidence anchors:

- `10V_Set.vi`, `DA_TEST.vi`, `Ringer.vi` in `/Users/<user>/LC103/decompile_v1.53/lv_extract/lv3_1`

## 5) Capacitance and inductance calibration standards

### Capacitance ranges (from `LC103 Cal Data.ini`)

- C0: low `202.7E-12`, high `1704.0E-12`
- C1: low `0.004E-6`, high `0.018E-6`
- C2: low `0.04E-6`, high `0.18E-6`
- C3: low `0.4E-6`, high `1.765E-6`
- C4: low `3.849E-6`, high `19.580E-6`
- C5: low `38.20E-6`, high `171.21E-6`
- C6: low `381.04E-6`, high `1709.20E-6`

Reference files:

- `/Users/<user>/LC103/lc103-modern-cal/lc103_modern_cal/profiles/LC103/LC103 Cal Data.ini`
- `/Users/<user>/LC103/lc103-modern-cal/lc103_modern_cal/profiles/LC103/P071_03.CAL`

### Inductance ranges (from `LC103 Cal Data.ini`)

- L0: low `2.36E-6`, high `10.32E-6`
- L1: low `37.14E-6`, high `79.00E-6`
- L2: low `198.08E-6`, high `1.4950E-3`
- L3: low `1.9983E-3`, high `14.964E-3`
- L4: low `19.952E-3`, high `149.42E-3`
- L5: low `0.19894`, high `1.49680`
- L6: low `1.9948`, high `8.1361`

Reference files:

- `/Users/<user>/LC103/lc103-modern-cal/lc103_modern_cal/profiles/LC103/LC103 Cal Data.ini`
- `/Users/<user>/LC103/lc103-modern-cal/lc103_modern_cal/profiles/LC103/P072_1.cal`
- `/Users/<user>/LC103/lc103-modern-cal/lc103_modern_cal/profiles/LC103/P072_10.CAL`

## 6) What is still not fully recoverable from static assets

- Full physical schematic/netlist of the factory final test box and ringer box.
- Exact per-step CALSET/CALF payload math for every cal-factor index (`0..59`) without full runtime traces or original fixture firmware.
- Exact Sense Resistor values for each leakage current substep (only matrix columns and key reference points were recovered).

## 7) Practical build guidance

- Build fixture around recovered Load Select resistor matrix first (section 2).
- Add explicit LS source rails for leakage voltages (section 3) and current points (100uA/10mA).
- Keep DA standards switchable (0%/10%) and ringer standards switchable (Yolks/Flybacks, Switching Transformers).
- Validate each branch with wizard in dry-run/read-only first before enabling writes.

