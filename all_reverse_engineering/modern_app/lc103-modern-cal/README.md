# LC103 Modern Cal (macOS/Linux)

Cross-platform replacement for the legacy LC103 Final Cal flow.

This project is built from recovered artifacts in:
- `/Users/<user>/Downloads/LC103`
- `/Users/<user>/LC103/software_decompile_2026-02-24`

## Goal
Rebuild the old app flow as close as possible on modern systems with:
- legacy stage options
- Start/Continue wizard behavior
- ordered instructions/prompts
- backup/restore support

## Install

```bash
cd /Users/<user>/LC103/lc103-modern-cal
python3 -m venv .venv
. .venv/bin/activate
pip install -U pip
pip install -e .
```

## Run

```bash
lc103-modern-cal
```

or:

```bash
python3 -m lc103_modern_cal.main
```

## Legacy-Compatible UI
- `Detect + Connect`
- Stage presets:
  - `All (Not Ringer)`
  - `All Stages`
  - `None`
  - `Rebuild Plan`
- Stage options mirror old labels and recovered flow controls:
  - `Harness/Test Box Setup`
  - `Mainboard Fixture DIO Setup`
  - `Pass/Fail Indicator Visibility`
  - `Calibration Data File Selection`
  - `Software Rev. Check`
  - `Calibration Reset`
  - `Lead Open Test (Caps)`
  - `Lead Zero Short Test (Inductance/ESR)`
  - `10V Ref Calibration`
  - `Current Source Calibration`
  - `Gain Calibration`
  - `Capacitance Calibration`
  - `ESR Calibration`
  - `Inductance Calibration`
  - `Ringer Calibration`
  - `Leakage Voltage Calibration`
  - `D/A Test`
  - `Leakage Voltage Test`
  - `Leakage Current Test`
  - `Calibration Stamp`
  - `Power Board Tester Flow`
- Wizard controls:
  - `Start Button`
  - `Continue Button`
  - `Send Step Commands`
  - `Import Legacy Transcript`
  - `Run Golden Corpus`
- Legacy trigger mirroring:
  - explicit Start gate (`wait for start button` / `press to start` markers)
  - recovered setup gate prompt (`Press ENTER when ready, choose test to perform and press START`)
  - recovered file-path control prompt (`Press F1 to change paths`)
  - recovered pass/fail indicator visibility prompt (`Set Pass/ Fail Indicator and make it visible`)
  - per-step READY/ENTER gate before Continue
  - pass/fail branch gate (`do next test if previous test passed`)
  - automatic range-step synchronization on `Next Range to cal` prompts
  - optional auto-sync to future-step markers if legacy flow jumps ahead
- Safety controls:
  - `Enable live write commands`
  - `Auto-send safe step probes`
  - `Auto-sync to legacy prompt markers`
  - `Auto-advance on legacy pass/next prompts`
- Transcript replay:
  - imports legacy logs/text and replays recovered trigger logic against current plan
  - writes `*_parity_replay.json` with step coverage, transitions, and gate states
- Golden corpus:
  - bundled `golden_parity_corpus.json` scenarios derived from recovered old-app cues
  - runs deterministic parity checks and writes `lc103_golden_corpus_report_*.json`
- Full recovered logic reference:
  - `docs/LEGACY_COMPLETE_LOGIC.md`
- Fixture build/reference values:
  - `docs/FIXTURE_SPEC_LC103.md`
  - `docs/FIXTURE_REFERENCE_MATRIX_LC103.md`

## Backup / Restore
- Backup captures query responses (`SER#?`, `VER#?`, `CALDATE?`, `CALCHK`, `CALF?`) into JSON.
- Restore loads backup JSON and replays restore commands only after explicit typed confirmation (`RESTORE`).
- Restore auto-halts on error markers from RX text.
- If backup does not contain parseable restore commands, restore is blocked.

## Notes on “100% old app parity”
- This implementation is very close in operator flow and stage sequencing.
- Exact parity is still limited by opaque proprietary LabVIEW internals and partially unknown mutating payload schemas.
- Placeholder template commands have been removed from the wizard plan.

## Tests

```bash
cd /Users/<user>/LC103/lc103-modern-cal
python3 -m unittest discover -s tests -q
```
