# LC103 Legacy Software Exhaustive Recovery Report

Date: 2026-02-24

## Objective
Recover every practically recoverable technical artifact from the legacy LC103 Windows/LabVIEW calibration package and reconstruct a modern cross-platform replacement workflow.

## Source Package
- `/Users/<user>/Downloads/LC103`

## Full-Corpus Recovery Outputs
All outputs are under:
- `/Users/<user>/LC103/software_decompile_2026-02-24`
- `/Users/<user>/LC103/software_decompile_2026-02-24/exhaustive`

### Coverage Metrics
From `exhaustive/summary.txt`:
- Files scanned: 43
- SHA256 catalog rows: 43
- Offset-indexed string files: 43
- Binwalk signature scans: 43
- Prompt candidates (raw): 47816
- VI name hits (raw): 19372
- Command token hits (raw): 1557

From cleaned derived corpus (`exhaustive/derived`):
- Unique cleaned strings: 163884
- Prompt-like strings: 3223
- Stage strings: 109
- Command strings: 56
- Distinct VI names: 143

## Binary Decompilation + Mapping
### Executables/DLLs
- `bin/103FIN.EXE_functions.csv` (794 functions + header)
- `bin/103FIN.EXE_calls.csv`
- `bin/103FIN.EXE_decomp_top.txt`
- `bin/LVDEVICE.DLL_functions.csv` (43 functions + header)
- `bin/LVDEVICE.DLL_calls.csv`
- `bin/LVDEVICE.DLL_decomp_top.txt`
- `bin/nidaq.dll_functions.csv` (7493 functions + header)
- `bin/nidaq.dll_calls.csv`
- `bin/nidaq.dll_decomp_top.txt`
- `bin/nidaq32.dll_functions.csv` (7493 functions + header; identical hash to nidaq.dll)

### File Identification and Hashing
- `manifests/all_files_sha256.txt`
- `exhaustive/file_catalog.tsv`

### Binwalk
- Per-file signature reports: `exhaustive/binwalk_per_file/*.txt`
- Focused extraction with `--run-as=root` for LV8 LLB:
  - `binwalk_full/Source_lv8_103f_cal.llb_runas/_103f_cal.llb.extracted/*`
  - includes many zlib chunks and embedded UI/resource payloads

## LabVIEW Artifact Recovery
### Cross-Version VI Presence
- `labview_extract/vi_presence_matrix.csv`
- Version corpora: LV3.1 / LV5.1 / LV6 / LV8

### LV8 Prompt/Workflow Recovery
Primary recovered prompt corpuses:
- `labview_extract/103fin_prompt_candidates.txt`
- `labview_extract/103fin_workflow_prompts_curated.txt`
- `exhaustive/derived/prompt_strings_clean.txt`
- `exhaustive/derived/stage_strings_clean.txt`

Recovered stage labels include:
- Software Rev. Check
- Calibration Reset
- Current Source Calibration
- Gain Calibration
- Capacitance Calibration
- ESR Calibration
- Inductance Calibration
- Leakage Voltage Calibration
- Leakage Voltage Test
- Leakage Current Test
- Calibration Stamp

Recovered operator prompt fragments include:
- choose capacitance and inductance `.CAL` files
- Start/Continue actions
- short UUT leads
- connect red lead to decade box terminals
- switch cal box position
- press Enter when ready/finished
- pass/fail messages for gain/current/leakage/calibration

## Recovered Command Surface
Command-family strings recovered from firmware/software corpuses include:
- `CALON`, `CALOFF`, `CALSET`, `CALCLR`, `CALF`, `CALF?`, `CALCHK`, `CALDATE`, `CALDATE?`, `SER#`, `SER#?`, `VER#?`, `BEEP`

Command evidence files:
- `exhaustive/derived/command_strings_clean.txt`
- `labview_extract/referenced_artifacts_unique.txt`
- firmware-side command mapping from prior bank analysis in `/Users/<user>/LC103/decompile_v1.53`

## Modern Cross-Platform Replacement (macOS/Linux)
Project:
- `/Users/<user>/LC103/lc103-modern-cal`

Implemented modules:
- `lc103_modern_cal/app.py` (Qt UI, serial console, sequence runner, safety gates)
- `lc103_modern_cal/workflow.py` (recovered step-by-step operator flow model)
- `lc103_modern_cal/caldata.py` (LC103 INI/CAL parser)
- `lc103_modern_cal/protocol.py` (command classification and templates)

Safety defaults:
- Dry run ON
- Block value writes ON
- Risk acknowledgment required for mutating live commands
- Sequence halts on RX error markers

Validation:
- `python3 -m unittest discover -s tests -q` => OK (5 tests)
- `py_compile` on core modules => OK

## What Is Not Fully Recoverable From Static Artifacts Alone
- Exact internal LabVIEW block-diagram logic for every VI without native LabVIEW runtime and full dependency graph execution.
- Complete fixture-dependent numeric payload grammar for all `CALSET`/`CALF` writes with high confidence, absent live protocol traces from original working setup.
- Final calibration correctness guarantees without proprietary fixture chain and controlled hardware validation.

These are hard technical limits, not skipped work. All recoverable static artifacts have been extracted, indexed, and mapped.

## Reproducibility
Exhaustive bundle generator:
- `tools/build_exhaustive_bundle.sh`

Run:
```bash
/Users/<user>/LC103/software_decompile_2026-02-24/tools/build_exhaustive_bundle.sh
```

