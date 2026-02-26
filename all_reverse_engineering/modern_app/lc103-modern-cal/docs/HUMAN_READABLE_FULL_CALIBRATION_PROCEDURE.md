# LC103 Full Calibration Procedure (Complete Operator Version)

This is the full detailed recovery-based procedure with explicit setup, per-stage actions, reference values, and pass/fail gates.

LC103 CALIBRATION WIZARD RUNDOWN

1. All (Not Ringer) / Start Button
Legacy UI flow: select stage set (typically All (Not Ringer)), then press Start Button. Use Continue Button to advance each prompt. Gate text recovered from old flow: 'Press ENTER when ready, choose test to perform and press START.'
Recovered UUT comm semantics: mode 0=write/read, mode 1=write-only, mode 2=read-only.

2. Harness/Test Box Setup
Prepare legacy final-cal bench harness before calibration:
1) Connect PA251 power adapter to rear of LC103.
2) Connect RS-232 cable from host PC to LC103 RS-232 port.
3) Connect 39G219 test-lead cable from LC103 front panel to final test box.
4) Connect IEEE cable to RS232 interface port on back-left side of UUT.
5) Power on UUT and verify software revision display.
Legacy fixture variant also appears in source:
- Mainboard tester (#74C216-1) with Fluke 8840A and 50 pin ribbon cable.

3. Pass/Fail Indicator Visibility
Set Pass/ Fail Indicator and make it visible before running tests. Recovered flow also toggles Pass/Fail button invisible in some transitions; ensure visible for operator run.

4. Calibration Data File Selection
Use F1/path controls first if prompted, then select calibration data files:
- Capacitance: P071_03.CAL
- Inductance: P072_1.CAL or approved matching variant.
If file/path prompts loop, re-open path selector with F1 and re-select both .CAL files before continuing.

5. Software Rev. Check
Confirm software revision matches unit display. If software rev file cannot be read, set revision manually on front panel and continue. If revision is invalid or file/path lookup fails, use F1 to fix paths, re-select .CAL files, and retry probe. Recovered warning path: place floppy disk in computer and fix invalid rev after calibration fails.
Commands: VER#?, SER#?

6. Calibration Reset
Warning: Choosing Calibration Reset removes all calibration from the UUT. Take backup first, then continue only if intended.
Commands: CALCHK, CALDATE?

7. Lead Open Test (Caps)
Run lead-open integrity check before calibration ranges:
- Use Lead Open Test/Caps branch.
- Ensure lead state matches prompt (open when requested).
- Continue only after pass/ready indication.

8. Lead Zero Short Test (Inductance/ESR)
Run lead-short integrity and zero check:
- Make sure UUT leads are shorted together.
- Execute Lead Zero Short Test/Inductance and Lead Zero Short Test/ESR checks.
- Continue only after pass/ready indication.

9. 10V Ref Calibration
Connection:
- DVM + to TP1006, DVM - to TP1020.
Target:
- Adjust R1045 until measured reference is 10.000V +/-0.005V.
Pass/Fail:
- PASS inside 9.995V..10.005V; FAIL outside that window.
Commands: CALON, CALCHK, CALOFF, CLRPAR

10. Current Source Calibration
Connection:
- UUT leads to LC103 Final Test Box. DVM on test-box DVM jacks if instructed by fixture.
- Load Select map recovered from legacy source:
0=1.1 MOhm to UUT leads (same as 9 high-side path),
1=100 kOhm, 2=10 kOhm, 3=1 kOhm, 4=100 Ohm, 5=10 Ohm, 6=2 kOhm,
7=0% D/A, 8=10% D/A, 9=100 kOhm (high-voltage side).
- Named load usage recovered: 100k(low voltage), 10k(low voltage), 1k(low voltage/gain), 2k(gain), 100k(V/I leakage).
- Firmware ISRC labels recovered: 1uA, 10uA, 33uA, 100uA, 1mA, 10mA, 100mA, OFF.
- ISRC_CAL payload contains an explicit range-id vector with 5 entries: [1, 3, 4, 5, 6].
Comparison quantity:
- Current-source Cal Factor (dimensionless ratio) where x1.0000 means no correction (on target).
- This is not a direct volts/amps setpoint; it is a correction multiplier.
- Under-the-hood meter path is voltage readback (volts) converted internally to the ratio.
- Flow cue: Lowest Current Range is calibrated first.
- Embedded ISRC stage constants include target x1.0000 with limits x0.9985..x1.0015.
Pass/Fail:
- PASS when Cal Factor is inside 0.9985..1.0015.
- FAIL outside this window or on comms/calibration fault.
Commands: CALON, CALCHK, CALF?, CALOFF, CLRPAR

11. Gain Calibration
Connection:
- UUT leads to LC103 Final Test Box.
- Fixture load-select path uses 1k (low voltage/gain) and 2k (gain), from recovered Load Select map.
- GAIN_CAL payload explicitly carries CALF/GAIN path with load IDs 3 and 6.
Comparison quantity:
- Gain factor ratio target = x1.0000 (dimensionless correction multiplier).
- Physical readback path is voltage (V) across known fixture resistance, normalized internally.
- Embedded GAIN_CAL constants include ratio limits 0.9/1.1 and an internal scale token 1000.0.
Pass/Fail:
- PASS when ratio is inside 0.9..1.1.
- FAIL if adjustment exceeds 10% or gain calibration failed marker is returned.
Commands: CALON, CALCHK, CALOFF, CLRPAR

12. Capacitance Fixture Setup
Make sure the red UUT lead is not connected. Short UUT leads to the Capacitance Decade Box (L Terminal). Connect black UUT lead to the Capacitance Decade Box (Low Terminal), then move red lead to the Capacitance Decade Box (High Terminal).

13. Capacitance Range 0 Low Point
Set capacitance decade box to low point for range 0: 200pf (73p71) (actual 2.011e-10 F), then Continue.
Commands: CALON, CALSET, CALCHK, CALOFF, CLRPAR

14. Capacitance Range 0 High Point
Set capacitance decade box to high point for range 0: 1700pf (73p71) (actual 1.7011e-09 F), then Continue.
Commands: CALON, CALSET, CALCHK, CALOFF, CLRPAR

15. Capacitance Range 1 Low Point
Set capacitance decade box to low point for range 1: 0.004uf (73p71) (actual 4e-09 F), then Continue.
Commands: CALON, CALSET, CALCHK, CALOFF, CLRPAR

16. Capacitance Range 1 High Point
Set capacitance decade box to high point for range 1: 0.018uf (73p71) (actual 1.8e-08 F), then Continue.
Commands: CALON, CALSET, CALCHK, CALOFF, CLRPAR

17. Capacitance Range 2 Low Point
Set capacitance decade box to low point for range 2: 0.04uf (73p71) (actual 4e-08 F), then Continue.
Commands: CALON, CALSET, CALCHK, CALOFF, CLRPAR

18. Capacitance Range 2 High Point
Set capacitance decade box to high point for range 2: 0.18uf (73p71) (actual 1.8e-07 F), then Continue.
Commands: CALON, CALSET, CALCHK, CALOFF, CLRPAR

19. Capacitance Range 3 Low Point
Set capacitance decade box to low point for range 3: 0.4uf (73p71) (actual 4e-07 F), then Continue.
Commands: CALON, CALSET, CALCHK, CALOFF, CLRPAR

20. Capacitance Range 3 High Point
Set capacitance decade box to high point for range 3: 1.80uf (74b211) (actual 1.764e-06 F), then Continue.
Commands: CALON, CALSET, CALCHK, CALOFF, CLRPAR

21. Capacitance Range 4 Low Point
Set capacitance decade box to low point for range 4: 4.0uf (74b211) (actual 3.848e-06 F), then Continue.
Commands: CALON, CALSET, CALCHK, CALOFF, CLRPAR

22. Capacitance Range 4 High Point
Set capacitance decade box to high point for range 4: 18.0uf (74b211) (actual 1.961e-05 F), then Continue.
Commands: CALON, CALSET, CALCHK, CALOFF, CLRPAR

23. Capacitance Range 5 Low Point
Set capacitance decade box to low point for range 5: 40.0uf (74b211) (actual 3.837e-05 F), then Continue.
Commands: CALON, CALSET, CALCHK, CALOFF, CLRPAR

24. Capacitance Range 5 High Point
Set capacitance decade box to high point for range 5: 180uf (74b211) (actual 0.00017204 F), then Continue.
Commands: CALON, CALSET, CALCHK, CALOFF, CLRPAR

25. Capacitance Range 6 Low Point
Set capacitance decade box to low point for range 6: 400uf (74b211) (actual 0.000383 F), then Continue.
Commands: CALON, CALSET, CALCHK, CALOFF, CLRPAR

26. Capacitance Range 6 High Point
Set capacitance decade box to high point for range 6: 1800uf (74b211) (actual 0.00171525 F), then Continue.
Commands: CALON, CALSET, CALCHK, CALOFF, CLRPAR

27. ESR Calibration
Connection:
- Red UUT lead to capacitance decade box H terminal.
- Set decade box to 0.022uF (actual 0.0219uF).
Comparison quantity:
- ESR/RC internal constants seen in legacy stage: 2.00E-8, 2.20E-8, 2.40E-8.
- Comparator unit mapping is partially decoded; use stage pass/fail markers as the hard gate.
Pass/Fail:
- FAIL if ESR calibration failed marker appears or cal'ed ESR value exceeds 1 ohm.
Commands: CALON, CALCHK, CALOFF, CLRPAR

28. Inductance Fixture Setup
Short the UUT leads to the Inductance Decade Box (L Terminal). Now connect the red lead to the Inductance Decade Box (H Terminal). Recovered variants also mention a Low Value Inductance Box on some flows.

29. Inductance Range 0 Low Point
Set inductance decade box to low point for range 0: 2.00uh (74a144) (actual 2.36e-06 H), then Continue.
Commands: CALON, CALSET, CALCHK, CALOFF, CLRPAR

30. Inductance Range 0 High Point
Set inductance decade box to high point for range 0: 10.0uh (74a144) (actual 1.032e-05 H), then Continue.
Commands: CALON, CALSET, CALCHK, CALOFF, CLRPAR

31. Inductance Range 1 Low Point
Set inductance decade box to low point for range 1: 40.0uh (74a144) (actual 3.714e-05 H), then Continue.
Commands: CALON, CALSET, CALCHK, CALOFF, CLRPAR

32. Inductance Range 1 High Point
Set inductance decade box to high point for range 1: 80.0uh (74a144) (actual 7.9e-05 H), then Continue.
Commands: CALON, CALSET, CALCHK, CALOFF, CLRPAR

33. Inductance Range 2 Low Point
Set inductance decade box to low point for range 2: 200uh (73p72) (actual 0.00019808 H), then Continue.
Commands: CALON, CALSET, CALCHK, CALOFF, CLRPAR

34. Inductance Range 2 High Point
Set inductance decade box to high point for range 2: 1.50mh (73p72) (actual 0.001495 H), then Continue.
Commands: CALON, CALSET, CALCHK, CALOFF, CLRPAR

35. Inductance Range 3 Low Point
Set inductance decade box to low point for range 3: 2.00mh (73p72) (actual 0.0019971 H), then Continue.
Commands: CALON, CALSET, CALCHK, CALOFF, CLRPAR

36. Inductance Range 3 High Point
Set inductance decade box to high point for range 3: 15.0mh (73p72) (actual 0.014951 H), then Continue.
Commands: CALON, CALSET, CALCHK, CALOFF, CLRPAR

37. Inductance Range 4 Low Point
Set inductance decade box to low point for range 4: 20.0mh (73p72) (actual 0.019952 H), then Continue.
Commands: CALON, CALSET, CALCHK, CALOFF, CLRPAR

38. Inductance Range 4 High Point
Set inductance decade box to high point for range 4: 150mh (73p72) (actual 0.14942 H), then Continue.
Commands: CALON, CALSET, CALCHK, CALOFF, CLRPAR

39. Inductance Range 5 Low Point
Set inductance decade box to low point for range 5: 200mh (73p72) (actual 0.19894 H), then Continue.
Commands: CALON, CALSET, CALCHK, CALOFF, CLRPAR

40. Inductance Range 5 High Point
Set inductance decade box to high point for range 5: 1.50h (73p72) (actual 1.4968 H), then Continue.
Commands: CALON, CALSET, CALCHK, CALOFF, CLRPAR

41. Inductance Range 6 Low Point
Set inductance decade box to low point for range 6: 2.00h (73p72) (actual 1.9948 H), then Continue.
Commands: CALON, CALSET, CALCHK, CALOFF, CLRPAR

42. Inductance Range 6 High Point
Set inductance decade box to high point for range 6: 8.00h (73p72) (actual 8.1361 H), then Continue.
Commands: CALON, CALSET, CALCHK, CALOFF, CLRPAR

43. Leakage Voltage Calibration
Connection:
- UUT leads to LC103 Final Test Box. DVM attached to fixture voltage monitor path.
Fixture points recovered in-stage:
- Legacy prompt text explicitly references 500 V and 1000 V points.
- Leak_CAL DFDS payload also encodes 1V, 32V, 33V, and 1000V set/value pairs.
Comparison quantity:
- Leakage-voltage gain/offset routine using fixture steps and DVM path.
- Recovered constants seen in stage logic: 0.75, 1.1, 0.99, 10.0, 16.0, 32.0, 33.0, 200.0, 1000.0, -0.0250.
- Comparator domain is ratio/correction in this block (not raw volts); use markers as authoritative gate.
Pass/Fail:
- FAIL on 'offset adjustment too high' or 'gain adjustment >10%' markers.
- PASS when stage returns pass markers without fail markers.
Commands: CALON, CALCHK, CALOFF, CLRPAR

44. D/A Test
Connection:
- UUT leads to LC103 Final Test Box, then Switch in D/A Standard path.
Fixture points:
- D/A reference points: 0% D/A and 10% D/A (LS7 and LS8).
- DA_TEST DFDS includes reference values 0.0 and 10.0 plus compare constants -1.5 and +1.5.
Comparison quantity:
- D/A response at 0% and 10% standard points.
- Recovered constants include +/-1.5 and 0.01 scaling in the compare block.
Pass/Fail:
- FAIL on 'measurement beyond specs' marker.
Commands: CALON, CALCHK, CALOFF, CLRPAR

45. Leakage Voltage Test
Connection:
- UUT leads to LC103 Final Test Box with DVM correction path active.
Set values (fixture points):
- LEAK_VLT DFDS point list: 1 V, 16 V, 32 V, 33 V, 500 V, 1000 V.
Comparison quantity:
- Leakage-voltage response through DVM correction path across the encoded point list.
Pass/Fail:
- Recovered constants include 1.0, 0.95, and 0.99 in this stage.
- Additional scalars present in LEAK_VLT DFDS block: 10.0 and 200.0.
- Comparator unit mapping is partially decoded; use pass/fail markers as hard gate.
Commands: CALON, CALCHK, CALOFF, CLRPAR

46. Leakage Current Test
Connection:
- UUT leads to LC103 Final Test Box, using fixture Load Select and Sense Resistor routing.
Recovered leakage substeps:
- Substep 0: sense resistor 1.111E6 Ohm, approx 9uA, cal box setup #9, 8842 multiplier 10.0.
- Substep 1: sense resistor 100.0E3 Ohm, approx 100uA, cal box setup #1, 8842 multiplier 1.0.
- Substep 2: sense resistor 10.0E3 Ohm, approx 1mA, cal box setup #2, 8842 multiplier 1.0.
- Substep 3: sense resistor 1.00E3 Ohm, approx 10mA, cal box setup #3, 8842 multiplier 1.0.
Comparison quantity:
- Leakage current response across setup matrix columns recovered in LEAK_I: Sense Resistor, Approx Current, Cal Box Setup #, 8842 multiplier.
- Recovered references include DVM input resistance about 1.111E6 ohms (1.111 MOhm / 1,111,000 ohms).
- LEAK_I payload also includes explicit '10V' reference text; inferred nominal point is about 10V across each selected sense resistor.
Pass/Fail:
- Recovered ratio limits include x0.937..x1.06 (unitless correction ratio), with 0.005 tolerance scalar present in-stage.
- PASS with pass marker and no fail marker; FAIL otherwise.
Commands: CALON, CALCHK, CALOFF, CLRPAR

47. Calibration Stamp
Set Calibration Date / Stamp and verify response. Set Serial Number when requested. Use Enter/finished prompts to close the stage.
Commands: CALON, CALDATE?, CALCHK, CALOFF, CLRPAR

48. Finish
Power-cycle, disconnect fixtures in reverse order, and save report/transcript. Recovered post-flow hint: remove UUT from tester and proceed to next UUT.
Commands: VER#?, SER#?, CALDATE?
