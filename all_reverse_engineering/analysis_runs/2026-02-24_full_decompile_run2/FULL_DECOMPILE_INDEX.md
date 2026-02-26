# LC103 Full Decompile Index (Run2)

## Scope
- Input tree: `/Users/<user>/Downloads/LC103`
- Full-file static coverage: all discovered files processed.
- Executable decompile coverage: all executable-format candidates processed with Ghidra headless.

## Coverage
- `manifests/file_catalog.tsv`
- `manifests/coverage_matrix.tsv`
- `manifests/coverage_stats.txt`

## Core Artifacts
- Per-file strings+offsets: `strings_offsets/`
- Per-file binwalk signatures: `binwalk_scan/`
- Per-file recursive extraction: `binwalk_extract/`
- Archive unpack results: `unpack/`
- Archive unpack index: `manifests/unpack_files_rel.txt`

## Executable Decompile Artifacts
- Status: `ghidra/ALL_EXEC_SUMMARY.txt`
- Run rows: `ghidra/ghidra_runs_all_exec.tsv`
- 103FIN EXE:
  - `ghidra/Final_Cal_103FIN_EXE_functions_full.csv`
  - `ghidra/Final_Cal_103FIN_EXE_calls_full.csv`
  - `ghidra/Final_Cal_103FIN_EXE_decomp_full.txt`
- LVDEVICE DLL:
  - `ghidra/Final_Cal_LVDEVICE_DLL_functions_full.csv`
  - `ghidra/Final_Cal_LVDEVICE_DLL_calls_full.csv`
  - `ghidra/Final_Cal_LVDEVICE_DLL_decomp_full.txt`
- NI-DAQ DLLs:
  - `ghidra/Final_Cal_nidaq_dll_*_full.*`
  - `ghidra/nidaq32_nidaq32_dll_*_full.*`

## Command/Prompt Reconstruction
- Command token hits (103FIN): `notes/103FIN_command_hits_strict2.txt`
- Command token context: `notes/103FIN_command_hits_strict_context.txt`
- Wizard prompt candidates (narrow): `notes/wizard_prompt_candidates_narrow.txt`
- Wizard prompt candidates (cleaned): `notes/wizard_prompts_cleaned.txt`
- Snippet pack: `notes/COMMAND_PROMPT_SNIPPETS.md`

## Tooling Limits
- LabVIEW `.llb/.vi` internals are proprietary; this run captures maximum extractable artifacts using installed local tooling plus Ghidra on executable containers.
