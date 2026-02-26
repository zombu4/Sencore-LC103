# LC103 Legacy App — Newly Recovered Undiscovered Parts (2026-02-25)

## Scope
- Corpus: `/Users/<user>/Downloads/LC103` and extracted VI set under `/Users/<user>/LC103/decompile_v1.53/lv_extract/lv3_1`
- Method: unfiltered strings/offset review across `MAINB_II`, `PWRTEST`, and core calibration helper VIs.
- Goal: identify additional app behaviors not fully represented in existing final-cal wizard mapping.

## New findings

### 1) Separate **Power Board Test** workflow exists (outside main final-cal wizard)
Evidence:
- `Source_LV5_1_Pwrtest.llb.txt:163130` -> `Power Board test Version`
- `Source_LV5_1_Pwrtest.llb.txt:167647` -> `Turn Safety switch ON`
- `Source_LV5_1_Pwrtest.llb.txt:167861` -> `--TURN TESTER POWER ON--`
- `Source_LV5_1_Pwrtest.llb.txt:167702` -> `Batt. voltage.`
- `Source_LV5_1_Pwrtest.llb.txt:167a4e` -> `--Remove UUT from tester, Proceed to next UUT`
- Same family appears in LV3/LV6 PWRTEST libraries.

Impact:
- Legacy app contains a dedicated tester flow for power-board validation that is distinct from the LC103 final calibration sequence.

### 2) Separate **Mainboard Tester** harness module exists (fixture #74C216-1)
Evidence:
- `Source_LV5_1_Mainb_ii.llb.txt:17f50c` -> `1) Plug in and turn on LC103 Mainboard test box.`
- `Source_LV5_1_Mainb_ii.llb.txt:17f53d` -> `2) Attach power adapter and RS-232 cable to LC103`
- `Source_LV5_1_Mainb_ii.llb.txt:17f56f` -> `Mainboard tester (#74C216-1).`
- `Source_LV5_1_Mainb_ii.llb.txt:17f591` -> `3) Connect Fluke 8840A to DVM plugs on front panel of test box.`
- `Source_LV5_1_Mainb_ii.llb.txt:17f611` -> `5) Connect 50 pin ribbon cable from PC to right side of test box.`
- `Source_LV5_1_Mainb_ii.llb.txt:1d9bd1` -> `Send DIO setting to tester`

Impact:
- Confirms legacy ecosystem had dedicated mainboard fixture automation with DIO control signaling, not only UUT final cal flow.

### 3) Hidden **lead integrity test** routines recovered
Evidence:
- `LEADOPEN.vi:111288` -> `Lead Open Test/Caps`
- `LEADSHRT.vi:152148` -> `Lead Zero Short Test`
- `LEADSHRT.vi:154252` -> `Lead Zero Short Test/Inductance`
- `LEADSHRT.vi:154364` -> `Lead Zero Short Test/ESR`
- `LEADSHRT.vi:151927` -> `Make sure the UUT leads are shorted together.`
- `test.vi:111835` and repeated offsets -> `Short the UUT leads to the`

Impact:
- There are explicit lead-open/lead-short verification subflows (caps/ESR/inductance contexts) beyond the currently modeled wizard steps.

### 4) Calibration memory/reset path has explicit abort/write-error behavior
Evidence:
- `EEPROM.vi:112371` -> `Row 0: Default Calibration Factors`
- `EEPROM.vi:112808` -> `Calibration Reset`
- `EEPROM.vi:113004` -> `Reset Aborted.`
- `EEPROM.vi:117220` and `EEPROM.vi:123945` -> `EEPROM Write Error!`
- `EEPROM.vi:122148` -> `End Cal Factor(59)`
- `EEPROM.vi:124299` -> `Start Cal Factor(0)`

Impact:
- Legacy reset is not a blind clear; it includes abort/error branches and an explicit calibration-factor index range (`0..59`).

### 5) Command-format helpers recovered with stronger evidence
Evidence:
- `GET_CF.vi:26772` -> `CALF?`
- `GET_CF.vi:26879` -> `CALF? xx`
- `SND_CF&V.vi:33624` -> `CALF`
- `SND_CF&V.vi:33899` -> `CALF_xx_x.xxxxExx`
- `SER_SET.vi:71324` and `SER_SET.vi:74962` -> `SER#`
- `Caldate.vi:56820` and `Caldate.vi:57295` -> `CALDATE`
- `CALCLEAR.vi:57892` -> `CALCLR`
- `CALCLEAR.vi:54256/55400` -> `CALOFF` / `CALON`

Impact:
- Confirms concrete formatting expectations for cal-factor write payloads and explicit reset/serial/date command stages in helper VIs.

### 6) Internal status machine encoding is explicitly present
Evidence:
- `GetDevInfoShort.vi:630` -> `Status state (Passed/Failed, Ready/Not Ready)`
- `Source_LV5_1_Pwrtest.llb.txt:39f98` -> same status-state string in PWRTEST context.

Impact:
- Legacy flow tracks a compact state model (`ready/pass/fail`) that can be mirrored in modern UI state handling.

### 7) Porting constraint in LV8 conversion warnings (important for modern rebuild)
Evidence:
- `Source/lv8/warnings.txt` states:
  - `DIO Port Config.vi` uses CIN external subroutine not supported in LV8.
  - `DIO Port Read.vi` uses CIN external subroutine not supported in LV8.

Impact:
- DIO operations depend on legacy external subroutine behavior and must be reimplemented/replaced, not assumed portable from old VI conversion.

## Unknowns still open
1) Exact call order linking `LEADOPEN/LEADSHRT/test.vi` into final-cal sequence remains partially unresolved.
2) Exact semantics of each cal-factor index (`0..59`) still need full per-index mapping to stage/range.
3) DIO message format behind `Send DIO setting to tester` is not decoded yet.

## Recommended next high-value passes
1) Build cross-reference call graph from `103f_cal.xml` section indices to identify invocation order for `LEADOPEN`, `LEADSHRT`, `EEPROM`, `CALCLEAR`, `SND_CF&V`, `GET_CF`.
2) Recover per-index `CALF` map by tracing factor-index consumers around `Start/End Cal Factor` loops.
3) Decode DIO control payloads in `MAINB_II` path (`Send DIO setting to tester`) and tie to fixture actions.
