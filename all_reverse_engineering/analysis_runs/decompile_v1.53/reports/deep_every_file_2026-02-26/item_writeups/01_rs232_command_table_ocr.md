# Item 1: RS232 Command Table Recovered from Pull-Chart OCR

## What was found
The pull-chart PDF contains a full RS232 command reference page with three command families and a value-multiplier section.

## Primary evidence
- PDF: `/Users/<user>/Downloads/LC103/LC103 simplified operating instructions (pull chart).pdf`
- OCR pass A (4x): `/Users/<user>/LC103/decompile_v1.53/reports/deep_every_file_2026-02-26/pdf_ocr/page08_4x_psm11.txt`
- OCR pass B (sharpened): `/Users/<user>/LC103/decompile_v1.53/reports/deep_every_file_2026-02-26/pdf_ocr/page08_sharp_psm11.txt`

## Decoded command sets
Component-type commands (high confidence):
- `ALM`/`SLM` (OCR variant), `DBL`, `TAN`/`AN` (OCR variant), `CER`, `AOC`, `COL`, `YFB`, `SWX`/`x` (OCR variant).

Test-function commands (high confidence):
- `CAP`, `LKI`, `LKR`, `D/A`, `ESR`, `IND`, `RIN`, `CIC`/`cic` (OCR variant), `EIC`, `IC`/`iC` (likely in-circuit inductance token).

General commands (high confidence):
- `LDO`, `LDS`, `NFC`, `CPO`, `Ctrl R`, `Ctrl O`.

## Line-level evidence snapshots
From `page08_sharp_psm11.txt`:
- `LKI` appears at line 89.
- `CPO` appears at line 165.
- `Ctrl R` appears at line 171.
- `Ctrl O` appears at line 175.
- `LDO` appears at line 147.
- `LDS` appears at line 151.

From `page08_4x_psm11.txt`:
- `CAP` appears around line 85.
- `LKR` appears around line 101.
- `D/A` appears around line 109.
- `ESR` appears around line 117.
- `IND` appears around line 123.
- `RIN` appears around line 129.
- `CPO` appears at line 165.

## Confidence and limitations
- High confidence: command tokens listed above (except OCR variants where one character differs).
- Medium confidence: exact in-circuit inductance token (`IC` vs `IIC`) due scan quality.
- Low confidence: the `VALUE MULTIPLIERS` mnemonic table is still not fully legible.

## App-integration value
- These tokens can seed strict command enums and parser aliases in the modern app.
- OCR variants should be stored only as decode aliases, not as canonical tokens.
- `VALUE MULTIPLIERS` should remain gated until independently confirmed from binary/VI logic.

## Recommended follow-up
- Re-OCR with higher DPI or cleaner scan source for multiplier table.
- Validate command-token acceptance on UUT in read-only mode first.
