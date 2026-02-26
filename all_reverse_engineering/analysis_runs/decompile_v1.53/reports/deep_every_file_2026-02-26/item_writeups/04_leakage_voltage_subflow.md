# Item 4: Leakage-Voltage Subflow Prompts and Tolerance Labels

## What was found
The leakage-voltage test VI contains explicit prompt strings for setting UUT voltage, applying voltage to leads, and tolerance-associated labels.

## Primary evidence
- Extracted VI: `/Users/<user>/LC103/decompile_v1.53/reports/deep_every_file_2026-02-26/lv3_extract/Leakage voltage test.vi`
- Related prompt corpus entries in mainboard LLB families:
  - `/Users/<user>/LC103/decompile_v1.53/reports/deep_every_file_2026-02-26/prompts2/Source_LV3_1_MAINB_II.LLB.txt`
  - `/Users/<user>/LC103/decompile_v1.53/reports/deep_every_file_2026-02-26/prompts2/Source_LV5_1_Mainb_ii.llb.txt`
  - `/Users/<user>/LC103/decompile_v1.53/reports/deep_every_file_2026-02-26/prompts2/Source_LV6_Mainb_ii.llb.txt`

## Strings recovered from `Leakage voltage test.vi`
- `Set Voltage on UUT` (offset `78188`)
- `Do Test????` (offset `78652`)
- `Apply voltage to leads` (offset `78920`)
- `Tolerance` labels at multiple offsets (`5341`, `5369`, `48641`, `72047`...)
- `0.30` (offset `74896`)
- `10.5` (offset `78380`)

## Important interpretation notes
- This item gives direct UI/prompt evidence for leakage-voltage staging.
- Command tokens like `LKI` and `CPO` are strongly evidenced in command docs/OCR and broader prompt corpora, but not as clean plain-string hits in this standalone extracted VI file.
- Therefore, leakage-voltage prompt sequence is high confidence; exact per-step serial command bind for each prompt is still partial unless confirmed in deeper block-diagram decode.

## Confidence and limitations
- High confidence: prompt texts and numeric labels above.
- Medium confidence: mapping each prompt to exact command emission event without full VI dataflow reconstruction.

## App-integration value
- Safe to implement these as explicit operator wizard instructions.
- Keep serial-command routing behind a profile table and mark any prompt-to-command mapping not yet diagram-verified as provisional.
