# LC103 Key Evidence Snippets (Exact Line Windows)
- Source: `/Users/<user>/LC103/software_decompile_2026-02-24/strings/Final_Cal_103FIN.EXE.strings.txt`

## current_source_prompt (around L62987)
   L62984: Reset Aborted.
   L62985: Calibration Reset
   L62986: Current Source Calibration
>> L62987: Current Source CalibrationfConnect the UUT and/or DVM leads to
   L62988: the LC103 Final Test Box.
   L62989:             Press 'Enter' when ready.
   L62990: Gain Calibration
   L62991: Gain CalibrationfConnect the UUT and/or DVM leads to
   L62992: the LC103 Final Test Box.
   L62993:             Press 'Enter' when ready.

## gain_prompt (around L62991)
   L62988: the LC103 Final Test Box.
   L62989:             Press 'Enter' when ready.
   L62990: Gain Calibration
>> L62991: Gain CalibrationfConnect the UUT and/or DVM leads to
   L62992: the LC103 Final Test Box.
   L62993:             Press 'Enter' when ready.
   L62994: Capacitance Calibration
   L62995: Capacitance Calibration
   L62996: ESR Calibration
   L62997: ESR Calibration22

## leakage_v_cal_prompt (around L63003)
   L63000: Ringer Calibration
   L63001: Ringer Calibration
   L63002: Leakage Voltage Calibration
>> L63003: Leakage Voltage CalibrationfConnect the UUT and/or DVM leads to
   L63004: the LC103 Final Test Box.
   L63005:             Press 'Enter' when ready.
   L63006: D/A Test
   L63007: D/A TestfConnect the UUT and/or DVM leads to
   L63008: the LC103 Final Test Box.
   L63009:             Press 'Enter' when ready.

## da_test_prompt (around L63007)
   L63004: the LC103 Final Test Box.
   L63005:             Press 'Enter' when ready.
   L63006: D/A Test
>> L63007: D/A TestfConnect the UUT and/or DVM leads to
   L63008: the LC103 Final Test Box.
   L63009:             Press 'Enter' when ready.
   L63010: Leakage Voltage Test
   L63011: Leakage Voltage TestfConnect the UUT and/or DVM leads to
   L63012: the LC103 Final Test Box.
   L63013:             Press 'Enter' when ready.

## leakage_v_test_prompt (around L63011)
   L63008: the LC103 Final Test Box.
   L63009:             Press 'Enter' when ready.
   L63010: Leakage Voltage Test
>> L63011: Leakage Voltage TestfConnect the UUT and/or DVM leads to
   L63012: the LC103 Final Test Box.
   L63013:             Press 'Enter' when ready.
   L63014: Leakage Current Test
   L63015: Leakage Current TestfConnect the UUT and/or DVM leads to
   L63016: the LC103 Final Test Box.
   L63017:             Press 'Enter' when ready.

## leakage_i_test_prompt (around L63015)
   L63012: the LC103 Final Test Box.
   L63013:             Press 'Enter' when ready.
   L63014: Leakage Current Test
>> L63015: Leakage Current TestfConnect the UUT and/or DVM leads to
   L63016: the LC103 Final Test Box.
   L63017:             Press 'Enter' when ready.
   L63018: Set Calibration Date
   L63019: Set Calibration Date
   L63020: Calibration Stamp
   L63021: Calibration Stamp

## 10v_ref_prompt_start (around L66329)
   L66326: WAIT.VIOD
   L66327: FPHP
   L66328: 10V_Set.vi
>> L66329: Connect the '+' DVM lead to TP1006
   L66330: and the '-' lead to TP1020.  Adjust 
   L66331: R1045 for 10.000V +/- 0.005.
   L66332:           Press 'Enter' when finished.
   L66333: BDHP
   L66334: 10V_Set.vi
   L66335: LVIN

## ringer_adjust_r1144 (around L67443)
   L67440: Test Name
   L67441: Ringer.vi2
   L67442: NFCO
>> L67443: >>>Adjust R1144 for the number
   L67444: of rings specified on the cal box.y
   L67445: ---Switch the cal box to
   L67446: Switching Transformers.O
   L67447: SWXO
   L67448: NFCO
   L67449: AABNow adjust R1005 for the number

## ringer_adjust_r1005 (around L67449)
   L67446: Switching Transformers.O
   L67447: SWXO
   L67448: NFCO
>> L67449: AABNow adjust R1005 for the number
   L67450: of rings specified on the cal box.O
   L67451: NFCR
   L67452: CALOFFO
   L67453: YFBU
   L67454: Ringer.viU
   L67455: Ringer.viH

## ringer_fixture_prompt (around L67512)
   L67509: LVIN
   L67510: WAIT.VI
   L67511: PTH0
>> L67512: KKLConnect the UUT leads to the
   L67513: Small Ringer Cal Box set to
   L67514: Yolks and Flybacks.
   L67515: VIDS
   L67516: Ringer.vi
   L67517: VIDS
   L67518: WAIT.VI

## load_select_map_header (around L78956)
   L78953: Error\FC In
   L78954: --------------LOAD SELECT--------------------------------------
   L78955: DEFAULT:
>> L78956:     0=1.1MOhm connected to UUT leads; Same as '9'.
   L78957: LOW Voltage side:
   L78958:     1=100k; 2=10k; 3=1k; 4=100; 5=10; 6=2k;
   L78959:     7=0%(DA); 8=10% (DA)
   L78960: HIGH Voltage side:
   L78961:     9=100k 
   L78962: ______________________________________

## load_select_named_values (around L79013)
   L79010: ABORT?.vi
   L79011: PTH0
   L79012: Default
>> L79013: 100k (low voltage)
   L79014: 10k(low voltage)
   L79015: 1k(low voltage / gain)
   L79016: 100(low voltage)
   L79017: 10(low voltage)
   L79018: 2k(gain)
   L79019: 0% (DA)

## leak_i_meta_header (around L82666)
   L82663: t"$|"$
   L82664: LEAK_I.VIVI
   L82665: Col.#              Desc.
>> L82666:    0          Sense Resistor
   L82667:    1          Approx. Current
   L82668:    2          Cal Box Setup #
   L82669:    3          8842 Mult. factorU
   L82670: Test Name`
   L82671: Leakage Current TestW
   L82672: Error\FC InX
