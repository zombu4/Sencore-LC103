# LC103 Final Cal Prompt Rebuild (From Full Old-App Decompile)

## Scope
- Source set: `Final Cal/103FIN.EXE`, `Source/LV3_1/103f_cal.llb`, `Source/LV6/103f_cal.llb`, `Source/lv8/103f_cal.llb`, plus recovered context index.
- Goal: rebuild the calibration run sequence and operator prompts with concrete wording and values, avoiding unresolved `...` placeholders.

## Startup / Operator Setup Prompts
1. Launch `LC103 F_Cal`.
2. Load calibration data files:
- `Please choose the file containing the capacitance calibration data.`
- `Please choose the file containing the inductance calibration data.`
3. Select:
- `All  (Not Ringer)`
- `Start Button` (factory procedure wording: `PRESS TO START`)

## Stage Order (Recovered Flow)
Catalog order present in binaries:
1. `Software Rev. Check`
2. `Calibration Reset` (optional path present in flow)
3. `Current Source Calibration`
4. `Gain Calibration`
5. `Capacitance Calibration`
6. `ESR Calibration`
7. `Inductance Calibration`
8. `Ringer Calibration`
9. `Leakage Voltage Calibration`
10. `D/A Test`
11. `Leakage Voltage Test`
12. `Leakage Current Test`
13. `Set Cal Date`
14. `Calibration Stamp`
15. `Calibration Successful!!`

Factory procedure run (`ALL (NOT RINGER)`) indicates non-ringer auto flow first, then manual ringer adjustment after auto test completion.

## Connection Prompts Rebuilt (No Ellipses)

### Common fixture prompt used by multiple stages
- `Connect the UUT and/or DVM leads to the LC103 Final Test Box.`
- `Press 'Enter' when ready.`

Used explicitly by:
- `Current Source Calibration`
- `Gain Calibration`
- `Leakage Voltage Calibration`
- `D/A Test`
- `Leakage Voltage Test`
- `Leakage Current Test`

### Capacitance / ESR wiring prompts
- `Make sure the red UUT lead is not connected.`
- `Make sure the UUT leads are shorted together.`
- `Short the UUT leads to the Capacitance Decade box (L Terminal).`
- `Now connect the red lead to the Capacitance Decade Box (High Terminal).`
- `Connect the black UUT lead to the Capacitance Decade Box (Low Terminal).`
- ESR-specific enforced prompt:
  - `Now connect the red UUT to the H Terminal of the decade box and set the box to 0.022uF(.0219).`
  - enforcement variant in app:
    - `HEY!! I said: "Connect the red UUT to the H Terminal of the decade box and set the box to 0.022uF(.0219)". Please do this now!`

### Inductance wiring prompts
- `Short the UUT leads to the Inductance Decade Box (L Terminal).`
- `Now connect the red lead to the Inductance Decade Box (H Terminal).`
- Additional branch prompt token also present:
  - `Short the UUT leads to the Low Value Inductance Box.`

### Ringer prompts
- `Connect the UUT leads to the Small Ringer Cal Box set to Yolks and Flybacks.`
- `Adjust R1144 for the number of rings specified on the cal box.`
- `Switch the cal box to Switching Transformers.`
- `Now adjust R1005 for the number of rings specified on the cal box.`

## Stage-by-Stage Prompt Script (Recovered)

### 1) Software Rev Check
- `Software Rev. Check`
- `Last known LC103 Software Rev. is: VER`
- `Couldn't retrieve the proper Software Rev. number. Please set this manually on the front panel.`
- `Couldn't open the Software Rev. file. Please set the Software Rev. manually on the front panel. Place the flopply disk in the computer NOW.`
- `Wrong Rev. Number`
- `An invalid Software Rev. number was specified. Please fix this after cal fails.`

### 2) Calibration Reset (optional path)
- `Warning: Choosing 'Calibration Reset' removes all calibration from the UUT.`
- `Press 'Enter' when ready.`
- `Reset Aborted.`

### 3) Current Source Calibration
- `Current Source Calibration`
- `Connect the UUT and/or DVM leads to the LC103 Final Test Box.`
- `Press 'Enter' when ready.`
- Pass/fail strings:
  - `Current Source Calibration Passed`
  - `Failed Calibration.`

### 4) Gain Calibration
- `Gain Calibration`
- `Connect the UUT and/or DVM leads to the LC103 Final Test Box.`
- `Press 'Enter' when ready.`
- Dependency/status strings:
  - `Current MUST be Calibrated First`
- Pass/fail strings:
  - `Gain Calibration Failed`
  - `Failed Calibration. Adjusted >10%`
  - `Failed Calibration. Gain Adjustment >10%`
  - `on Range !Gain Calibration Failed`

### 5) Capacitance Calibration
- `Capacitance Calibration`
- `Apply 200pF(.0001) to the UUT leads.`
- `Apply 1700pF(.0016) to the UUT leads.`
- `Apply 0.004uF(.0039) to the UUT leads.`
- `Apply 0.018uF(.0179) to the UUT leads.`
- `Apply 0.04uF(.0399) to the UUT leads.`
- `Apply 0.18uF(.1799) to the UUT leads.`
- `Apply 0.4uF(.3999) to the UUT leads.`
- `Apply 1.80uF to the UUT leads.`
- `Apply 4.0uF to the UUT leads.`
- `Apply 18.0uF to the UUT leads.`
- `Apply 40.0uF to the UUT leads.`
- `Apply 180uF to the UUT leads.`
- `Apply 400uF to the UUT leads.`
- `Apply 1800uF to the UUT leads.`
- `Lowest Cap Range is Cal'd First.`
- Lead-check strings in calibration flow:
  - `Something seems to be wrong with the leads. Check the leads and press 'Enter' when ready.`
  - `Please check the setting again.`
  - `Measured:`
  - `Expected:`

### 6) ESR Calibration
- `ESR Calibration`
- `Short the UUT leads to the Capacitance Decade box (L Terminal).`
- `Press 'Enter' when ready.`
- `Now connect the red UUT to the H Terminal of the decade box and set the box to 0.022uF(.0219).`
- `Press 'Enter' when ready.`
- Retry/enforcement:
  - `HEY!! I said: "Connect the red UUT to the H Terminal of the decade box and set the box to 0.022uF(.0219)". Please do this now!`
- Result strings:
  - `ESR Calibration Passed`
  - `Cal'ed value >1ohm:`
  - `Communications Error`

### 7) Inductance Calibration
- `Inductance Calibration`
- `Set the Inductance Box to 8.00H.`
- `Set the Inductance Box to 2.00H.`
- `Set the Inductance Box to 1.50H.`
- `Set the Inductance Box to 200mH.`
- `Set the Inductance Box to 150mH.`
- `Set the Inductance Box to 20.0mH.`
- `Set the Inductance Box to 15.0mH.`
- `Set the Inductance Box to 2.00mH.`
- `Set the Inductance Box to 1.50mH.`
- `Set the Inductance Box to 200uH.`
- `Set the Inductance Box to 80.0uH.`
- `Set the Inductance Box to 40.0uH.`
- `Set the Inductance Box to 10.0uH.`
- `Set the Inductance Box to 2.00uH.`
- `Highest Inductance Range Calibrated First.`
- Wiring strings present in flow set:
  - `Short the UUT leads to the Inductance Decade Box (L Terminal).`
  - `Now connect the red lead to the Inductance Decade Box (H Terminal).`
  - `Short the UUT leads to the Low Value Inductance Box.`
- Result string:
  - `Ind Cal Failed Range`

### 8) Ringer Calibration (separate/manual-critical)
- `Ringer Calibration`
- `Connect the UUT leads to the Small Ringer Cal Box set to Yolks and Flybacks.`
- `Adjust R1144 for the number of rings specified on the cal box.`
- `Switch the cal box to Switching Transformers.`
- `Now adjust R1005 for the number of rings specified on the cal box.`

### 9) Leakage Voltage Calibration
- `Leakage Voltage Calibration`
- `Connect the UUT and/or DVM leads to the LC103 Final Test Box.`
- `Press 'Enter' when ready.`

### 10) D/A Test
- `D/A Test`
- `Connect the UUT and/or DVM leads to the LC103 Final Test Box.`
- `Press 'Enter' when ready.`

### 11) Leakage Voltage Test
- `Leakage Voltage Test`
- `Connect the UUT and/or DVM leads to the LC103 Final Test Box.`
- `Press 'Enter' when ready.`

### 12) Leakage Current Test
- `Leakage Current Test`
- `Connect the UUT and/or DVM leads to the LC103 Final Test Box.`
- `Press 'Enter' when ready.`

### 13) Set Date / Stamp / Complete
- `Set Cal Date`
- `Set Calibration Date`
- `Calibration Stamp`
- `Calibration Successful!!`

## Dynamic Prompt Templates and Concrete Value Sets

### Capacitance calibration prompt set
- `Apply 200pF(.0001) to the UUT leads.`
- `Apply 1700pF(.0016) to the UUT leads.`
- `Apply 0.004uF(.0039) to the UUT leads.`
- `Apply 0.018uF(.0179) to the UUT leads.`
- `Apply 0.04uF(.0399) to the UUT leads.`
- `Apply 0.18uF(.1799) to the UUT leads.`
- `Apply 0.4uF(.3999) to the UUT leads.`
- `Apply 1.80uF to the UUT leads.`
- `Apply 4.0uF to the UUT leads.`
- `Apply 18.0uF to the UUT leads.`
- `Apply 40.0uF to the UUT leads.`
- `Apply 180uF to the UUT leads.`
- `Apply 400uF to the UUT leads.`
- `Apply 1800uF to the UUT leads.`
- `Lowest Cap Range is Cal'd First.`

Recovered capacitance nominal sequence values:
1. `200pF(.0001)`
2. `1700pF(.0016)`
3. `0.004uF(.0039)`
4. `0.018uF(.0179)`
5. `0.04uF(.0399)`
6. `0.18uF(.1799)`
7. `0.4uF(.3999)`
8. `1.80uF`
9. `4.0uF`
10. `18.0uF`
11. `40.0uF`
12. `180uF`
13. `400uF`
14. `1800uF`

### Inductance calibration prompt set
- `Set the Inductance Box to 8.00H.`
- `Set the Inductance Box to 2.00H.`
- `Set the Inductance Box to 1.50H.`
- `Set the Inductance Box to 200mH.`
- `Set the Inductance Box to 150mH.`
- `Set the Inductance Box to 20.0mH.`
- `Set the Inductance Box to 15.0mH.`
- `Set the Inductance Box to 2.00mH.`
- `Set the Inductance Box to 1.50mH.`
- `Set the Inductance Box to 200uH.`
- `Set the Inductance Box to 80.0uH.`
- `Set the Inductance Box to 40.0uH.`
- `Set the Inductance Box to 10.0uH.`
- `Set the Inductance Box to 2.00uH.`
- `Highest Inductance Range Calibrated First.`

Recovered inductance nominal value set:
1. `8.00H`
2. `2.00H`
3. `1.50H`
4. `200mH`
5. `150mH`
6. `20.0mH`
7. `15.0mH`
8. `2.00mH`
9. `1.50mH`
10. `200uH`
11. `80.0uH`
12. `40.0uH`
13. `10.0uH`
14. `2.00uH`

## Validation / Control Prompts in Flow
- `Press 'Enter' when ready.`
- `Press 'Enter' when finished.`
- `Something seems to be wrong. Make sure the UUT leads are shorted together.`
- `Failed Calibration.`
- `Failed Calibration. Adjusted >10%.`
- `Failed Calibration. Gain Adjustment >10%.`
- `Failed Calibration. Offset Adjustment too high.`

## Safety-Critical Notes From Recovered Flow
- Ringer setpoints are fixture-defined (`number of rings specified on the cal box`), not hard-coded numeric constants in the app.
- ESR `0.022uF(.0219)` is a specific prompt in ESR block and should not be generalized to all cap stages.
- Main C/L calibration steps are driven by standard-value sequences loaded from cap/ind standard data files.

## Primary Evidence Anchors
- `workflow_evidence_context.txt` (stage flow + prompt concatenation evidence)
- `Final_Cal_103FIN.EXE.strings.txt` (operator prompts and standard value tokens)
- `Source_LV6_103f_cal.llb.strings.txt` and `Source_LV3_1_103f_cal.llb.strings.txt` (cross-version prompt consistency)
- `LC103 CALIBRATION PROCEDURE.txt` (factory UI operation steps: `ALL (NOT RINGERS)`, `PRESS TO START`)
