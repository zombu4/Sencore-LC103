# LC103 Autocal Explorer (Best Guess)

Simple Qt app to help iterate on LC103 RS-232 calibration command sequencing safely.

## What It Does

- Connects to a selectable serial port.
- Sends manual commands (with optional CR/LF append).
- Provides quick buttons for likely service commands.
- Runs an editable command sequence with configurable delay.
- Stops sequence automatically if RX text contains error markers.
- Supports `Dry run` mode (log-only, no serial writes).
- Blocks calibration value-write commands by default:
  - `CALSET`
  - `CALF` (non-`?` form)
  - `CALDATE` (non-`?` form)
  - `SER#` (non-`?` form)
- Saves full transcript to a log file.

## Launch

```bash
cd /Users/<user>/LC103/qt_autocal_console
python3 app.py
```

## Suggested First Use

1. Keep `Dry run` enabled and verify sequence/log behavior.
2. Connect serial and test read-only query commands first:
   - `SER#?`
   - `CALCHK`
   - `CALDATE?`
3. Only then disable `Dry run` and enable risk acknowledgment for mutating commands.
4. Keep `Block value writes` enabled during discovery. Disable it only when payload format is verified.
5. Iterate `CALSET` / `CALF` payload guesses one step at a time while saving logs.

## Notes

- Defaults are conservative and may not match factory software exactly.
- This is an exploration tool, not a proven factory calibration implementation.
