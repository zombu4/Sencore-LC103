# Qt Rebuild Blueprint (Legacy LC103 Final Cal)

## Goal
Rebuild the full legacy calibration host workflow in a modern Qt UI that runs on macOS and Linux.

## Legacy Input Surface (Recovered)
Source package:
- `/Users/<user>/Downloads/LC103`

Recovered host/runtime artifacts:
- `Final Cal/103FIN.EXE` (main host executable)
- `Final Cal/LVDEVICE.DLL` (LabVIEW support layer)
- `Final Cal/nidaq.dll` + `nidaq32/nidaq32.dll` (NI runtime components)
- LabVIEW project archives across LV3/LV5/LV6/LV8
- Calibration data files (`P071_03.CAL`, `P072_xx.CAL`, `LC103 Cal Data.ini`)

Recovered stage flow:
1. Software Rev. Check
2. Calibration Reset
3. Current Source Calibration
4. Gain Calibration
5. Capacitance Calibration
6. ESR Calibration
7. Inductance Calibration
8. Leakage Voltage Calibration
9. Leakage Voltage Test
10. Leakage Current Test
11. Calibration Stamp

Recovered prompt actions:
- choose cap/ind cal files
- short leads
- connect/disconnect red lead
- connect UUT and/or DVM leads
- switch cal box position
- press Enter when ready/finished

## Rebuild Architecture (Qt)
### UI Layer
- Serial panel: connect/disconnect, UART settings.
- Safety panel: dry-run, value-write lock, risk ack.
- Calibration data panel: load/parse `.ini` and `.CAL` files.
- Guided workflow panel: stage-by-stage prompts and completion tracking.
- Sequence editor/runner: editable script + transcript logging.

### Engine Layer
- `caldata.py`: parse and normalize legacy file formats.
- `protocol.py`: classify commands (query/mutating/value-write), sequence templates.
- `workflow.py`: recovered stage model + per-step prompts + command hints.
- Serial transport (Qt SerialPort): deterministic command/response framing.

### Safety Controls
- Default mode is read-only exploration.
- Block value-write commands by default (`CALSET`, `CALF`, `CALDATE`, `SER#`).
- Require explicit risk acceptance before mutating commands in live mode.
- Stop sequence when RX includes known error markers.

## Dependency Mapping For Reimplementation
Key legacy dependency families recovered from artifacts:
- Comms: `RS-232 Communications.vi`, `Open Serial Driver.vi`, `Serial Port*.vi`, `Send.vi`, `Receive.vi`
- Calibration control: `103FINAL.VI`, `CALSET.VI`, `CALCLEAR.VI`, `CAP_CAL.VI`, `IND_CAL.VI`, `ESR_CAL.VI`, `GAIN_CAL.VI`, `ISRC_CAL.VI`, `Leak_CAL.VI`
- Support/control: `REV_CHK.vi`, `SER_SET.VI`, `EEPROM.VI`, `UUT Comm.vi`
- Runtime DLLs: `LVDEVICE.DLL`, `NIDAQ.DLL`, `nidaq32.dll`, system DLL imports

Reference file:
- `/Users/<user>/LC103/software_decompile_2026-02-24/labview_extract/dependency_tokens_summary.txt`

## Implementation Status
Implemented now:
- cross-platform Qt app baseline with safety-first serial command flow
- file parser + sequence engine + guided recovered workflow
- tests for parser and protocol logic

Still required for full parity:
- fixture-specific payload schemas for all mutating steps (`CALSET`/`CALF` variants)
- hardware-in-the-loop prompt validation and transcript capture
- optional step-level expected-response assertions once command grammar is fully validated
