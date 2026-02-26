# LC103 CALF/CALSET Payload Schema + Leakage Substep Table (2026-02-26)

## Provenance
- CALF index matrix decoded from `deep_extract_2026-02-25/EEPROM_DFDS.bin`.
- Label evidence: `Row 0: Default Calibration Factors`, `Row 1: Index of Cal Factor in UUT`, `Start Cal Factor(0)`, `End Cal Factor(59)`.
- CALF format clues: `SND_CF&V` contains `CALF_xx_x.xxxxExx`; `GET_CF` contains `CALF? xx`.
- Leakage table decoded from `deep_extract_2026-02-25/LEAK_I_DFDS.bin` + `LEAK_I_TRec11.bin` column labels.

## Command Payload Schema
- `CALF` write: `CALF <uut_cf_index> <cal_factor>` where `<cal_factor>` is scientific notation (template evidence `CALF_xx_x.xxxxExx`).
- `CALF?` read: `CALF? <uut_cf_index>` (template evidence `CALF? xx`).
- `CALSET`: only token `CALSET` is present in `CALSET_DFDS.bin`; no explicit index/value format string was recovered there.

## Full 0..59 Index Table
| host_idx | default_factor | uut_cf_index |
|---:|---:|---:|
| 0 | 1 | 0 |
| 1 | 1 | 1 |
| 2 | 1 | 2 |
| 3 | 1 | 3 |
| 4 | 1 | 4 |
| 5 | 1 | 5 |
| 6 | 1 | 6 |
| 7 | 1 | 7 |
| 8 | 1 | 8 |
| 9 | 1 | 9 |
| 10 | 1 | 10 |
| 11 | 1 | 11 |
| 12 | 1 | 12 |
| 13 | 1 | 13 |
| 14 | 1 | 14 |
| 15 | 1 | 15 |
| 16 | 1 | 16 |
| 17 | 1 | 17 |
| 18 | 0 | 18 |
| 19 | 0 | 19 |
| 20 | 0 | 20 |
| 21 | 0 | 21 |
| 22 | 0 | 22 |
| 23 | 0 | 23 |
| 24 | 0 | 24 |
| 25 | 0 | 25 |
| 26 | 1 | 26 |
| 27 | 1 | 27 |
| 28 | 1 | 28 |
| 29 | 1 | 29 |
| 30 | 1 | 30 |
| 31 | 1 | 31 |
| 32 | 1 | 32 |
| 33 | 0 | 33 |
| 34 | 0 | 34 |
| 35 | 0 | 35 |
| 36 | 0 | 36 |
| 37 | 0 | 37 |
| 38 | 0 | 38 |
| 39 | 0 | 39 |
| 40 | 0 | 50 |
| 41 | 1 | 64 |
| 42 | 1 | 65 |
| 43 | 1 | 66 |
| 44 | 1 | 67 |
| 45 | 1 | 68 |
| 46 | 1 | 69 |
| 47 | 1 | 70 |
| 48 | 0 | 71 |
| 49 | 0 | 72 |
| 50 | 0 | 73 |
| 51 | 0 | 74 |
| 52 | 0 | 75 |
| 53 | 0 | 76 |
| 54 | 0 | 77 |
| 55 | 1 | 128 |
| 56 | 1 | 129 |
| 57 | 0 | 130 |
| 58 | 0 | 131 |
| 59 | 0 | 132 |

## Leakage Sense-Resistor Table (All Substeps Recovered)
| substep | sense resistor | approx current | cal box setup # | 8842 mult |
|---:|---|---|---:|---:|
| 0 | 1.111E6 | 9uA | 9 | 10.0 |
| 1 | 100.0E3 | 100uA | 1 | 1.0 |
| 2 | 10.0E3 | 1mA | 2 | 1.0 |
| 3 | 1.00E3 | 10mA | 3 | 1.0 |

## Notes
- The 0..59 host index does not map 1:1 to UUT index for the upper segment.
- Host indices 40..59 map to UUT indices `50,64..77,128..132`.
