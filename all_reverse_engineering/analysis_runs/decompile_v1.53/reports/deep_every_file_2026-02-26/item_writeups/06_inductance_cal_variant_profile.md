# Item 6: Alternate Inductance CAL Profile (`P072_1.cal` vs `P072_10.CAL`)

## What was found
Two different inductance calibration datasets exist in the package and are not duplicates.

## Primary evidence
- `/Users/<user>/Downloads/LC103/P072_1.cal`
- `/Users/<user>/Downloads/LC103/Old Cal Files/P072_10.CAL`
- Unified diff and line-by-line compare produced during analysis.

## Side-by-side numeric differences (line 1..14)
1. `8.1288` vs `8.1176`
2. `1.9915` vs `1.9944`
3. `1.49601` vs `1.49530`
4. `0.19871` vs `0.19898`
5. `149.22E-3` vs `148.73E-3`
6. `19.944E-3` vs `19.968E-3`
7. `14.951E-3` vs `14.906E-3`
8. `1.9971E-3` vs `2.0074E-3`
9. `1.4937E-3` vs `1.5048E-3`
10. `198.05E-6` vs `200.89E-6`
11. `10.31E-6` vs `10.32E-6`
12. `2.35E-6` vs `2.35E-6` (same)
13. `78.98E-6` vs `79.12E-6`
14. `37.15E-6` vs `37.21E-6`

## Interpretation
- This is a true profile variation, not formatting noise.
- At least one app path likely selected between profile files by revision/fixture history/workstation context.
- Any modern clone should support profile selection and metadata tracking, not hardcode a single CAL set.

## Confidence and limitations
- High confidence on numeric difference evidence.
- Medium confidence on exact historical selection logic without full original app state-machine reconstruction.

## App-integration value
- Add explicit calibration-profile abstraction (`inductance_profile_id`).
- Include profile provenance in backup/restore exports.
- Require operator confirmation before writing a profile to UUT.
