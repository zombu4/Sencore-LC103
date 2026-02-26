# Item 7: `LC103 fixes.xlsx` as Diagnostics and Failure-Knowledge Corpus

## What was found
The workbook is a structured historical failure/fix dataset with useful calibration-adjacent fault patterns.

## Primary evidence
- Source workbook: `/Users/<user>/Downloads/LC103/LC103 fixes.xlsx`
- Parsed cells TSV: `/Users/<user>/LC103/decompile_v1.53/reports/deep_every_file_2026-02-26/text/lc103_fixes_cells.tsv`

## Dataset characteristics
- Parsed rows: `321` lines (header + populated records).
- Columns captured: sheet, cell, value.
- Contains issue statements, component-level fixes, tech names, and dates.

## High-signal calibration-adjacent entries (examples)
- `Unit failes range 5 of the current source cal.`
- `Fails first range of current source cal.` + `K1 relay intermittent...`
- `Fails leakage current - 9uA range.`
- `D/A says 'component out of test range'`
- `D/A won't read above zero, all other functions work.`
- `D/A fails the zero range. 10% appears to be normal`
- `Ringers drift several counts`
- `display overranges when lkg button is pushed with leads open`

## Hardware-fault trend signals
- Repeated relay involvement (`K1001`, `K1002`, `K1` intermittent cases).
- Leakage and current-source faults correlate with analog path components/diodes in notes.
- D/A failures often associated with discrete leakage behavior and component aging.

## Confidence and limitations
- High confidence: workbook text extraction is direct.
- Medium confidence: failure-cause ranking needs statistical cleanup due free-form note style.

## App-integration value
- Use as troubleshooting knowledge base for calibration failures.
- During wizard fail events, present ranked likely causes linked to failed stage (non-destructive guidance only).
- Keep this corpus separate from command/control logic to avoid contaminating deterministic calibration sequencing.
