# LC103 Deep Every-File Findings (2026-02-26)

## Scope
- Scanned all `43` files under `/Users/<user>/Downloads/LC103` (including hidden `.DS_Store` files).
- Extracted/inspected text, strings+offsets, ZIP manifests, OCR from image-only PDF, and LabVIEW library internals.

## Net-new high-value findings

### 1) RS232 command table recovered from pull-chart PDF (OCR)
Source:
- `/Users/<user>/Downloads/LC103/LC103 simplified operating instructions (pull chart).pdf`
- OCR artifacts:
  - `/Users/<user>/LC103/decompile_v1.53/reports/deep_every_file_2026-02-26/pdf_ocr/page08_4x_psm11.txt`
  - `/Users/<user>/LC103/decompile_v1.53/reports/deep_every_file_2026-02-26/pdf_ocr/page08_sharp_psm11.txt`

Recovered command families:
- Component-type commands (high confidence): `ALM`, `DBL`, `TAN`, `CER`, `AOC`, `HIR`, `COL`, `YFB`, `SWX`.
- Test-function commands (high confidence): `CAP`, `LKI`, `LKR`, `DIA`, `ESR`, `IND`, `RIN`, `CIC`, `EIC`.
- In-circuit inductance token appears as `IC/IIC` depending on OCR pass (medium confidence; likely `IIC`).
- General commands (high confidence): `LDO` (lead zero open), `LDS` (lead zero short), `NFC` (no function), `CPO` (control panel on), `Ctrl R` (continuous send), `Ctrl O` (single reading/default).

Note:
- `VALUE MULTIPLIERS` section is present but the tiny scan text is partially unreadable; command mnemonics there remain partially unresolved by OCR.

### 2) Mainboard tester setup wizard text recovered with exact fixture references
Source:
- `/Users/<user>/LC103/decompile_v1.53/reports/deep_every_file_2026-02-26/lv3_extract/MAINB_II.vi` (strings+offsets)

Recovered operator setup sequence:
- `1) Plug in and turn on LC103 Mainboard test box.`
- `2) Attach power adapter and RS-232 cable to LC103`
- `Mainboard tester (#74C216-1).`
- `3) Connect Fluke 8840A to DVM plugs on front panel of test box.`
- `4) Connect Lo Capacity leads to UUT plugs on front of test box.`
- `5) Connect 50 pin ribbon cable from PC to right side of test box.`
- `6) Press ENTER when ready, choose test to perform and press START.`

Evidence offsets (decimal):
- `MAINB_II.vi`: `102771`, `102820`, `102870`, `102904`, `102968`, `103032`, `103098`.

### 3) Power-board workflow has explicit safety/discharge prompts and LS setpoint checks
Source:
- `/Users/<user>/LC103/decompile_v1.53/reports/deep_every_file_2026-02-26/lv3_extract/PWRtest.vi` (strings+offsets)

Recovered workflow text:
- Initial prompts:
  - `INITIAL STEP: Attach DVM and computer cable to tester`
  - `--TURN SAFETY OFF--`
  - `--TURN TESTER POWER ON--`
  - `STEP 1: Place UUT onto tester`
  - `Press READY when previous step is complete.`
- Final prompts:
  - `FINAL STEP:`
  - `--Turn SAFETY OFF--`
  - `--Discharge caps--`
  - `Short TP4 with the cathode side of D2 with a jumper wire`
  - `--Remove UUT from tester, Proceed to next UUT`

Recovered LS/high-voltage test cues:
- `Set High LS to 500V` + `500V Check`
- `Set High LS to 875V`
- `Set High LS to 1000V` + `1000V Check`
- `Set Low LS to 0V`, `1V Check`, `4V Check`, `Set Low LS to 16V`, `16V Check`, `Set Low LS to 28V`, `28V Check`
- Calibration hints:
  - `Approx. 4.0 counts/volt` (high LS checks)
  - `Approx. 128 counts/volt` (low LS checks)

Evidence offsets (decimal examples):
- Initial/final safety block: `711396`..`712271`, duplicate block `718989`..`719265`
- High LS setpoints/checks: `693196`, `693928`, `694660`, `696124`, `696856`
- Low LS checks/setpoints: `679600`, `679864`, `680488`, `680752`, `682476`, `683020`, `683760`, `684480`
- Counts-per-volt hints: `679496`, `693092`, `694556`, `696020`.

### 4) Leakage-voltage subflow ties commands and setpoint/tolerance fields
Source:
- `/Users/<user>/LC103/decompile_v1.53/reports/deep_every_file_2026-02-26/lv3_extract/Leakage voltage test.vi`

Recovered sequence elements:
- `Set Voltage on UUT`
- `Do Test????`
- `Apply voltage to leads`
- command tokens present in same flow:
  - `LKI`
  - `CPO`
- nearby numeric labels include:
  - `10.5`
  - `0.30` (tolerance label block)
  - `0V`

Evidence offsets (decimal):
- `Set Voltage on UUT`: `78188`
- `10.5`: `78380`
- `LKI`: `78836`
- `Apply voltage to leads`: `78920`
- `CPO`: `79116`
- `Tolerance` + `0.30`: `74804`, `74896`.

### 5) Lead-zero expected result text recovered verbatim
Source:
- `/Users/<user>/LC103/decompile_v1.53/reports/deep_every_file_2026-02-26/lv3_extract/lead zero short-open.vi`

Recovered acceptance prompts:
- `Leads zero, open Cap must read 0, IND must read "OPEN" and ESR must read "ERROR 7"`
- `Lead zero, shorted CAP must read "SHORT", IND and ESR must read 0`

Evidence offsets (decimal):
- `119291`, `119647`.

### 6) Alternate inductance cal file is a real variant (not duplicate)
Source:
- `/Users/<user>/Downloads/LC103/P072_1.cal`
- `/Users/<user>/Downloads/LC103/Old Cal Files/P072_10.CAL`

Finding:
- `P072_10.CAL` differs numerically from `P072_1.cal` on multiple range points.
- This confirms at least two distinct inductance calibration datasets in the package and supports revision/profile-selection logic.

### 7) `LC103 fixes.xlsx` is a usable diagnostics corpus
Source:
- `/Users/<user>/Downloads/LC103/LC103 fixes.xlsx`
- parsed table:
  - `/Users/<user>/LC103/decompile_v1.53/reports/deep_every_file_2026-02-26/text/lc103_fixes_cells.tsv`

Finding:
- 300+ populated cells with field failures and board/component fixes.
- Includes calibration-adjacent signatures:
  - first-range current-source failures (`K1 relay intermittent`)
  - leakage `9uA` range failure note
  - D/A drift notes
  - ringers drift notes
  - repeated UUT/relay/analog-switch failure mappings.

## Files scanned summary
- Full typed/hash inventory:
  - `/Users/<user>/LC103/decompile_v1.53/reports/deep_every_file_2026-02-26/meta/file_inventory.tsv`
- Combined corpus + hit list:
  - `/Users/<user>/LC103/decompile_v1.53/reports/deep_every_file_2026-02-26/meta/all_corpus_lines.tsv`
  - `/Users/<user>/LC103/decompile_v1.53/reports/deep_every_file_2026-02-26/meta/high_value_hits.tsv`

## Remaining unresolved items (explicit)
- `VALUE MULTIPLIERS` command mnemonics from the pull-chart are still only partially legible due scan quality.
- LV7.1 DFDS payloads in several VIs (`Leakage voltage test.vi`, `Inductance testII.vi`, `Capacitance testII.vi`) are not fully decoded by current parser; arrays are evidenced by strings but not fully reconstructed as numeric vectors from this pass.
