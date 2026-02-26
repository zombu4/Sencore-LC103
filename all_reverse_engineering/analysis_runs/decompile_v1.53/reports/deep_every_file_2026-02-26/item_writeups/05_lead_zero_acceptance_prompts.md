# Item 5: Lead-Zero Open/Short Acceptance Prompts

## What was found
The lead-zero workflow contains explicit expected-result criteria for open-lead and shorted-lead checks.

## Primary evidence
- Extracted VI: `/Users/<user>/LC103/decompile_v1.53/reports/deep_every_file_2026-02-26/lv3_extract/lead zero short-open.vi`

## Recovered acceptance text
- `Leads zero, open Cap must read 0, IND must read "OPEN" and ESR must read "ERROR 7"`
- `Lead zero, shorted CAP must read "SHORT", IND and ESR must read 0`

## Offset evidence
- Open criteria string: `119291`
- Short criteria string: `119647`
- Additional `ERROR 7` occurrences: `121972`, `127680`

## Operational interpretation
Open-lead validation expected UI outcomes:
- CAP display: `0`
- IND display: `OPEN`
- ESR display: `ERROR 7`

Short-lead validation expected UI outcomes:
- CAP display: `SHORT`
- IND display: `0`
- ESR display: `0`

## Confidence and limitations
- High confidence: acceptance strings are explicit and human-readable.
- Low ambiguity in interpretation because criteria are embedded as direct instructional text.

## App-integration value
- Use these exact values as strict pass/fail acceptance checks in lead-zero wizard steps.
- Include “expected display text” UI callouts to prevent operator interpretation mistakes.
