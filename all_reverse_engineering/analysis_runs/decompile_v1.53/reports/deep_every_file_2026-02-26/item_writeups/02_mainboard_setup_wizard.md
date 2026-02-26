# Item 2: Mainboard Tester Setup Wizard Text

## What was found
A full operator setup sequence for the LC103 mainboard tester workflow, including named fixtures and operator actions.

## Primary evidence
- Extracted VI: `/Users/<user>/LC103/decompile_v1.53/reports/deep_every_file_2026-02-26/lv3_extract/MAINB_II.vi`
- Prompt corpus (LV3.1): `/Users/<user>/LC103/decompile_v1.53/reports/deep_every_file_2026-02-26/prompts2/Source_LV3_1_MAINB_II.LLB.txt`
- Prompt corpus (LV5.1): `/Users/<user>/LC103/decompile_v1.53/reports/deep_every_file_2026-02-26/prompts2/Source_LV5_1_Mainb_ii.llb.txt`

## Recovered setup sequence (verbatim strings)
1. `1) Plug in and turn on LC103 Mainboard test box.`
2. `Mainboard tester (#74C216-1).`
3. `3) Connect Fluke 8840A to DVM plugs on front panel of test box.`
4. `4) Connect Lo Capacity leads to UUT plugs on front of test box.`
5. `5) Connect 50 pin ribbon cable from PC to right side of test box.`
6. `6) Press ENTER when ready, choose test to perform and press START.`

## Offset evidence (MAINB_II.vi)
- Setup block appears at: `102771`, `102870`, `102904`, `102968`, `103032`, `103098`.
- Duplicate block appears later at: `117431`, `117530`, `117564`, `117628`, `117692`, `117758`.

## Additional workflow cues in same source family
- `Wait for start button to be clicked`
- `Do next test if previous test passed`
- `Loops until all tests pass or "i" = "Retries"`
- `Set "Pass or Fail Global" to "Fail"`

These indicate explicit gated progression and retry control in the test flow.

## Confidence and limitations
- High confidence on setup text and fixture references.
- Medium confidence on exact control-flow branching because strings confirm behavior labels but not full node wiring.

## App-integration value
- Use these exact setup prompts as preflight wizard screens.
- Enforce step-gating: block progression until each prerequisite is confirmed.
- Include explicit tester ID check (`#74C216-1`) as a fixture compatibility warning.
