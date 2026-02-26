# Item 3: Power-Board Safety Prompts and LS Sequence

## What was found
The power-board test flow includes explicit operator safety prompts and a recoverable high/low LS setpoint + check sequence.

## Primary evidence
- Extracted VI: `/Users/<user>/LC103/decompile_v1.53/reports/deep_every_file_2026-02-26/lv3_extract/PWRtest.vi`

## Safety workflow strings
Initial block:
- `INITIAL STEP: Attach DVM and computer cable`
- `--TURN SAFETY OFF--`
- `--TURN TESTER POWER ON--`
- `Press READY when previous step is complete.`

Final block:
- `FINAL STEP:`
- `--Turn SAFETY OFF--`
- `--Discharge caps--`
- `Short TP4 with the cathode side of D2 with a jumper wire`
- `--Remove UUT from tester, Proceed to next UUT`

## LS setpoints and checks recovered
Low LS path:
- `Set Low LS to 0V` + `Low End Check`
- `Set Low LS to 1V` + `1V Check`
- `Set Low LS to 4V` + `4V Check`
- `Set Low LS to 16V` + `16V Check`
- `Set Low LS to 28V` + `28V Check`
- `Set Low LS to 32V` + `32V Check`

High LS path:
- `Set High LS to 33.0V` + `33.0V Check`
- `Set High LS to 125V` + `125V Check`
- `Set High LS to 500V` + `500V Check`
- `Set High LS to 875V` + `875V Check`
- `Set High LS to 1000V` + `1000V Check`
- `Set High LS to 0V`

Calibration hints:
- `Approx. 128 counts/volt` (low side)
- `Approx. 4.0 counts/volt` (high side)

## Offset examples (decimal)
- Safety blocks: `711396..712271`, duplicate at `718989..719265`.
- Low LS cluster: `679496..685832`.
- High LS cluster: `688780..697368`.

## Confidence and limitations
- High confidence on prompt text and setpoint values.
- Medium confidence on exact pass/fail boundaries for each LS checkpoint (text confirms checks, not numeric comparator windows).

## App-integration value
- Implement safety interlocks exactly as blocking wizard steps.
- Present LS setpoints/checkpoints in fixed order with operator confirmation at each stage.
- Include mandatory discharge instruction before workflow completion.
