# LC103 v1.53 Front-Panel Hidden Function Status

Date: 2026-02-26
Firmware: `Sencore_LC103_FW_v1.53.BIN` (SHA-256 `a76c27fd38aa190e4e4f03fedf5a8a57484d542521e18181ffe15606fb5079e0`)

## Conclusion (current evidence)
- No confirmed hidden front-panel submenu or secret key-combo calibration menu has been recovered from current static RE artifacts.
- Hidden/service calibration write functionality is confirmed on the RS232 command path.

## What is confirmed
1. RS232 calibration/service command tokens exist in firmware string tables:
   - `CALON`, `CALOFF`, `CALSET`, `CALCLR`, `CALF`, `CALF?`, `CALCHK`, `CALDATE`, `CALDATE?`
   - `SER#`, `SER#?`, `GAIN`, `ISRC`, `BEEP`
2. Old host software workflow and parser analysis support factory/service use of `CAL*` commands.
3. Front-panel procedure operations exist (ringer and leakage hold checks), but these are not evidence of a hidden calibration submenu.

## Evidence pointers
- Firmware command token region (bank0):
  - `fw153_full_source_annotated.lst` lines around `0x03026..0x03076` and `0x031D8..0x0322E`
- Decompiled report (factory/service command family + parser behavior):
  - `analysis_runs/decompile_v1.53/reports/LC103_v1.53_autocal_reevaluation_2026-02-24.md`
- Procedure document (known panel hold operations):
  - `source_material/source_downloads/LC103 CALIBRATION PROCEDURE.txt` lines 29-35 and 52

## Practical boundary for app and process
- Treat calibration data/state writes as RS232-driven (`CAL*` flow).
- Treat panel-only operations as operator checks/adjustments unless a concrete key-scan branch and trigger condition are recovered from firmware control flow.

## Unknowns
- A hidden panel mode could still exist but has not been proven in current static artifacts.
- To raise confidence from "not confirmed" to definitive, recover and annotate key-scan/debounce dispatch with explicit trigger combinations and state transitions.
