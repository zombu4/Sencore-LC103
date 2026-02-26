# Legacy Software Recovery Map

## Scope
Target package: `/Users/<user>/Downloads/LC103`

## Recovered Components
- Win16 host executable: `Final Cal/103FIN.EXE` (NE)
- Win16 support DLL: `Final Cal/LVDEVICE.DLL` (NE)
- NI DAQ runtime DLLs: `Final Cal/nidaq.dll`, `nidaq32/nidaq32.dll` (PE32)
- LabVIEW source libraries across versions:
  - `Source/LV3_1/*.llb`
  - `Source/LV5_1/*.llb`
  - `Source/LV6/*.llb`
  - `Source/lv8/103f_cal.llb`
- Calibration data/config files:
  - `P071_03.CAL`, `P072_1.cal`, `Old Cal Files/P072_10.CAL`
  - `LC103 Final Cal/LC103 Cal Data.ini`
  - `LC103 Final Cal/LC103 Final Cal.ini`

## Decompiled/Indexed Artifacts
Stored under `/Users/<user>/LC103/software_decompile_2026-02-24`:
- `manifests/all_files_sha256.txt`
- `strings/*.strings.txt`
- `labview_extract/vi_presence_matrix.csv`
- `labview_extract/referenced_artifacts_unique.txt`
- `bin/103FIN.EXE_functions.csv` + callgraph/decomp
- `bin/LVDEVICE.DLL_functions.csv` + callgraph/decomp
- `bin/nidaq.dll_functions.csv` + callgraph/decomp
- `bin/nidaq32.dll_functions.csv` + callgraph/decomp
- `binwalk_full/*`

## Deep Prompt Recovery (Host Flow)
Prompt strings recovered from `103FIN.EXE` and LV8 library include:
- `Please choose the file containing the capacitance calibration data.`
- `Please choose the file containing the inductance calibration data.`
- `Software Rev. Check`
- `All (Not Ringer)` / `Start Button` / `Continue Button`
- `Make sure the UUT leads are shorted together.`
- `Make sure the red UUT lead is not connected.`
- `Short the UUT leads to the ...`
- `Now connect the red lead to the ...`
- `Switch the cal box to ...`
- `Press 'Enter' when ready.`
- `Press 'Enter' when finished.`
- `Calibration Successful!!`

Recovered stage names:
- `Calibration Reset`
- `Current Source Calibration`
- `Gain Calibration`
- `Capacitance Calibration`
- `ESR Calibration`
- `Inductance Calibration`
- `Leakage Voltage Calibration`
- `Leakage Voltage Test`
- `Leakage Current Test`
- `Calibration Stamp`
- `Lead Open Test/Caps`
- `Lead Zero Short Test` + sub-branches (`/Inductance`, `/ESR`)

Recovered additional tester branches:
- Mainboard fixture flow (`Mainboard tester #74C216-1`) with `Send DIO setting to tester`
- Power-board tester flow with `Turn Safety switch ON`, `--TURN TESTER POWER ON--`, and `Batt. voltage.`

## Cross-Platform Rebuild
Modern replacement implementation:
- `/Users/<user>/LC103/lc103-modern-cal/lc103_modern_cal/app.py`
- `/Users/<user>/LC103/lc103-modern-cal/lc103_modern_cal/workflow.py`
- `/Users/<user>/LC103/lc103-modern-cal/lc103_modern_cal/caldata.py`
- `/Users/<user>/LC103/lc103-modern-cal/lc103_modern_cal/protocol.py`

This preserves recovered prompt flow and command framework while keeping writes gated.

Detailed stage logic and trigger map:
- `/Users/<user>/LC103/lc103-modern-cal/docs/LEGACY_COMPLETE_LOGIC.md`

Fixture build/reference values:
- `/Users/<user>/LC103/lc103-modern-cal/docs/FIXTURE_SPEC_LC103.md`
- `/Users/<user>/LC103/lc103-modern-cal/docs/FIXTURE_REFERENCE_MATRIX_LC103.md`
