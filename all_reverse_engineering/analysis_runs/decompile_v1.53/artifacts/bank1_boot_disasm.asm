
; ===== thunk_FUN_CODE_37f9 =====
CODE:0000: 02 37 f9           LJMP 0x37f9

; ===== FUN_CODE_0003 =====
CODE:0003: 00                 NOP 
CODE:0004: 00                 NOP 
CODE:0005: 00                 NOP 
CODE:0006: 00                 NOP 
CODE:0007: 00                 NOP 
CODE:0008: 00                 NOP 
CODE:0009: 00                 NOP 
CODE:000a: 00                 NOP 

; ===== thunk_FUN_CODE_24dd =====
CODE:000b: 02 24 dd           LJMP 0x24dd

; ===== thunk_FUN_CODE_2619 =====
CODE:0013: 02 26 19           LJMP 0x2619

; ===== thunk_FUN_CODE_0074 =====
CODE:001b: 01 74              AJMP 0x0074

; ===== thunk_FUN_CODE_26de =====
CODE:0023: 02 26 de           LJMP 0x26de

; ===== FUN_CODE_002b =====
CODE:002b: e4                 CLR A
CODE:002c: 90 8a 24           MOV DPTR | #0x8a24
CODE:002f: f0                 MOVX @DPTR | A
CODE:0030: a3                 INC DPTR
CODE:0031: f0                 MOVX @DPTR | A
CODE:0032: a3                 INC DPTR

; ===== FUN_CODE_0033 =====
CODE:0033: f0                 MOVX @DPTR | A
CODE:0034: a3                 INC DPTR
CODE:0035: f0                 MOVX @DPTR | A
CODE:0036: 78 2c              MOV R0 | #0x2c
CODE:0038: 7c 8a              MOV R4 | #0x8a
CODE:003a: 7d 01              MOV R5 | #0x1
CODE:003c: 7b ff              MOV R3 | #0xff
CODE:003e: 7a 23              MOV R2 | #0x23
CODE:0040: 79 3a              MOV R1 | #0x3a
CODE:0042: fe                 MOV R6 | A

; ===== FUN_CODE_0043 =====
CODE:0043: 7f 0b              MOV R7 | #0xb
CODE:0045: 12 40 ab           LCALL 0x40ab
CODE:0048: 7f 0a              MOV R7 | #0xa
CODE:004a: 7e 00              MOV R6 | #0x0
CODE:004c: 12 38 bc           LCALL 0x38bc
CODE:004f: 12 05 fe           LCALL 0x05fe
CODE:0052: c2 08              CLR 0x08
CODE:0054: 12 1f 64           LCALL 0x1f64

; ===== FUN_CODE_0057 =====
CODE:0057: 90 6f 02           MOV DPTR | #0x6f02
CODE:005a: e0                 MOVX A | @DPTR
CODE:005b: 20 e2 f9           JB 0xe2 | 0x0057
CODE:005e: 12 1b f0           LCALL 0x1bf0
CODE:0061: 12 1f 64           LCALL 0x1f64

; ===== FUN_CODE_0074 =====
CODE:0074: f0                 MOVX @DPTR | A
CODE:0075: e4                 CLR A
CODE:0076: ff                 MOV R7 | A
CODE:0077: 12 38 c6           LCALL 0x38c6
CODE:007a: 7b ff              MOV R3 | #0xff
CODE:007c: 7a 21              MOV R2 | #0x21
CODE:007e: 79 67              MOV R1 | #0x67
CODE:0080: 12 38 cb           LCALL 0x38cb

; ===== FUN_CODE_0091 =====
CODE:0091: 7f 00              MOV R7 | #0x0
CODE:0093: 7e 03              MOV R6 | #0x3
CODE:0095: 7b 01              MOV R3 | #0x1
CODE:0097: 7a 8a              MOV R2 | #0x8a
CODE:0099: 79 37              MOV R1 | #0x37
CODE:009b: 90 8a 9e           MOV DPTR | #0x8a9e
CODE:009e: 74 0b              MOV A | #0xb
CODE:00a0: f0                 MOVX @DPTR | A
CODE:00a1: 12 38 d0           LCALL 0x38d0
CODE:00a4: ef                 MOV A | R7
CODE:00a5: 60 ea              JZ 0x0091
CODE:00a7: 78 37              MOV R0 | #0x37
CODE:00a9: 7c 8a              MOV R4 | #0x8a
CODE:00ab: 7d 01              MOV R5 | #0x1
CODE:00ad: 7b ff              MOV R3 | #0xff
CODE:00af: 7a 21              MOV R2 | #0x21
CODE:00b1: 79 91              MOV R1 | #0x91
CODE:00b3: 12 46 82           LCALL 0x4682
CODE:00b6: ef                 MOV A | R7
CODE:00b7: 70 09              JNZ 0x00c2
CODE:00b9: 74 ff              MOV A | #0xff
CODE:00bb: ff                 MOV R7 | A
CODE:00bc: fe                 MOV R6 | A
CODE:00bd: 12 38 d5           LCALL 0x38d5
CODE:00c0: 80 62              SJMP 0x0124

; ===== FUN_CODE_00c2 =====
CODE:00c2: 7f 17              MOV R7 | #0x17
CODE:00c4: 12 38 c6           LCALL 0x38c6
CODE:00c7: 7b ff              MOV R3 | #0xff
CODE:00c9: 7a 21              MOV R2 | #0x21
CODE:00cb: 79 9c              MOV R1 | #0x9c
CODE:00cd: 12 38 cb           LCALL 0x38cb

; ===== FUN_CODE_0124 =====
CODE:0124: 90 80 35           MOV DPTR | #0x8035
CODE:0127: e0                 MOVX A | @DPTR
CODE:0128: 54 f7              ANL A | #0xf7
CODE:012a: f0                 MOVX @DPTR | A
CODE:012b: 90 7b 00           MOV DPTR | #0x7b00
CODE:012e: f0                 MOVX @DPTR | A
CODE:012f: 7f 58              MOV R7 | #0x58
CODE:0131: 7e 02              MOV R6 | #0x2
CODE:0133: 12 1f 97           LCALL 0x1f97
CODE:0136: e4                 CLR A
CODE:0137: ff                 MOV R7 | A
CODE:0138: 12 38 c6           LCALL 0x38c6
CODE:013b: 7b ff              MOV R3 | #0xff
CODE:013d: 7a 21              MOV R2 | #0x21
CODE:013f: 79 d2              MOV R1 | #0xd2
CODE:0141: 12 38 cb           LCALL 0x38cb

; ===== FUN_CODE_0171 =====
CODE:0171: 30 08 03           JNB 0x08 | 0x0177
CODE:0174: 02 05 c0           LJMP 0x05c0

; ===== FUN_CODE_0177 =====
CODE:0177: e4                 CLR A
CODE:0178: 90 80 85           MOV DPTR | #0x8085
CODE:017b: f0                 MOVX @DPTR | A
CODE:017c: a3                 INC DPTR
CODE:017d: f0                 MOVX @DPTR | A
CODE:017e: a3                 INC DPTR
CODE:017f: f0                 MOVX @DPTR | A
CODE:0180: a3                 INC DPTR
CODE:0181: f0                 MOVX @DPTR | A
CODE:0182: 90 80 b9           MOV DPTR | #0x80b9
CODE:0185: f0                 MOVX @DPTR | A
CODE:0186: a3                 INC DPTR
CODE:0187: f0                 MOVX @DPTR | A
CODE:0188: a3                 INC DPTR
CODE:0189: f0                 MOVX @DPTR | A
CODE:018a: a3                 INC DPTR
CODE:018b: f0                 MOVX @DPTR | A
CODE:018c: 90 81 08           MOV DPTR | #0x8108
CODE:018f: e0                 MOVX A | @DPTR
CODE:0190: 70 04              JNZ 0x0196
CODE:0192: a3                 INC DPTR
CODE:0193: e0                 MOVX A | @DPTR
CODE:0194: 64 0b              XRL A | #0xb

; ===== FUN_CODE_0196 =====
CODE:0196: 70 09              JNZ 0x01a1
CODE:0198: 20 22 06           JB 0x22 | 0x01a1
CODE:019b: 20 08 03           JB 0x08 | 0x01a1
CODE:019e: 12 1b f0           LCALL 0x1bf0

; ===== FUN_CODE_01a1 =====
CODE:01a1: c2 09              CLR 0x09
CODE:01a3: 90 81 bc           MOV DPTR | #0x81bc
CODE:01a6: 12 44 56           LCALL 0x4456

; ===== FUN_CODE_0239 =====
CODE:0239: 7f 88              MOV R7 | #0x88
CODE:023b: 7e 13              MOV R6 | #0x13
CODE:023d: 7d 00              MOV R5 | #0x0
CODE:023f: 7c 00              MOV R4 | #0x0
CODE:0241: 90 81 c0           MOV DPTR | #0x81c0
CODE:0244: e0                 MOVX A | @DPTR
CODE:0245: f8                 MOV R0 | A
CODE:0246: a3                 INC DPTR
CODE:0247: e0                 MOVX A | @DPTR
CODE:0248: f9                 MOV R1 | A
CODE:0249: a3                 INC DPTR
CODE:024a: e0                 MOVX A | @DPTR
CODE:024b: fa                 MOV R2 | A
CODE:024c: a3                 INC DPTR
CODE:024d: e0                 MOVX A | @DPTR
CODE:024e: fb                 MOV R3 | A
CODE:024f: c3                 CLR CY
CODE:0250: 12 43 e8           LCALL 0x43e8
CODE:0253: 40 e4              JC 0x0239
CODE:0255: d2 08              SETB 0x08

; ===== thunk_FUN_CODE_1f64 =====
CODE:0257: 12 1f 64           LCALL 0x1f64

; ===== <no_function> =====
CODE:02ea: 7f 57              MOV R7 | #0x57
CODE:02ec: 12 38 c6           LCALL 0x38c6
CODE:02ef: 7b ff              MOV R3 | #0xff
CODE:02f1: 7a 22              MOV R2 | #0x22
CODE:02f3: 79 1d              MOV R1 | #0x1d
CODE:02f5: 12 38 cb           LCALL 0x38cb
CODE:02fe: 00                 NOP 
CODE:02ff: 00                 NOP 
CODE:0300: 02 58 c2           LJMP 0x58c2
CODE:0341: 7f 57              MOV R7 | #0x57
CODE:0343: 12 38 c6           LCALL 0x38c6
CODE:0346: 7b ff              MOV R3 | #0xff
CODE:0348: 7a 21              MOV R2 | #0x21
CODE:034a: 79 c0              MOV R1 | #0xc0
CODE:034c: 12 38 cb           LCALL 0x38cb
CODE:035b: 00                 NOP 
CODE:035c: 00                 NOP 
CODE:035d: 00                 NOP 
CODE:035e: 00                 NOP 
CODE:035f: 90 80 35           MOV DPTR | #0x8035
CODE:0362: e0                 MOVX A | @DPTR
CODE:0363: 54 f7              ANL A | #0xf7
CODE:0365: f0                 MOVX @DPTR | A
CODE:0366: 90 7b 00           MOV DPTR | #0x7b00
CODE:0369: f0                 MOVX @DPTR | A
CODE:036a: 54 df              ANL A | #0xdf
CODE:036c: 90 80 35           MOV DPTR | #0x8035
CODE:036f: f0                 MOVX @DPTR | A
CODE:0370: 90 7b 00           MOV DPTR | #0x7b00
CODE:0373: f0                 MOVX @DPTR | A

; ===== FUN_CODE_0374 =====
CODE:0374: 30 33 41           JNB 0x33 | 0x03b8
CODE:0377: 12 1f 64           LCALL 0x1f64

; ===== FUN_CODE_03b8 =====
CODE:03b8: 12 38 ee           LCALL 0x38ee
CODE:03bb: 30 08 03           JNB 0x08 | 0x03c1
CODE:03be: 02 01 71           LJMP 0x0171

; ===== FUN_CODE_03c1 =====
CODE:03c1: 12 38 f8           LCALL 0x38f8
CODE:03c4: 90 8a 2b           MOV DPTR | #0x8a2b
CODE:03c7: ef                 MOV A | R7
CODE:03c8: f0                 MOVX @DPTR | A
CODE:03c9: c3                 CLR CY
CODE:03ca: 64 80              XRL A | #0x80
CODE:03cc: 94 83              SUBB A | #0x83
CODE:03ce: 50 18              JNC 0x03e8
CODE:03d0: 20 30 15           JB 0x30 | 0x03e8
CODE:03d3: e0                 MOVX A | @DPTR
CODE:03d4: ff                 MOV R7 | A
CODE:03d5: 33                 RLC A
CODE:03d6: 95 e0              SUBB A | A
CODE:03d8: fe                 MOV R6 | A
CODE:03d9: 12 38 fd           LCALL 0x38fd
CODE:03dc: e4                 CLR A
CODE:03dd: 90 80 f7           MOV DPTR | #0x80f7
CODE:03e0: f0                 MOVX @DPTR | A
CODE:03e1: a3                 INC DPTR
CODE:03e2: f0                 MOVX @DPTR | A
CODE:03e3: c2 20              CLR 0x20
CODE:03e5: 02 01 71           LJMP 0x0171

; ===== FUN_CODE_03e8 =====
CODE:03e8: 90 8a 2b           MOV DPTR | #0x8a2b
CODE:03eb: e0                 MOVX A | @DPTR
CODE:03ec: c3                 CLR CY
CODE:03ed: 64 80              XRL A | #0x80
CODE:03ef: 94 86              SUBB A | #0x86
CODE:03f1: 50 03              JNC 0x03f6
CODE:03f3: 30 30 15           JNB 0x30 | 0x040b

; ===== FUN_CODE_03f6 =====
CODE:03f6: 20 30 03           JB 0x30 | 0x03fc
CODE:03f9: 02 05 97           LJMP 0x0597

; ===== FUN_CODE_03fc =====
CODE:03fc: 90 81 08           MOV DPTR | #0x8108
CODE:03ff: e0                 MOVX A | @DPTR
CODE:0400: 70 04              JNZ 0x0406
CODE:0402: a3                 INC DPTR
CODE:0403: e0                 MOVX A | @DPTR
CODE:0404: 64 0b              XRL A | #0xb

; ===== FUN_CODE_0406 =====
CODE:0406: 70 03              JNZ 0x040b
CODE:0408: 02 05 97           LJMP 0x0597

; ===== thunk_FUN_CODE_1f64 =====
CODE:040b: 12 1f 64           LCALL 0x1f64

; ===== <no_function> =====
CODE:0441: 7f 57              MOV R7 | #0x57
CODE:0443: 12 38 c6           LCALL 0x38c6
CODE:0446: 7b ff              MOV R3 | #0xff
CODE:0448: 7a 21              MOV R2 | #0x21
CODE:044a: 79 c0              MOV R1 | #0xc0
CODE:044c: 12 38 cb           LCALL 0x38cb

; ===== FUN_CODE_0597 =====
CODE:0597: 20 20 21           JB 0x20 | 0x05bb
CODE:059a: 20 0a 1e           JB 0x0a | 0x05bb
CODE:059d: 7f 17              MOV R7 | #0x17
CODE:059f: 12 38 c6           LCALL 0x38c6
CODE:05a2: 7b ff              MOV R3 | #0xff
CODE:05a4: 7a 22              MOV R2 | #0x22
CODE:05a6: 79 41              MOV R1 | #0x41
CODE:05a8: 12 38 cb           LCALL 0x38cb

; ===== FUN_CODE_05bb =====
CODE:05bb: c2 12              CLR 0x12
CODE:05bd: 02 01 71           LJMP 0x0171

; ===== FUN_CODE_05c0 =====
CODE:05c0: 12 1b f0           LCALL 0x1bf0
CODE:05c3: 30 08 37           JNB 0x08 | 0x05fd
CODE:05c6: e4                 CLR A
CODE:05c7: ff                 MOV R7 | A
CODE:05c8: fe                 MOV R6 | A
CODE:05c9: 7d 03              MOV R5 | #0x3
CODE:05cb: 12 15 1d           LCALL 0x151d
CODE:05ce: 90 80 61           MOV DPTR | #0x8061
CODE:05d1: e0                 MOVX A | @DPTR
CODE:05d2: 54 bf              ANL A | #0xbf
CODE:05d4: f0                 MOVX @DPTR | A
CODE:05d5: 90 77 02           MOV DPTR | #0x7702
CODE:05d8: f0                 MOVX @DPTR | A
CODE:05d9: 90 80 5c           MOV DPTR | #0x805c
CODE:05dc: e0                 MOVX A | @DPTR
CODE:05dd: 54 bf              ANL A | #0xbf
CODE:05df: f0                 MOVX @DPTR | A
CODE:05e0: 90 7e 02           MOV DPTR | #0x7e02
CODE:05e3: f0                 MOVX @DPTR | A
CODE:05e4: 7f c8              MOV R7 | #0xc8
CODE:05e6: 7e 00              MOV R6 | #0x0
CODE:05e8: 12 1f 97           LCALL 0x1f97
CODE:05eb: 12 1f 64           LCALL 0x1f64

; ===== FUN_CODE_05fd =====
CODE:05fd: 22                 RET 

; ===== FUN_CODE_05fe =====
CODE:05fe: e4                 CLR A
CODE:05ff: 90 8a 42           MOV DPTR | #0x8a42
CODE:0602: f0                 MOVX @DPTR | A
CODE:0603: 90 7b 03           MOV DPTR | #0x7b03
CODE:0606: 74 80              MOV A | #0x80
CODE:0608: f0                 MOVX @DPTR | A
CODE:0609: 90 7d 03           MOV DPTR | #0x7d03
CODE:060c: f0                 MOVX @DPTR | A
CODE:060d: 90 7e 03           MOV DPTR | #0x7e03
CODE:0610: f0                 MOVX @DPTR | A
CODE:0611: 90 77 03           MOV DPTR | #0x7703
CODE:0614: 74 93              MOV A | #0x93
CODE:0616: f0                 MOVX @DPTR | A
CODE:0617: 90 6f 03           MOV DPTR | #0x6f03
CODE:061a: 74 81              MOV A | #0x81
CODE:061c: f0                 MOVX @DPTR | A
CODE:061d: 90 80 61           MOV DPTR | #0x8061
CODE:0620: 74 3c              MOV A | #0x3c
CODE:0622: f0                 MOVX @DPTR | A
CODE:0623: 90 77 02           MOV DPTR | #0x7702
CODE:0626: f0                 MOVX @DPTR | A
CODE:0627: e4                 CLR A
CODE:0628: ff                 MOV R7 | A
CODE:0629: fe                 MOV R6 | A
CODE:062a: 7d 03              MOV R5 | #0x3
CODE:062c: 12 15 1d           LCALL 0x151d
CODE:062f: 90 80 c5           MOV DPTR | #0x80c5
CODE:0632: 12 44 56           LCALL 0x4456

; ===== FUN_CODE_151d =====
CODE:151d: 90 8a dc           MOV DPTR | #0x8adc
CODE:1520: ee                 MOV A | R6
CODE:1521: f0                 MOVX @DPTR | A
CODE:1522: a3                 INC DPTR
CODE:1523: ef                 MOV A | R7
CODE:1524: f0                 MOVX @DPTR | A
CODE:1525: 90 80 4f           MOV DPTR | #0x804f
CODE:1528: e0                 MOVX A | @DPTR
CODE:1529: 54 fd              ANL A | #0xfd
CODE:152b: f0                 MOVX @DPTR | A
CODE:152c: 90 7d 01           MOV DPTR | #0x7d01
CODE:152f: f0                 MOVX @DPTR | A
CODE:1530: 44 0c              ORL A | #0xc
CODE:1532: 90 80 4f           MOV DPTR | #0x804f
CODE:1535: f0                 MOVX @DPTR | A
CODE:1536: 90 7d 01           MOV DPTR | #0x7d01
CODE:1539: f0                 MOVX @DPTR | A
CODE:153a: 90 80 61           MOV DPTR | #0x8061
CODE:153d: e0                 MOVX A | @DPTR
CODE:153e: 44 80              ORL A | #0x80
CODE:1540: f0                 MOVX @DPTR | A
CODE:1541: 90 77 02           MOV DPTR | #0x7702
CODE:1544: f0                 MOVX @DPTR | A
CODE:1545: ed                 MOV A | R5
CODE:1546: b4 03 0d           CJNE A | #0x3 | 0x1556
CODE:1549: 79 0c              MOV R1 | #0xc
CODE:154b: 90 8a de           MOV DPTR | #0x8ade
CODE:154e: 74 08              MOV A | #0x8
CODE:1550: f0                 MOVX @DPTR | A
CODE:1551: a3                 INC DPTR
CODE:1552: e4                 CLR A
CODE:1553: f0                 MOVX @DPTR | A
CODE:1554: 80 46              SJMP 0x159c

; ===== FUN_CODE_1556 =====
CODE:1556: 79 10              MOV R1 | #0x10
CODE:1558: 90 8a de           MOV DPTR | #0x8ade
CODE:155b: 74 80              MOV A | #0x80
CODE:155d: f0                 MOVX @DPTR | A
CODE:155e: a3                 INC DPTR
CODE:155f: e4                 CLR A
CODE:1560: f0                 MOVX @DPTR | A
CODE:1561: ed                 MOV A | R5
CODE:1562: 64 02              XRL A | #0x2
CODE:1564: 60 04              JZ 0x156a
CODE:1566: ed                 MOV A | R5
CODE:1567: b4 05 0a           CJNE A | #0x5 | 0x1574

; ===== FUN_CODE_156a =====
CODE:156a: 90 8a dc           MOV DPTR | #0x8adc
CODE:156d: e0                 MOVX A | @DPTR
CODE:156e: 44 80              ORL A | #0x80
CODE:1570: f0                 MOVX @DPTR | A
CODE:1571: a3                 INC DPTR
CODE:1572: e0                 MOVX A | @DPTR
CODE:1573: f0                 MOVX @DPTR | A

; ===== FUN_CODE_1574 =====
CODE:1574: c3                 CLR CY
CODE:1575: ed                 MOV A | R5
CODE:1576: 64 80              XRL A | #0x80
CODE:1578: 94 83              SUBB A | #0x83
CODE:157a: 50 09              JNC 0x1585
CODE:157c: 90 80 4f           MOV DPTR | #0x804f
CODE:157f: e0                 MOVX A | @DPTR
CODE:1580: 54 fb              ANL A | #0xfb
CODE:1582: f0                 MOVX @DPTR | A
CODE:1583: 80 0f              SJMP 0x1594

; ===== FUN_CODE_1585 =====
CODE:1585: d3                 SETB CY
CODE:1586: ed                 MOV A | R5
CODE:1587: 64 80              XRL A | #0x80
CODE:1589: 94 83              SUBB A | #0x83
CODE:158b: 40 07              JC 0x1594
CODE:158d: 90 80 4f           MOV DPTR | #0x804f
CODE:1590: e0                 MOVX A | @DPTR
CODE:1591: 54 f7              ANL A | #0xf7
CODE:1593: f0                 MOVX @DPTR | A

; ===== FUN_CODE_1594 =====
CODE:1594: 90 80 4f           MOV DPTR | #0x804f
CODE:1597: e0                 MOVX A | @DPTR
CODE:1598: 90 7d 01           MOV DPTR | #0x7d01
CODE:159b: f0                 MOVX @DPTR | A

; ===== FUN_CODE_159c =====
CODE:159c: e4                 CLR A
CODE:159d: fc                 MOV R4 | A

; ===== FUN_CODE_159e =====
CODE:159e: c3                 CLR CY
CODE:159f: e9                 MOV A | R1
CODE:15a0: 64 80              XRL A | #0x80
CODE:15a2: f8                 MOV R0 | A
CODE:15a3: ec                 MOV A | R4
CODE:15a4: 64 80              XRL A | #0x80
CODE:15a6: 98                 SUBB A | R0
CODE:15a7: 50 50              JNC 0x15f9
CODE:15a9: 90 8a dc           MOV DPTR | #0x8adc
CODE:15ac: e0                 MOVX A | @DPTR
CODE:15ad: fe                 MOV R6 | A
CODE:15ae: a3                 INC DPTR
CODE:15af: e0                 MOVX A | @DPTR
CODE:15b0: ff                 MOV R7 | A
CODE:15b1: a3                 INC DPTR
CODE:15b2: e0                 MOVX A | @DPTR
CODE:15b3: fa                 MOV R2 | A
CODE:15b4: a3                 INC DPTR
CODE:15b5: e0                 MOVX A | @DPTR
CODE:15b6: fb                 MOV R3 | A
CODE:15b7: ea                 MOV A | R2
CODE:15b8: 5e                 ANL A | R6
CODE:15b9: fe                 MOV R6 | A
CODE:15ba: eb                 MOV A | R3
CODE:15bb: 5f                 ANL A | R7
CODE:15bc: 4e                 ORL A | R6
CODE:15bd: 60 09              JZ 0x15c8
CODE:15bf: 90 80 4f           MOV DPTR | #0x804f
CODE:15c2: e0                 MOVX A | @DPTR
CODE:15c3: 44 01              ORL A | #0x1
CODE:15c5: f0                 MOVX @DPTR | A
CODE:15c6: 80 07              SJMP 0x15cf

; ===== FUN_CODE_15c8 =====
CODE:15c8: 90 80 4f           MOV DPTR | #0x804f
CODE:15cb: e0                 MOVX A | @DPTR
CODE:15cc: 54 fe              ANL A | #0xfe
CODE:15ce: f0                 MOVX @DPTR | A

; ===== FUN_CODE_15cf =====
CODE:15cf: 90 80 4f           MOV DPTR | #0x804f
CODE:15d2: e0                 MOVX A | @DPTR
CODE:15d3: 90 7d 01           MOV DPTR | #0x7d01
CODE:15d6: f0                 MOVX @DPTR | A
CODE:15d7: 44 02              ORL A | #0x2
CODE:15d9: 90 80 4f           MOV DPTR | #0x804f
CODE:15dc: f0                 MOVX @DPTR | A
CODE:15dd: 90 7d 01           MOV DPTR | #0x7d01
CODE:15e0: f0                 MOVX @DPTR | A
CODE:15e1: 54 fd              ANL A | #0xfd
CODE:15e3: 90 80 4f           MOV DPTR | #0x804f
CODE:15e6: f0                 MOVX @DPTR | A
CODE:15e7: 90 7d 01           MOV DPTR | #0x7d01
CODE:15ea: f0                 MOVX @DPTR | A
CODE:15eb: ea                 MOV A | R2
CODE:15ec: c3                 CLR CY
CODE:15ed: 13                 RRC A
CODE:15ee: 90 8a de           MOV DPTR | #0x8ade
CODE:15f1: f0                 MOVX @DPTR | A
CODE:15f2: eb                 MOV A | R3
CODE:15f3: 13                 RRC A
CODE:15f4: a3                 INC DPTR
CODE:15f5: f0                 MOVX @DPTR | A
CODE:15f6: 0c                 INC R4
CODE:15f7: 80 a5              SJMP 0x159e

; ===== FUN_CODE_15f9 =====
CODE:15f9: ed                 MOV A | R5
CODE:15fa: b4 03 16           CJNE A | #0x3 | 0x1613
CODE:15fd: 90 80 61           MOV DPTR | #0x8061
CODE:1600: e0                 MOVX A | @DPTR
CODE:1601: 54 70              ANL A | #0x70
CODE:1603: f0                 MOVX @DPTR | A
CODE:1604: 90 77 02           MOV DPTR | #0x7702
CODE:1607: f0                 MOVX @DPTR | A
CODE:1608: 44 80              ORL A | #0x80
CODE:160a: 90 80 61           MOV DPTR | #0x8061
CODE:160d: f0                 MOVX @DPTR | A
CODE:160e: 90 77 02           MOV DPTR | #0x7702
CODE:1611: f0                 MOVX @DPTR | A
CODE:1612: 22                 RET 

; ===== FUN_CODE_1613 =====
CODE:1613: 90 80 4f           MOV DPTR | #0x804f
CODE:1616: e0                 MOVX A | @DPTR
CODE:1617: 44 02              ORL A | #0x2
CODE:1619: f0                 MOVX @DPTR | A
CODE:161a: 90 7d 01           MOV DPTR | #0x7d01
CODE:161d: f0                 MOVX @DPTR | A
CODE:161e: 44 0c              ORL A | #0xc
CODE:1620: 90 80 4f           MOV DPTR | #0x804f
CODE:1623: f0                 MOVX @DPTR | A
CODE:1624: 90 7d 01           MOV DPTR | #0x7d01
CODE:1627: f0                 MOVX @DPTR | A
CODE:1628: 22                 RET 

; ===== FUN_CODE_1bf0 =====
CODE:1bf0: 90 80 35           MOV DPTR | #0x8035
CODE:1bf3: e0                 MOVX A | @DPTR
CODE:1bf4: 54 f8              ANL A | #0xf8
CODE:1bf6: f0                 MOVX @DPTR | A
CODE:1bf7: 90 7b 00           MOV DPTR | #0x7b00
CODE:1bfa: f0                 MOVX @DPTR | A
CODE:1bfb: e4                 CLR A
CODE:1bfc: 90 80 4d           MOV DPTR | #0x804d
CODE:1bff: f0                 MOVX @DPTR | A
CODE:1c00: 90 7b 01           MOV DPTR | #0x7b01
CODE:1c03: f0                 MOVX @DPTR | A
CODE:1c04: 90 80 50           MOV DPTR | #0x8050
CODE:1c07: f0                 MOVX @DPTR | A
CODE:1c08: 90 7b 02           MOV DPTR | #0x7b02
CODE:1c0b: f0                 MOVX @DPTR | A
CODE:1c0c: 90 80 4c           MOV DPTR | #0x804c
CODE:1c0f: e0                 MOVX A | @DPTR
CODE:1c10: 54 e1              ANL A | #0xe1
CODE:1c12: f0                 MOVX @DPTR | A
CODE:1c13: 44 01              ORL A | #0x1
CODE:1c15: f0                 MOVX @DPTR | A
CODE:1c16: 90 7d 00           MOV DPTR | #0x7d00
CODE:1c19: f0                 MOVX @DPTR | A
CODE:1c1a: 90 80 4f           MOV DPTR | #0x804f
CODE:1c1d: e0                 MOVX A | @DPTR
CODE:1c1e: 44 40              ORL A | #0x40
CODE:1c20: f0                 MOVX @DPTR | A
CODE:1c21: 54 cf              ANL A | #0xcf
CODE:1c23: f0                 MOVX @DPTR | A
CODE:1c24: 90 7d 01           MOV DPTR | #0x7d01
CODE:1c27: f0                 MOVX @DPTR | A
CODE:1c28: 90 80 54           MOV DPTR | #0x8054
CODE:1c2b: e0                 MOVX A | @DPTR
CODE:1c2c: 54 1c              ANL A | #0x1c
CODE:1c2e: f0                 MOVX @DPTR | A
CODE:1c2f: 90 7d 02           MOV DPTR | #0x7d02
CODE:1c32: f0                 MOVX @DPTR | A
CODE:1c33: 90 80 5c           MOV DPTR | #0x805c
CODE:1c36: e0                 MOVX A | @DPTR
CODE:1c37: 54 bf              ANL A | #0xbf
CODE:1c39: f0                 MOVX @DPTR | A
CODE:1c3a: 44 40              ORL A | #0x40
CODE:1c3c: f0                 MOVX @DPTR | A
CODE:1c3d: 90 7e 02           MOV DPTR | #0x7e02
CODE:1c40: f0                 MOVX @DPTR | A
CODE:1c41: 90 80 61           MOV DPTR | #0x8061
CODE:1c44: e0                 MOVX A | @DPTR
CODE:1c45: 44 30              ORL A | #0x30
CODE:1c47: f0                 MOVX @DPTR | A
CODE:1c48: 90 77 02           MOV DPTR | #0x7702
CODE:1c4b: f0                 MOVX @DPTR | A
CODE:1c4c: 90 80 67           MOV DPTR | #0x8067
CODE:1c4f: e0                 MOVX A | @DPTR
CODE:1c50: 54 cf              ANL A | #0xcf
CODE:1c52: f0                 MOVX @DPTR | A
CODE:1c53: 90 6f 02           MOV DPTR | #0x6f02
CODE:1c56: f0                 MOVX @DPTR | A
CODE:1c57: 12 39 39           LCALL 0x3939
CODE:1c5a: 7f ff              MOV R7 | #0xff
CODE:1c5c: 7e 0f              MOV R6 | #0xf
CODE:1c5e: 7d 02              MOV R5 | #0x2
CODE:1c60: 12 15 1d           LCALL 0x151d
CODE:1c63: 90 81 bc           MOV DPTR | #0x81bc
CODE:1c66: 12 44 56           LCALL 0x4456

; ===== FUN_CODE_1c70 =====
CODE:1c70: 7f 64              MOV R7 | #0x64
CODE:1c72: 7e 00              MOV R6 | #0x0
CODE:1c74: 7d 00              MOV R5 | #0x0
CODE:1c76: 7c 00              MOV R4 | #0x0
CODE:1c78: 90 81 bc           MOV DPTR | #0x81bc
CODE:1c7b: e0                 MOVX A | @DPTR
CODE:1c7c: f8                 MOV R0 | A
CODE:1c7d: a3                 INC DPTR
CODE:1c7e: e0                 MOVX A | @DPTR
CODE:1c7f: f9                 MOV R1 | A
CODE:1c80: a3                 INC DPTR
CODE:1c81: e0                 MOVX A | @DPTR
CODE:1c82: fa                 MOV R2 | A
CODE:1c83: a3                 INC DPTR
CODE:1c84: e0                 MOVX A | @DPTR
CODE:1c85: fb                 MOV R3 | A
CODE:1c86: c3                 CLR CY
CODE:1c87: 12 43 e8           LCALL 0x43e8
CODE:1c8a: 50 05              JNC 0x1c91
CODE:1c8c: 12 1f 64           LCALL 0x1f64

; ===== FUN_CODE_1c91 =====
CODE:1c91: d2 22              SETB 0x22
CODE:1c93: 22                 RET 

; ===== FUN_CODE_1f64 =====
CODE:1f64: 90 80 35           MOV DPTR | #0x8035
CODE:1f67: e0                 MOVX A | @DPTR
CODE:1f68: 54 7f              ANL A | #0x7f
CODE:1f6a: f0                 MOVX @DPTR | A
CODE:1f6b: 90 7b 00           MOV DPTR | #0x7b00
CODE:1f6e: f0                 MOVX @DPTR | A
CODE:1f6f: 44 80              ORL A | #0x80
CODE:1f71: 90 80 35           MOV DPTR | #0x8035
CODE:1f74: f0                 MOVX @DPTR | A
CODE:1f75: 90 7b 00           MOV DPTR | #0x7b00
CODE:1f78: f0                 MOVX @DPTR | A
CODE:1f79: 22                 RET 

; ===== FUN_CODE_1f97 =====
CODE:1f97: 90 8a e2           MOV DPTR | #0x8ae2
CODE:1f9a: ee                 MOV A | R6
CODE:1f9b: f0                 MOVX @DPTR | A
CODE:1f9c: a3                 INC DPTR
CODE:1f9d: ef                 MOV A | R7
CODE:1f9e: f0                 MOVX @DPTR | A
CODE:1f9f: 90 81 bc           MOV DPTR | #0x81bc
CODE:1fa2: 12 44 56           LCALL 0x4456

; ===== FUN_CODE_1fa9 =====
CODE:1fa9: 90 8a e2           MOV DPTR | #0x8ae2
CODE:1fac: e0                 MOVX A | @DPTR
CODE:1fad: fe                 MOV R6 | A
CODE:1fae: a3                 INC DPTR
CODE:1faf: e0                 MOVX A | @DPTR
CODE:1fb0: ff                 MOV R7 | A
CODE:1fb1: ee                 MOV A | R6
CODE:1fb2: 33                 RLC A
CODE:1fb3: 95 e0              SUBB A | A
CODE:1fb5: fd                 MOV R5 | A
CODE:1fb6: fc                 MOV R4 | A
CODE:1fb7: 90 81 bc           MOV DPTR | #0x81bc
CODE:1fba: e0                 MOVX A | @DPTR
CODE:1fbb: f8                 MOV R0 | A
CODE:1fbc: a3                 INC DPTR
CODE:1fbd: e0                 MOVX A | @DPTR
CODE:1fbe: f9                 MOV R1 | A
CODE:1fbf: a3                 INC DPTR
CODE:1fc0: e0                 MOVX A | @DPTR
CODE:1fc1: fa                 MOV R2 | A
CODE:1fc2: a3                 INC DPTR
CODE:1fc3: e0                 MOVX A | @DPTR
CODE:1fc4: fb                 MOV R3 | A
CODE:1fc5: c3                 CLR CY
CODE:1fc6: 12 43 e8           LCALL 0x43e8
CODE:1fc9: 50 05              JNC 0x1fd0
CODE:1fcb: 12 1f 64           LCALL 0x1f64

; ===== FUN_CODE_1fd0 =====
CODE:1fd0: 22                 RET 

; ===== FUN_CODE_24dd =====
CODE:24dd: c0 e0              PUSH A
CODE:24df: c0 f0              PUSH B
CODE:24e1: c0 83              PUSH DPH
CODE:24e3: c0 82              PUSH DPL
CODE:24e5: c0 d0              PUSH PSW
CODE:24e7: 75 d0 08           MOV PSW | #0x8
CODE:24ea: 30 19 03           JNB 0x19 | 0x24f0
CODE:24ed: 02 25 db           LJMP 0x25db

; ===== FUN_CODE_24f0 =====
CODE:24f0: 75 8c fb           MOV 0x8c | #0xfb
CODE:24f3: 75 8a 32           MOV 0x8a | #0x32
CODE:24f6: 90 81 bc           MOV DPTR | #0x81bc
CODE:24f9: e0                 MOVX A | @DPTR
CODE:24fa: fc                 MOV R4 | A
CODE:24fb: a3                 INC DPTR
CODE:24fc: e0                 MOVX A | @DPTR
CODE:24fd: fd                 MOV R5 | A
CODE:24fe: a3                 INC DPTR
CODE:24ff: e0                 MOVX A | @DPTR
CODE:2500: fe                 MOV R6 | A
CODE:2501: a3                 INC DPTR
CODE:2502: e0                 MOVX A | @DPTR
CODE:2503: 7a 00              MOV R2 | #0x0
CODE:2505: 79 00              MOV R1 | #0x0
CODE:2507: 78 00              MOV R0 | #0x0
CODE:2509: 24 01              ADD A | #0x1
CODE:250b: ff                 MOV R7 | A
CODE:250c: ea                 MOV A | R2
CODE:250d: 3e                 ADDC A | R6
CODE:250e: fe                 MOV R6 | A
CODE:250f: e9                 MOV A | R1
CODE:2510: 3d                 ADDC A | R5
CODE:2511: fd                 MOV R5 | A
CODE:2512: e8                 MOV A | R0
CODE:2513: 3c                 ADDC A | R4
CODE:2514: fc                 MOV R4 | A
CODE:2515: 90 81 bc           MOV DPTR | #0x81bc
CODE:2518: 12 44 4a           LCALL 0x444a
CODE:251b: 90 81 c0           MOV DPTR | #0x81c0
CODE:251e: e0                 MOVX A | @DPTR
CODE:251f: fc                 MOV R4 | A
CODE:2520: a3                 INC DPTR
CODE:2521: e0                 MOVX A | @DPTR
CODE:2522: fd                 MOV R5 | A
CODE:2523: a3                 INC DPTR
CODE:2524: e0                 MOVX A | @DPTR
CODE:2525: fe                 MOV R6 | A
CODE:2526: a3                 INC DPTR
CODE:2527: e0                 MOVX A | @DPTR
CODE:2528: 78 00              MOV R0 | #0x0
CODE:252a: 24 01              ADD A | #0x1
CODE:252c: ff                 MOV R7 | A
CODE:252d: ea                 MOV A | R2
CODE:252e: 3e                 ADDC A | R6
CODE:252f: fe                 MOV R6 | A
CODE:2530: e9                 MOV A | R1
CODE:2531: 3d                 ADDC A | R5
CODE:2532: fd                 MOV R5 | A
CODE:2533: e8                 MOV A | R0
CODE:2534: 3c                 ADDC A | R4
CODE:2535: fc                 MOV R4 | A
CODE:2536: 90 81 c0           MOV DPTR | #0x81c0
CODE:2539: 12 44 4a           LCALL 0x444a
CODE:253c: 90 80 6b           MOV DPTR | #0x806b
CODE:253f: e0                 MOVX A | @DPTR
CODE:2540: 04                 INC A
CODE:2541: f0                 MOVX @DPTR | A
CODE:2542: 70 06              JNZ 0x254a
CODE:2544: 90 80 6a           MOV DPTR | #0x806a
CODE:2547: e0                 MOVX A | @DPTR
CODE:2548: 04                 INC A
CODE:2549: f0                 MOVX @DPTR | A

; ===== FUN_CODE_254a =====
CODE:254a: 7f ff              MOV R7 | #0xff
CODE:254c: 7e ff              MOV R6 | #0xff
CODE:254e: 7d 0f              MOV R5 | #0xf
CODE:2550: 7c 00              MOV R4 | #0x0
CODE:2552: 90 81 bc           MOV DPTR | #0x81bc
CODE:2555: e0                 MOVX A | @DPTR
CODE:2556: f8                 MOV R0 | A
CODE:2557: a3                 INC DPTR
CODE:2558: e0                 MOVX A | @DPTR
CODE:2559: f9                 MOV R1 | A
CODE:255a: a3                 INC DPTR
CODE:255b: e0                 MOVX A | @DPTR
CODE:255c: fa                 MOV R2 | A
CODE:255d: a3                 INC DPTR
CODE:255e: e0                 MOVX A | @DPTR
CODE:255f: fb                 MOV R3 | A
CODE:2560: c3                 CLR CY
CODE:2561: 12 43 e8           LCALL 0x43e8
CODE:2564: 70 0a              JNZ 0x2570
CODE:2566: 90 81 bc           MOV DPTR | #0x81bc
CODE:2569: 12 44 56           LCALL 0x4456

; ===== FUN_CODE_2570 =====
CODE:2570: 7f ff              MOV R7 | #0xff
CODE:2572: 7e ff              MOV R6 | #0xff
CODE:2574: 7d 0f              MOV R5 | #0xf
CODE:2576: 7c 00              MOV R4 | #0x0
CODE:2578: 90 81 c0           MOV DPTR | #0x81c0
CODE:257b: e0                 MOVX A | @DPTR
CODE:257c: f8                 MOV R0 | A
CODE:257d: a3                 INC DPTR
CODE:257e: e0                 MOVX A | @DPTR
CODE:257f: f9                 MOV R1 | A
CODE:2580: a3                 INC DPTR
CODE:2581: e0                 MOVX A | @DPTR
CODE:2582: fa                 MOV R2 | A
CODE:2583: a3                 INC DPTR
CODE:2584: e0                 MOVX A | @DPTR
CODE:2585: fb                 MOV R3 | A
CODE:2586: c3                 CLR CY
CODE:2587: 12 43 e8           LCALL 0x43e8
CODE:258a: 70 0a              JNZ 0x2596
CODE:258c: 90 81 c0           MOV DPTR | #0x81c0
CODE:258f: 12 44 56           LCALL 0x4456

; ===== FUN_CODE_2596 =====
CODE:2596: 90 80 6a           MOV DPTR | #0x806a
CODE:2599: e0                 MOVX A | @DPTR
CODE:259a: fe                 MOV R6 | A
CODE:259b: a3                 INC DPTR
CODE:259c: e0                 MOVX A | @DPTR
CODE:259d: ff                 MOV R7 | A
CODE:259e: e4                 CLR A
CODE:259f: fc                 MOV R4 | A
CODE:25a0: fd                 MOV R5 | A
CODE:25a1: 7b 60              MOV R3 | #0x60
CODE:25a3: 7a ea              MOV R2 | #0xea
CODE:25a5: f9                 MOV R1 | A
CODE:25a6: f8                 MOV R0 | A
CODE:25a7: c3                 CLR CY
CODE:25a8: 12 43 e8           LCALL 0x43e8
CODE:25ab: 70 61              JNZ 0x260e
CODE:25ad: 90 80 6a           MOV DPTR | #0x806a
CODE:25b0: f0                 MOVX @DPTR | A
CODE:25b1: a3                 INC DPTR
CODE:25b2: f0                 MOVX @DPTR | A
CODE:25b3: 20 30 0c           JB 0x30 | 0x25c2
CODE:25b6: 90 81 08           MOV DPTR | #0x8108
CODE:25b9: e0                 MOVX A | @DPTR
CODE:25ba: 70 04              JNZ 0x25c0
CODE:25bc: a3                 INC DPTR
CODE:25bd: e0                 MOVX A | @DPTR
CODE:25be: 64 0b              XRL A | #0xb

; ===== FUN_CODE_25c0 =====
CODE:25c0: 60 09              JZ 0x25cb

; ===== FUN_CODE_25c2 =====
CODE:25c2: e4                 CLR A
CODE:25c3: 90 80 f7           MOV DPTR | #0x80f7
CODE:25c6: f0                 MOVX @DPTR | A
CODE:25c7: a3                 INC DPTR
CODE:25c8: f0                 MOVX @DPTR | A
CODE:25c9: 80 43              SJMP 0x260e

; ===== FUN_CODE_25cb =====
CODE:25cb: 90 80 f8           MOV DPTR | #0x80f8
CODE:25ce: e0                 MOVX A | @DPTR
CODE:25cf: 04                 INC A
CODE:25d0: f0                 MOVX @DPTR | A
CODE:25d1: 70 06              JNZ 0x25d9
CODE:25d3: 90 80 f7           MOV DPTR | #0x80f7
CODE:25d6: e0                 MOVX A | @DPTR
CODE:25d7: 04                 INC A
CODE:25d8: f0                 MOVX @DPTR | A

; ===== thunk_FUN_CODE_260e =====
CODE:25d9: 80 33              SJMP 0x260e

; ===== FUN_CODE_25db =====
CODE:25db: 90 81 08           MOV DPTR | #0x8108
CODE:25de: e0                 MOVX A | @DPTR
CODE:25df: 70 04              JNZ 0x25e5
CODE:25e1: a3                 INC DPTR
CODE:25e2: e0                 MOVX A | @DPTR
CODE:25e3: 64 04              XRL A | #0x4

; ===== FUN_CODE_25e5 =====
CODE:25e5: 70 27              JNZ 0x260e
CODE:25e7: 30 19 24           JNB 0x19 | 0x260e
CODE:25ea: 90 81 bb           MOV DPTR | #0x81bb
CODE:25ed: e0                 MOVX A | @DPTR
CODE:25ee: 04                 INC A
CODE:25ef: f0                 MOVX @DPTR | A
CODE:25f0: 70 06              JNZ 0x25f8
CODE:25f2: 90 81 ba           MOV DPTR | #0x81ba
CODE:25f5: e0                 MOVX A | @DPTR
CODE:25f6: 04                 INC A
CODE:25f7: f0                 MOVX @DPTR | A

; ===== FUN_CODE_25f8 =====
CODE:25f8: 90 81 ba           MOV DPTR | #0x81ba
CODE:25fb: e0                 MOVX A | @DPTR
CODE:25fc: b4 ff 0f           CJNE A | #0xff | 0x260e
CODE:25ff: a3                 INC DPTR
CODE:2600: e0                 MOVX A | @DPTR
CODE:2601: b4 ff 0a           CJNE A | #0xff | 0x260e
CODE:2604: 90 81 bc           MOV DPTR | #0x81bc
CODE:2607: 12 44 56           LCALL 0x4456

; ===== FUN_CODE_260e =====
CODE:260e: d0 d0              POP PSW
CODE:2610: d0 82              POP DPL
CODE:2612: d0 83              POP DPH
CODE:2614: d0 f0              POP B
CODE:2616: d0 e0              POP A
CODE:2618: 32                 RETI 

; ===== FUN_CODE_2619 =====
CODE:2619: c0 e0              PUSH A
CODE:261b: c0 83              PUSH DPH
CODE:261d: c0 82              PUSH DPL
CODE:261f: c0 d0              PUSH PSW
CODE:2621: 75 d0 10           MOV PSW | #0x10
CODE:2624: e4                 CLR A
CODE:2625: ff                 MOV R7 | A
CODE:2626: fe                 MOV R6 | A
CODE:2627: 90 81 08           MOV DPTR | #0x8108
CODE:262a: e0                 MOVX A | @DPTR
CODE:262b: fc                 MOV R4 | A
CODE:262c: a3                 INC DPTR
CODE:262d: e0                 MOVX A | @DPTR
CODE:262e: fd                 MOV R5 | A
CODE:262f: ec                 MOV A | R4
CODE:2630: 60 03              JZ 0x2635
CODE:2632: 02 26 d5           LJMP 0x26d5

; ===== FUN_CODE_2635 =====
CODE:2635: ed                 MOV A | R5
CODE:2636: 24 fe              ADD A | #0xfe
CODE:2638: 60 5b              JZ 0x2695
CODE:263a: 14                 DEC A
CODE:263b: 60 58              JZ 0x2695
CODE:263d: 14                 DEC A
CODE:263e: 70 03              JNZ 0x2643
CODE:2640: 02 26 d1           LJMP 0x26d1

; ===== FUN_CODE_2643 =====
CODE:2643: 24 fb              ADD A | #0xfb
CODE:2645: 60 4e              JZ 0x2695
CODE:2647: 14                 DEC A
CODE:2648: 60 4b              JZ 0x2695
CODE:264a: 24 09              ADD A | #0x9
CODE:264c: 60 03              JZ 0x2651
CODE:264e: 02 26 d5           LJMP 0x26d5

; ===== FUN_CODE_2651 =====
CODE:2651: c2 aa              CLR 0xaa

; ===== FUN_CODE_2653 =====
CODE:2653: c3                 CLR CY
CODE:2654: ef                 MOV A | R7
CODE:2655: 94 10              SUBB A | #0x10
CODE:2657: ee                 MOV A | R6
CODE:2658: 64 80              XRL A | #0x80
CODE:265a: 94 a7              SUBB A | #0xa7
CODE:265c: 50 07              JNC 0x2665
CODE:265e: 0f                 INC R7
CODE:265f: bf 00 01           CJNE R7 | #0x0 | 0x2663
CODE:2662: 0e                 INC R6

; ===== FUN_CODE_2663 =====
CODE:2663: 80 ee              SJMP 0x2653

; ===== FUN_CODE_2665 =====
CODE:2665: 90 80 5f           MOV DPTR | #0x805f
CODE:2668: e0                 MOVX A | @DPTR
CODE:2669: 54 fb              ANL A | #0xfb
CODE:266b: f0                 MOVX @DPTR | A
CODE:266c: 90 5f 00           MOV DPTR | #0x5f00
CODE:266f: f0                 MOVX @DPTR | A
CODE:2670: 90 80 69           MOV DPTR | #0x8069
CODE:2673: e0                 MOVX A | @DPTR
CODE:2674: 54 dd              ANL A | #0xdd
CODE:2676: f0                 MOVX @DPTR | A
CODE:2677: 90 3f 80           MOV DPTR | #0x3f80
CODE:267a: f0                 MOVX @DPTR | A
CODE:267b: 90 80 54           MOV DPTR | #0x8054
CODE:267e: e0                 MOVX A | @DPTR
CODE:267f: 54 fe              ANL A | #0xfe
CODE:2681: f0                 MOVX @DPTR | A
CODE:2682: 90 7d 02           MOV DPTR | #0x7d02
CODE:2685: f0                 MOVX @DPTR | A
CODE:2686: 90 80 4f           MOV DPTR | #0x804f
CODE:2689: e0                 MOVX A | @DPTR
CODE:268a: 44 10              ORL A | #0x10
CODE:268c: f0                 MOVX @DPTR | A
CODE:268d: 90 7d 01           MOV DPTR | #0x7d01
CODE:2690: f0                 MOVX @DPTR | A
CODE:2691: d2 0d              SETB 0x0d
CODE:2693: 80 40              SJMP 0x26d5

; ===== FUN_CODE_2695 =====
CODE:2695: c2 aa              CLR 0xaa

; ===== FUN_CODE_2697 =====
CODE:2697: c3                 CLR CY
CODE:2698: ef                 MOV A | R7
CODE:2699: 94 10              SUBB A | #0x10
CODE:269b: ee                 MOV A | R6
CODE:269c: 64 80              XRL A | #0x80
CODE:269e: 94 a7              SUBB A | #0xa7
CODE:26a0: 50 07              JNC 0x26a9
CODE:26a2: 0f                 INC R7
CODE:26a3: bf 00 01           CJNE R7 | #0x0 | 0x26a7
CODE:26a6: 0e                 INC R6

; ===== FUN_CODE_26a7 =====
CODE:26a7: 80 ee              SJMP 0x2697

; ===== FUN_CODE_26a9 =====
CODE:26a9: 90 80 5f           MOV DPTR | #0x805f
CODE:26ac: e0                 MOVX A | @DPTR
CODE:26ad: 54 fb              ANL A | #0xfb
CODE:26af: f0                 MOVX @DPTR | A
CODE:26b0: 90 5f 00           MOV DPTR | #0x5f00
CODE:26b3: f0                 MOVX @DPTR | A
CODE:26b4: 90 80 69           MOV DPTR | #0x8069
CODE:26b7: e0                 MOVX A | @DPTR
CODE:26b8: 54 dd              ANL A | #0xdd
CODE:26ba: f0                 MOVX @DPTR | A
CODE:26bb: 90 3f 80           MOV DPTR | #0x3f80
CODE:26be: f0                 MOVX @DPTR | A
CODE:26bf: 90 80 4d           MOV DPTR | #0x804d
CODE:26c2: e0                 MOVX A | @DPTR
CODE:26c3: 54 c0              ANL A | #0xc0
CODE:26c5: f0                 MOVX @DPTR | A
CODE:26c6: 44 40              ORL A | #0x40
CODE:26c8: f0                 MOVX @DPTR | A
CODE:26c9: 90 7b 01           MOV DPTR | #0x7b01
CODE:26cc: f0                 MOVX @DPTR | A
CODE:26cd: d2 0d              SETB 0x0d
CODE:26cf: 80 04              SJMP 0x26d5

; ===== FUN_CODE_26d1 =====
CODE:26d1: d2 8c              SETB 0x8c
CODE:26d3: d2 0d              SETB 0x0d

; ===== FUN_CODE_26d5 =====
CODE:26d5: d0 d0              POP PSW
CODE:26d7: d0 82              POP DPL
CODE:26d9: d0 83              POP DPH
CODE:26db: d0 e0              POP A
CODE:26dd: 32                 RETI 

; ===== FUN_CODE_26de =====
CODE:26de: c0 e0              PUSH A
CODE:26e0: c0 f0              PUSH B
CODE:26e2: c0 83              PUSH DPH
CODE:26e4: c0 82              PUSH DPL
CODE:26e6: c0 d0              PUSH PSW
CODE:26e8: 75 d0 10           MOV PSW | #0x10
CODE:26eb: 20 99 03           JB 0x99 | 0x26f1
CODE:26ee: 02 27 fa           LJMP 0x27fa

; ===== FUN_CODE_26f1 =====
CODE:26f1: 30 35 08           JNB 0x35 | 0x26fc
CODE:26f4: 75 99 13           MOV 0x99 | #0x13
CODE:26f7: c2 35              CLR 0x35
CODE:26f9: 02 27 f5           LJMP 0x27f5

; ===== FUN_CODE_26fc =====
CODE:26fc: 30 36 08           JNB 0x36 | 0x2707
CODE:26ff: 75 99 11           MOV 0x99 | #0x11
CODE:2702: c2 36              CLR 0x36
CODE:2704: 02 27 f5           LJMP 0x27f5

; ===== FUN_CODE_2707 =====
CODE:2707: 30 34 03           JNB 0x34 | 0x270d
CODE:270a: 02 27 e0           LJMP 0x27e0

; ===== FUN_CODE_270d =====
CODE:270d: 30 38 03           JNB 0x38 | 0x2713
CODE:2710: 02 27 e0           LJMP 0x27e0

; ===== FUN_CODE_2713 =====
CODE:2713: 90 81 4a           MOV DPTR | #0x814a
CODE:2716: e4                 CLR A
CODE:2717: 75 f0 01           MOV B | #0x1
CODE:271a: 12 42 0f           LCALL 0x420f
CODE:271d: 90 81 7c           MOV DPTR | #0x817c
CODE:2720: e0                 MOVX A | @DPTR
CODE:2721: 70 02              JNZ 0x2725
CODE:2723: a3                 INC DPTR
CODE:2724: e0                 MOVX A | @DPTR

; ===== FUN_CODE_2725 =====
CODE:2725: 60 0e              JZ 0x2735
CODE:2727: 90 81 7d           MOV DPTR | #0x817d
CODE:272a: e0                 MOVX A | @DPTR
CODE:272b: 24 ff              ADD A | #0xff
CODE:272d: f0                 MOVX @DPTR | A
CODE:272e: 90 81 7c           MOV DPTR | #0x817c
CODE:2731: e0                 MOVX A | @DPTR
CODE:2732: 34 ff              ADDC A | #0xff
CODE:2734: f0                 MOVX @DPTR | A

; ===== FUN_CODE_2735 =====
CODE:2735: 90 81 49           MOV DPTR | #0x8149
CODE:2738: e0                 MOVX A | @DPTR
CODE:2739: fb                 MOV R3 | A
CODE:273a: a3                 INC DPTR
CODE:273b: e0                 MOVX A | @DPTR
CODE:273c: fa                 MOV R2 | A
CODE:273d: a3                 INC DPTR
CODE:273e: e0                 MOVX A | @DPTR
CODE:273f: f9                 MOV R1 | A
CODE:2740: 12 40 f6           LCALL 0x40f6
CODE:2743: ff                 MOV R7 | A
CODE:2744: 70 2c              JNZ 0x2772
CODE:2746: 30 32 29           JNB 0x32 | 0x2772
CODE:2749: 90 ff ff           MOV DPTR | #0xffff
CODE:274c: 12 41 0f           LCALL 0x410f
CODE:274f: fe                 MOV R6 | A
CODE:2750: 64 0d              XRL A | #0xd
CODE:2752: 60 1e              JZ 0x2772
CODE:2754: ee                 MOV A | R6
CODE:2755: 64 0a              XRL A | #0xa
CODE:2757: 60 19              JZ 0x2772
CODE:2759: 74 0d              MOV A | #0xd
CODE:275b: 12 41 3c           LCALL 0x413c
CODE:275e: 90 81 49           MOV DPTR | #0x8149
CODE:2761: e0                 MOVX A | @DPTR
CODE:2762: fb                 MOV R3 | A
CODE:2763: a3                 INC DPTR
CODE:2764: e0                 MOVX A | @DPTR
CODE:2765: fa                 MOV R2 | A
CODE:2766: a3                 INC DPTR
CODE:2767: e0                 MOVX A | @DPTR
CODE:2768: f9                 MOV R1 | A
CODE:2769: 90 00 01           MOV DPTR | #0x1
CODE:276c: e4                 CLR A
CODE:276d: 12 41 4e           LCALL 0x414e
CODE:2770: 80 33              SJMP 0x27a5

; ===== FUN_CODE_2772 =====
CODE:2772: ef                 MOV A | R7
CODE:2773: 70 30              JNZ 0x27a5
CODE:2775: 30 32 2d           JNB 0x32 | 0x27a5
CODE:2778: 90 81 49           MOV DPTR | #0x8149
CODE:277b: e0                 MOVX A | @DPTR
CODE:277c: fb                 MOV R3 | A
CODE:277d: a3                 INC DPTR
CODE:277e: e0                 MOVX A | @DPTR
CODE:277f: fa                 MOV R2 | A
CODE:2780: a3                 INC DPTR
CODE:2781: e0                 MOVX A | @DPTR
CODE:2782: f9                 MOV R1 | A
CODE:2783: 90 ff ff           MOV DPTR | #0xffff
CODE:2786: 12 41 0f           LCALL 0x410f
CODE:2789: b4 0d 19           CJNE A | #0xd | 0x27a5
CODE:278c: 74 0a              MOV A | #0xa
CODE:278e: 12 41 3c           LCALL 0x413c
CODE:2791: 90 81 49           MOV DPTR | #0x8149
CODE:2794: e0                 MOVX A | @DPTR
CODE:2795: fb                 MOV R3 | A
CODE:2796: a3                 INC DPTR
CODE:2797: e0                 MOVX A | @DPTR
CODE:2798: fa                 MOV R2 | A
CODE:2799: a3                 INC DPTR
CODE:279a: e0                 MOVX A | @DPTR
CODE:279b: f9                 MOV R1 | A
CODE:279c: 90 00 01           MOV DPTR | #0x1
CODE:279f: e4                 CLR A
CODE:27a0: 12 41 4e           LCALL 0x414e
CODE:27a3: d2 38              SETB 0x38

; ===== FUN_CODE_27a5 =====
CODE:27a5: 90 81 49           MOV DPTR | #0x8149
CODE:27a8: e0                 MOVX A | @DPTR
CODE:27a9: fb                 MOV R3 | A
CODE:27aa: a3                 INC DPTR
CODE:27ab: e0                 MOVX A | @DPTR
CODE:27ac: fa                 MOV R2 | A
CODE:27ad: a3                 INC DPTR
CODE:27ae: e0                 MOVX A | @DPTR
CODE:27af: f9                 MOV R1 | A
CODE:27b0: 12 40 f6           LCALL 0x40f6
CODE:27b3: ff                 MOV R7 | A
CODE:27b4: 60 07              JZ 0x27bd
CODE:27b6: 30 32 04           JNB 0x32 | 0x27bd
CODE:27b9: f5 99              MOV 0x99 | A
CODE:27bb: 80 38              SJMP 0x27f5

; ===== FUN_CODE_27bd =====
CODE:27bd: 20 32 0e           JB 0x32 | 0x27ce
CODE:27c0: 90 81 7c           MOV DPTR | #0x817c
CODE:27c3: e0                 MOVX A | @DPTR
CODE:27c4: 70 02              JNZ 0x27c8
CODE:27c6: a3                 INC DPTR
CODE:27c7: e0                 MOVX A | @DPTR

; ===== FUN_CODE_27c8 =====
CODE:27c8: 60 04              JZ 0x27ce
CODE:27ca: 8f 99              MOV 0x99 | R7
CODE:27cc: 80 27              SJMP 0x27f5

; ===== FUN_CODE_27ce =====
CODE:27ce: c2 31              CLR 0x31
CODE:27d0: 90 81 49           MOV DPTR | #0x8149
CODE:27d3: 74 01              MOV A | #0x1
CODE:27d5: f0                 MOVX @DPTR | A
CODE:27d6: a3                 INC DPTR
CODE:27d7: 74 82              MOV A | #0x82
CODE:27d9: f0                 MOVX @DPTR | A
CODE:27da: a3                 INC DPTR
CODE:27db: 74 39              MOV A | #0x39
CODE:27dd: f0                 MOVX @DPTR | A
CODE:27de: 80 15              SJMP 0x27f5

; ===== FUN_CODE_27e0 =====
CODE:27e0: 20 34 12           JB 0x34 | 0x27f5
CODE:27e3: c2 38              CLR 0x38
CODE:27e5: 90 81 49           MOV DPTR | #0x8149
CODE:27e8: 74 01              MOV A | #0x1
CODE:27ea: f0                 MOVX @DPTR | A
CODE:27eb: a3                 INC DPTR
CODE:27ec: 74 82              MOV A | #0x82
CODE:27ee: f0                 MOVX @DPTR | A
CODE:27ef: a3                 INC DPTR
CODE:27f0: 74 39              MOV A | #0x39
CODE:27f2: f0                 MOVX @DPTR | A
CODE:27f3: c2 31              CLR 0x31

; ===== FUN_CODE_27f5 =====
CODE:27f5: c2 99              CLR 0x99
CODE:27f7: 02 29 ff           LJMP 0x29ff

; ===== FUN_CODE_27fa =====
CODE:27fa: 20 98 03           JB 0x98 | 0x2800
CODE:27fd: 02 29 ff           LJMP 0x29ff

; ===== FUN_CODE_2800 =====
CODE:2800: 78 1d              MOV R0 | #0x1d
CODE:2802: a6 99              MOV @R0 | 0x99
CODE:2804: e6                 MOV A | @R0
CODE:2805: ff                 MOV R7 | A
CODE:2806: 64 2c              XRL A | #0x2c
CODE:2808: 60 20              JZ 0x282a
CODE:280a: ef                 MOV A | R7
CODE:280b: 64 3b              XRL A | #0x3b
CODE:280d: 60 1b              JZ 0x282a
CODE:280f: ef                 MOV A | R7
CODE:2810: 64 0d              XRL A | #0xd
CODE:2812: 60 16              JZ 0x282a
CODE:2814: ef                 MOV A | R7
CODE:2815: 64 0a              XRL A | #0xa
CODE:2817: 60 11              JZ 0x282a
CODE:2819: ef                 MOV A | R7
CODE:281a: 64 0f              XRL A | #0xf
CODE:281c: 60 0c              JZ 0x282a
CODE:281e: ef                 MOV A | R7
CODE:281f: 64 12              XRL A | #0x12
CODE:2821: 60 07              JZ 0x282a
CODE:2823: 12 50 ce           LCALL 0x50ce
CODE:2826: 78 1d              MOV R0 | #0x1d
CODE:2828: a6 17              MOV @R0 | 0x17

; ===== FUN_CODE_282a =====
CODE:282a: 78 1d              MOV R0 | #0x1d
CODE:282c: e6                 MOV A | @R0
CODE:282d: f9                 MOV R1 | A
CODE:282e: 64 0a              XRL A | #0xa
CODE:2830: 60 04              JZ 0x2836
CODE:2832: d2 30              SETB 0x30
CODE:2834: c2 2f              CLR 0x2f

; ===== FUN_CODE_2836 =====
CODE:2836: e4                 CLR A
CODE:2837: 90 80 00           MOV DPTR | #0x8000
CODE:283a: f0                 MOVX @DPTR | A
CODE:283b: a3                 INC DPTR
CODE:283c: f0                 MOVX @DPTR | A
CODE:283d: e9                 MOV A | R1
CODE:283e: 64 0a              XRL A | #0xa
CODE:2840: 60 02              JZ 0x2844
CODE:2842: d2 28              SETB 0x28

; ===== FUN_CODE_2844 =====
CODE:2844: e9                 MOV A | R1
CODE:2845: 64 2c              XRL A | #0x2c
CODE:2847: 60 14              JZ 0x285d
CODE:2849: e9                 MOV A | R1
CODE:284a: 64 3b              XRL A | #0x3b
CODE:284c: 60 0f              JZ 0x285d
CODE:284e: e9                 MOV A | R1
CODE:284f: 64 0d              XRL A | #0xd
CODE:2851: 60 0a              JZ 0x285d
CODE:2853: e9                 MOV A | R1
CODE:2854: 64 0f              XRL A | #0xf
CODE:2856: 60 05              JZ 0x285d
CODE:2858: e9                 MOV A | R1
CODE:2859: 64 12              XRL A | #0x12
CODE:285b: 70 73              JNZ 0x28d0

; ===== FUN_CODE_285d =====
CODE:285d: d2 2d              SETB 0x2d
CODE:285f: e9                 MOV A | R1
CODE:2860: b4 12 0f           CJNE A | #0x12 | 0x2872
CODE:2863: 74 ff              MOV A | #0xff
CODE:2865: 90 80 00           MOV DPTR | #0x8000
CODE:2868: f0                 MOVX @DPTR | A
CODE:2869: a3                 INC DPTR
CODE:286a: f0                 MOVX @DPTR | A
CODE:286b: c2 28              CLR 0x28
CODE:286d: c2 2d              CLR 0x2d
CODE:286f: 02 29 05           LJMP 0x2905

; ===== FUN_CODE_2872 =====
CODE:2872: 78 1d              MOV R0 | #0x1d
CODE:2874: e6                 MOV A | @R0
CODE:2875: ff                 MOV R7 | A
CODE:2876: b4 0f 0e           CJNE A | #0xf | 0x2887
CODE:2879: e4                 CLR A
CODE:287a: 90 80 00           MOV DPTR | #0x8000
CODE:287d: f0                 MOVX @DPTR | A
CODE:287e: a3                 INC DPTR
CODE:287f: f0                 MOVX @DPTR | A
CODE:2880: c2 28              CLR 0x28
CODE:2882: c2 2d              CLR 0x2d
CODE:2884: 02 29 05           LJMP 0x2905

; ===== FUN_CODE_2887 =====
CODE:2887: ef                 MOV A | R7
CODE:2888: 64 0d              XRL A | #0xd
CODE:288a: 60 09              JZ 0x2895
CODE:288c: ef                 MOV A | R7
CODE:288d: 64 2c              XRL A | #0x2c
CODE:288f: 60 04              JZ 0x2895
CODE:2891: ef                 MOV A | R7
CODE:2892: b4 3b 09           CJNE A | #0x3b | 0x289e

; ===== FUN_CODE_2895 =====
CODE:2895: 20 29 06           JB 0x29 | 0x289e
CODE:2898: c2 28              CLR 0x28
CODE:289a: c2 2d              CLR 0x2d
CODE:289c: 80 67              SJMP 0x2905

; ===== FUN_CODE_289e =====
CODE:289e: ef                 MOV A | R7
CODE:289f: 64 0d              XRL A | #0xd
CODE:28a1: 60 0a              JZ 0x28ad
CODE:28a3: ef                 MOV A | R7
CODE:28a4: 64 2c              XRL A | #0x2c
CODE:28a6: 60 05              JZ 0x28ad
CODE:28a8: ef                 MOV A | R7
CODE:28a9: 64 3b              XRL A | #0x3b
CODE:28ab: 70 58              JNZ 0x2905

; ===== FUN_CODE_28ad =====
CODE:28ad: 30 29 55           JNB 0x29 | 0x2905
CODE:28b0: c2 29              CLR 0x29
CODE:28b2: 90 81 05           MOV DPTR | #0x8105
CODE:28b5: e0                 MOVX A | @DPTR
CODE:28b6: fb                 MOV R3 | A
CODE:28b7: a3                 INC DPTR
CODE:28b8: e0                 MOVX A | @DPTR
CODE:28b9: fa                 MOV R2 | A
CODE:28ba: a3                 INC DPTR
CODE:28bb: e0                 MOVX A | @DPTR
CODE:28bc: f9                 MOV R1 | A
CODE:28bd: 74 2c              MOV A | #0x2c
CODE:28bf: 12 41 3c           LCALL 0x413c
CODE:28c2: 90 81 06           MOV DPTR | #0x8106
CODE:28c5: e4                 CLR A
CODE:28c6: 75 f0 01           MOV B | #0x1
CODE:28c9: 12 42 0f           LCALL 0x420f
CODE:28cc: d2 33              SETB 0x33
CODE:28ce: 80 35              SJMP 0x2905

; ===== FUN_CODE_28d0 =====
CODE:28d0: 78 1d              MOV R0 | #0x1d
CODE:28d2: e6                 MOV A | @R0
CODE:28d3: ff                 MOV R7 | A
CODE:28d4: b4 13 04           CJNE A | #0x13 | 0x28db
CODE:28d7: d2 34              SETB 0x34
CODE:28d9: 80 2a              SJMP 0x2905

; ===== FUN_CODE_28db =====
CODE:28db: ef                 MOV A | R7
CODE:28dc: b4 11 06           CJNE A | #0x11 | 0x28e5
CODE:28df: c2 34              CLR 0x34
CODE:28e1: d2 99              SETB 0x99
CODE:28e3: 80 20              SJMP 0x2905

; ===== FUN_CODE_28e5 =====
CODE:28e5: ef                 MOV A | R7
CODE:28e6: 64 0a              XRL A | #0xa
CODE:28e8: 60 1b              JZ 0x2905
CODE:28ea: 90 81 05           MOV DPTR | #0x8105
CODE:28ed: e0                 MOVX A | @DPTR
CODE:28ee: fb                 MOV R3 | A
CODE:28ef: a3                 INC DPTR
CODE:28f0: e0                 MOVX A | @DPTR
CODE:28f1: fa                 MOV R2 | A
CODE:28f2: a3                 INC DPTR
CODE:28f3: e0                 MOVX A | @DPTR
CODE:28f4: f9                 MOV R1 | A
CODE:28f5: ef                 MOV A | R7
CODE:28f6: 12 41 3c           LCALL 0x413c
CODE:28f9: 90 81 06           MOV DPTR | #0x8106
CODE:28fc: e4                 CLR A
CODE:28fd: 75 f0 01           MOV B | #0x1
CODE:2900: 12 42 0f           LCALL 0x420f
CODE:2903: d2 29              SETB 0x29

; ===== FUN_CODE_2905 =====
CODE:2905: 90 81 05           MOV DPTR | #0x8105
CODE:2908: e0                 MOVX A | @DPTR
CODE:2909: a3                 INC DPTR
CODE:290a: e0                 MOVX A | @DPTR
CODE:290b: fa                 MOV R2 | A
CODE:290c: a3                 INC DPTR
CODE:290d: e0                 MOVX A | @DPTR
CODE:290e: c3                 CLR CY
CODE:290f: 75 83 82           MOV DPH | #0x82
CODE:2912: 75 82 39           MOV DPL | #0x39
CODE:2915: 95 82              SUBB A | DPL
CODE:2917: ea                 MOV A | R2
CODE:2918: 95 83              SUBB A | DPH
CODE:291a: 40 0e              JC 0x292a
CODE:291c: 90 81 05           MOV DPTR | #0x8105
CODE:291f: 74 01              MOV A | #0x1
CODE:2921: f0                 MOVX @DPTR | A
CODE:2922: a3                 INC DPTR
CODE:2923: 74 81              MOV A | #0x81
CODE:2925: f0                 MOVX @DPTR | A
CODE:2926: a3                 INC DPTR
CODE:2927: 74 f9              MOV A | #0xf9
CODE:2929: f0                 MOVX @DPTR | A

; ===== FUN_CODE_292a =====
CODE:292a: 90 81 0a           MOV DPTR | #0x810a
CODE:292d: e0                 MOVX A | @DPTR
CODE:292e: fb                 MOV R3 | A
CODE:292f: a3                 INC DPTR
CODE:2930: e0                 MOVX A | @DPTR
CODE:2931: fa                 MOV R2 | A
CODE:2932: a3                 INC DPTR
CODE:2933: e0                 MOVX A | @DPTR
CODE:2934: f9                 MOV R1 | A
CODE:2935: c0 13              PUSH 0x13
CODE:2937: c0 12              PUSH 0x12
CODE:2939: c0 11              PUSH 0x11
CODE:293b: 90 81 05           MOV DPTR | #0x8105
CODE:293e: e0                 MOVX A | @DPTR
CODE:293f: a3                 INC DPTR
CODE:2940: e0                 MOVX A | @DPTR
CODE:2941: fa                 MOV R2 | A
CODE:2942: a3                 INC DPTR
CODE:2943: e0                 MOVX A | @DPTR
CODE:2944: f9                 MOV R1 | A
CODE:2945: c3                 CLR CY
CODE:2946: d0 82              POP DPL
CODE:2948: d0 83              POP DPH
CODE:294a: d0 e0              POP A
CODE:294c: e9                 MOV A | R1
CODE:294d: 95 82              SUBB A | DPL
CODE:294f: ea                 MOV A | R2
CODE:2950: 95 83              SUBB A | DPH
CODE:2952: 40 49              JC 0x299d
CODE:2954: 90 81 0a           MOV DPTR | #0x810a
CODE:2957: e0                 MOVX A | @DPTR
CODE:2958: a3                 INC DPTR
CODE:2959: e0                 MOVX A | @DPTR
CODE:295a: fa                 MOV R2 | A
CODE:295b: a3                 INC DPTR
CODE:295c: e0                 MOVX A | @DPTR
CODE:295d: c3                 CLR CY
CODE:295e: 94 f9              SUBB A | #0xf9
CODE:2960: ff                 MOV R7 | A
CODE:2961: ea                 MOV A | R2
CODE:2962: 94 81              SUBB A | #0x81
CODE:2964: fe                 MOV R6 | A
CODE:2965: 90 81 05           MOV DPTR | #0x8105
CODE:2968: e0                 MOVX A | @DPTR
CODE:2969: a3                 INC DPTR
CODE:296a: e0                 MOVX A | @DPTR
CODE:296b: fa                 MOV R2 | A
CODE:296c: a3                 INC DPTR
CODE:296d: e0                 MOVX A | @DPTR
CODE:296e: ac 12              MOV R4 | 0x12
CODE:2970: fd                 MOV R5 | A
CODE:2971: c3                 CLR CY
CODE:2972: 74 39              MOV A | #0x39
CODE:2974: 9d                 SUBB A | R5
CODE:2975: fd                 MOV R5 | A
CODE:2976: 74 82              MOV A | #0x82
CODE:2978: 9c                 SUBB A | R4
CODE:2979: cd                 XCH A | R5
CODE:297a: 2f                 ADD A | R7
CODE:297b: ff                 MOV R7 | A
CODE:297c: ed                 MOV A | R5
CODE:297d: 3e                 ADDC A | R6
CODE:297e: fe                 MOV R6 | A
CODE:297f: c3                 CLR CY
CODE:2980: ef                 MOV A | R7
CODE:2981: 94 0a              SUBB A | #0xa
CODE:2983: ee                 MOV A | R6
CODE:2984: 64 80              XRL A | #0x80
CODE:2986: 94 80              SUBB A | #0x80
CODE:2988: 50 08              JNC 0x2992
CODE:298a: d2 35              SETB 0x35
CODE:298c: d2 37              SETB 0x37
CODE:298e: d2 99              SETB 0x99
CODE:2990: 80 6b              SJMP 0x29fd

; ===== FUN_CODE_2992 =====
CODE:2992: 30 37 68           JNB 0x37 | 0x29fd
CODE:2995: d2 36              SETB 0x36
CODE:2997: c2 37              CLR 0x37
CODE:2999: d2 99              SETB 0x99
CODE:299b: 80 60              SJMP 0x29fd

; ===== FUN_CODE_299d =====
CODE:299d: 90 81 0a           MOV DPTR | #0x810a
CODE:29a0: e0                 MOVX A | @DPTR
CODE:29a1: fb                 MOV R3 | A
CODE:29a2: a3                 INC DPTR
CODE:29a3: e0                 MOVX A | @DPTR
CODE:29a4: fa                 MOV R2 | A
CODE:29a5: a3                 INC DPTR
CODE:29a6: e0                 MOVX A | @DPTR
CODE:29a7: f9                 MOV R1 | A
CODE:29a8: c0 13              PUSH 0x13
CODE:29aa: c0 12              PUSH 0x12
CODE:29ac: c0 11              PUSH 0x11
CODE:29ae: 90 81 05           MOV DPTR | #0x8105
CODE:29b1: e0                 MOVX A | @DPTR
CODE:29b2: a3                 INC DPTR
CODE:29b3: e0                 MOVX A | @DPTR
CODE:29b4: fa                 MOV R2 | A
CODE:29b5: a3                 INC DPTR
CODE:29b6: e0                 MOVX A | @DPTR
CODE:29b7: f9                 MOV R1 | A
CODE:29b8: c3                 CLR CY
CODE:29b9: d0 82              POP DPL
CODE:29bb: d0 83              POP DPH
CODE:29bd: d0 e0              POP A
CODE:29bf: e9                 MOV A | R1
CODE:29c0: 95 82              SUBB A | DPL
CODE:29c2: ea                 MOV A | R2
CODE:29c3: 95 83              SUBB A | DPH
CODE:29c5: 50 36              JNC 0x29fd
CODE:29c7: 90 81 05           MOV DPTR | #0x8105
CODE:29ca: e0                 MOVX A | @DPTR
CODE:29cb: a3                 INC DPTR
CODE:29cc: e0                 MOVX A | @DPTR
CODE:29cd: a3                 INC DPTR
CODE:29ce: e0                 MOVX A | @DPTR
CODE:29cf: ae 12              MOV R6 | 0x12
CODE:29d1: ff                 MOV R7 | A
CODE:29d2: 90 81 0a           MOV DPTR | #0x810a
CODE:29d5: e0                 MOVX A | @DPTR
CODE:29d6: a3                 INC DPTR
CODE:29d7: e0                 MOVX A | @DPTR
CODE:29d8: fa                 MOV R2 | A
CODE:29d9: a3                 INC DPTR
CODE:29da: e0                 MOVX A | @DPTR
CODE:29db: c3                 CLR CY
CODE:29dc: 9f                 SUBB A | R7
CODE:29dd: ff                 MOV R7 | A
CODE:29de: ea                 MOV A | R2
CODE:29df: 9e                 SUBB A | R6
CODE:29e0: fe                 MOV R6 | A
CODE:29e1: c3                 CLR CY
CODE:29e2: ef                 MOV A | R7
CODE:29e3: 94 0a              SUBB A | #0xa
CODE:29e5: ee                 MOV A | R6
CODE:29e6: 64 80              XRL A | #0x80
CODE:29e8: 94 80              SUBB A | #0x80
CODE:29ea: 50 08              JNC 0x29f4
CODE:29ec: d2 35              SETB 0x35
CODE:29ee: d2 37              SETB 0x37
CODE:29f0: d2 99              SETB 0x99
CODE:29f2: 80 09              SJMP 0x29fd

; ===== FUN_CODE_29f4 =====
CODE:29f4: 30 37 06           JNB 0x37 | 0x29fd
CODE:29f7: d2 36              SETB 0x36
CODE:29f9: c2 37              CLR 0x37
CODE:29fb: d2 99              SETB 0x99

; ===== FUN_CODE_29fd =====
CODE:29fd: c2 98              CLR 0x98

; ===== FUN_CODE_29ff =====
CODE:29ff: d0 d0              POP PSW
CODE:2a01: d0 82              POP DPL
CODE:2a03: d0 83              POP DPH
CODE:2a05: d0 f0              POP B
CODE:2a07: d0 e0              POP A
CODE:2a09: 32                 RETI 

; ===== FUN_CODE_2a0a =====
CODE:2a0a: e4                 CLR A
CODE:2a0b: 90 80 5f           MOV DPTR | #0x805f
CODE:2a0e: f0                 MOVX @DPTR | A
CODE:2a0f: 90 5f 00           MOV DPTR | #0x5f00
CODE:2a12: f0                 MOVX @DPTR | A
CODE:2a13: 90 80 69           MOV DPTR | #0x8069
CODE:2a16: 74 81              MOV A | #0x81
CODE:2a18: f0                 MOVX @DPTR | A
CODE:2a19: 90 3f 80           MOV DPTR | #0x3f80
CODE:2a1c: f0                 MOVX @DPTR | A
CODE:2a1d: d3                 SETB CY
CODE:2a1e: ef                 MOV A | R7
CODE:2a1f: 64 80              XRL A | #0x80
CODE:2a21: 94 90              SUBB A | #0x90
CODE:2a23: 50 7a              JNC 0x2a9f
CODE:2a25: 90 80 5c           MOV DPTR | #0x805c
CODE:2a28: e0                 MOVX A | @DPTR
CODE:2a29: 54 f0              ANL A | #0xf0
CODE:2a2b: fe                 MOV R6 | A
CODE:2a2c: f0                 MOVX @DPTR | A
CODE:2a2d: ef                 MOV A | R7
CODE:2a2e: 14                 DEC A
CODE:2a2f: 4e                 ORL A | R6
CODE:2a30: f0                 MOVX @DPTR | A
CODE:2a31: 90 7e 02           MOV DPTR | #0x7e02
CODE:2a34: f0                 MOVX @DPTR | A
CODE:2a35: 90 81 bc           MOV DPTR | #0x81bc
CODE:2a38: 12 44 56           LCALL 0x4456

; ===== FUN_CODE_2a9f =====
CODE:2a9f: e4                 CLR A
CODE:2aa0: 90 8a de           MOV DPTR | #0x8ade
CODE:2aa3: f0                 MOVX @DPTR | A
CODE:2aa4: a3                 INC DPTR
CODE:2aa5: f0                 MOVX @DPTR | A

; ===== FUN_CODE_2aa6 =====
CODE:2aa6: 90 8a de           MOV DPTR | #0x8ade
CODE:2aa9: e0                 MOVX A | @DPTR
CODE:2aaa: fe                 MOV R6 | A
CODE:2aab: a3                 INC DPTR
CODE:2aac: e0                 MOVX A | @DPTR
CODE:2aad: ff                 MOV R7 | A
CODE:2aae: 22                 RET 

; ===== <no_function> =====
CODE:2c23: 00                 NOP 
CODE:2c24: 00                 NOP 
CODE:2c25: 00                 NOP 
CODE:2c26: 00                 NOP 

; ===== FUN_CODE_2c27 =====
CODE:2c27: 7f 1e              MOV R7 | #0x1e
CODE:2c29: 7e 00              MOV R6 | #0x0
CODE:2c2b: 7d 00              MOV R5 | #0x0
CODE:2c2d: 7c 00              MOV R4 | #0x0
CODE:2c2f: 90 81 bc           MOV DPTR | #0x81bc
CODE:2c32: e0                 MOVX A | @DPTR
CODE:2c33: f8                 MOV R0 | A
CODE:2c34: a3                 INC DPTR
CODE:2c35: e0                 MOVX A | @DPTR
CODE:2c36: f9                 MOV R1 | A
CODE:2c37: a3                 INC DPTR
CODE:2c38: e0                 MOVX A | @DPTR
CODE:2c39: fa                 MOV R2 | A
CODE:2c3a: a3                 INC DPTR
CODE:2c3b: e0                 MOVX A | @DPTR
CODE:2c3c: fb                 MOV R3 | A
CODE:2c3d: c3                 CLR CY
CODE:2c3e: 12 43 e8           LCALL 0x43e8
CODE:2c41: 40 e4              JC 0x2c27
CODE:2c43: 7f 07              MOV R7 | #0x7
CODE:2c45: 12 2a 0a           LCALL 0x2a0a
CODE:2c48: 90 8a 47           MOV DPTR | #0x8a47
CODE:2c4b: ee                 MOV A | R6
CODE:2c4c: f0                 MOVX @DPTR | A
CODE:2c4d: a3                 INC DPTR
CODE:2c4e: ef                 MOV A | R7
CODE:2c4f: f0                 MOVX @DPTR | A
CODE:2c50: 90 8a 44           MOV DPTR | #0x8a44
CODE:2c53: e0                 MOVX A | @DPTR
CODE:2c54: 24 1b              ADD A | #0x1b
CODE:2c56: fd                 MOV R5 | A
CODE:2c57: 90 8a 43           MOV DPTR | #0x8a43
CODE:2c5a: e0                 MOVX A | @DPTR
CODE:2c5b: 34 00              ADDC A | #0x0
CODE:2c5d: fc                 MOV R4 | A
CODE:2c5e: d3                 SETB CY
CODE:2c5f: ef                 MOV A | R7
CODE:2c60: 9d                 SUBB A | R5
CODE:2c61: ec                 MOV A | R4
CODE:2c62: 64 80              XRL A | #0x80
CODE:2c64: f8                 MOV R0 | A
CODE:2c65: ee                 MOV A | R6
CODE:2c66: 64 80              XRL A | #0x80
CODE:2c68: 98                 SUBB A | R0
CODE:2c69: 40 4c              JC 0x2cb7
CODE:2c6b: 90 81 bc           MOV DPTR | #0x81bc
CODE:2c6e: 12 44 56           LCALL 0x4456

; ===== FUN_CODE_2cb7 =====
CODE:2cb7: 90 80 54           MOV DPTR | #0x8054
CODE:2cba: e0                 MOVX A | @DPTR
CODE:2cbb: 54 fd              ANL A | #0xfd
CODE:2cbd: f0                 MOVX @DPTR | A
CODE:2cbe: 90 7d 02           MOV DPTR | #0x7d02
CODE:2cc1: f0                 MOVX @DPTR | A
CODE:2cc2: 7f 0e              MOV R7 | #0xe
CODE:2cc4: 12 2a 0a           LCALL 0x2a0a
CODE:2cc7: d3                 SETB CY
CODE:2cc8: ef                 MOV A | R7
CODE:2cc9: 94 55              SUBB A | #0x55
CODE:2ccb: ee                 MOV A | R6
CODE:2ccc: 64 80              XRL A | #0x80
CODE:2cce: 94 80              SUBB A | #0x80
CODE:2cd0: 50 10              JNC 0x2ce2
CODE:2cd2: 7f 0f              MOV R7 | #0xf
CODE:2cd4: 12 2a 0a           LCALL 0x2a0a
CODE:2cd7: d3                 SETB CY
CODE:2cd8: ef                 MOV A | R7
CODE:2cd9: 94 aa              SUBB A | #0xaa
CODE:2cdb: ee                 MOV A | R6
CODE:2cdc: 64 80              XRL A | #0x80
CODE:2cde: 94 80              SUBB A | #0x80
CODE:2ce0: 40 05              JC 0x2ce7

; ===== FUN_CODE_2ce2 =====
CODE:2ce2: e4                 CLR A
CODE:2ce3: 90 8a 42           MOV DPTR | #0x8a42
CODE:2ce6: f0                 MOVX @DPTR | A

; ===== FUN_CODE_2ce7 =====
CODE:2ce7: 90 8a 42           MOV DPTR | #0x8a42
CODE:2cea: e0                 MOVX A | @DPTR
CODE:2ceb: ff                 MOV R7 | A
CODE:2cec: 22                 RET 

; ===== FUN_CODE_37f9 =====
CODE:37f9: 78 ff              MOV R0 | #0xff
CODE:37fb: e4                 CLR A

; ===== FUN_CODE_37fc =====
CODE:37fc: f6                 MOV @R0 | A
CODE:37fd: d8 fd              DJNZ R0 | 0x37fc
CODE:37ff: 75 81 28           MOV 0x81 | #0x28
CODE:3802: 02 38 40           LJMP 0x3840

; ===== thunk_FUN_CODE_002b =====
CODE:3805: 02 00 2b           LJMP 0x002b

; ===== FUN_CODE_3808 =====
CODE:3808: e4                 CLR A
CODE:3809: 93                 MOVC A | @A+DPTR
CODE:380a: a3                 INC DPTR
CODE:380b: f8                 MOV R0 | A

; ===== FUN_CODE_380c =====
CODE:380c: e4                 CLR A
CODE:380d: 93                 MOVC A | @A+DPTR
CODE:380e: a3                 INC DPTR
CODE:380f: 40 03              JC 0x3814
CODE:3811: f6                 MOV @R0 | A
CODE:3812: 80 01              SJMP 0x3815

; ===== FUN_CODE_3814 =====
CODE:3814: f2                 MOVX @R0 | A

; ===== FUN_CODE_3815 =====
CODE:3815: 08                 INC R0
CODE:3816: df f4              DJNZ R7 | 0x380c
CODE:3818: 80 29              SJMP 0x3843

; ===== FUN_CODE_381a =====
CODE:381a: e4                 CLR A
CODE:381b: 93                 MOVC A | @A+DPTR
CODE:381c: a3                 INC DPTR
CODE:381d: f8                 MOV R0 | A
CODE:381e: 54 07              ANL A | #0x7
CODE:3820: 24 0c              ADD A | #0xc
CODE:3822: c8                 XCH A | R0
CODE:3823: c3                 CLR CY
CODE:3824: 33                 RLC A
CODE:3825: c4                 SWAP A
CODE:3826: 54 0f              ANL A | #0xf
CODE:3828: 44 20              ORL A | #0x20
CODE:382a: c8                 XCH A | R0
CODE:382b: 83                 MOVC A | @A+PC
CODE:382c: 40 04              JC 0x3832
CODE:382e: f4                 CPL A
CODE:382f: 56                 ANL A | @R0
CODE:3830: 80 01              SJMP 0x3833

; ===== FUN_CODE_3832 =====
CODE:3832: 46                 ORL A | @R0

; ===== FUN_CODE_3833 =====
CODE:3833: f6                 MOV @R0 | A
CODE:3834: df e4              DJNZ R7 | 0x381a
CODE:3836: 80 0b              SJMP 0x3843

; ===== FUN_CODE_3840 =====
CODE:3840: 90 23 4b           MOV DPTR | #0x234b

; ===== FUN_CODE_3843 =====
CODE:3843: e4                 CLR A
CODE:3844: 7e 01              MOV R6 | #0x1
CODE:3846: 93                 MOVC A | @A+DPTR
CODE:3847: 60 bc              JZ 0x3805
CODE:3849: a3                 INC DPTR
CODE:384a: ff                 MOV R7 | A
CODE:384b: 54 3f              ANL A | #0x3f
CODE:384d: 30 e5 09           JNB 0xe5 | 0x3859
CODE:3850: 54 1f              ANL A | #0x1f
CODE:3852: fe                 MOV R6 | A
CODE:3853: e4                 CLR A
CODE:3854: 93                 MOVC A | @A+DPTR
CODE:3855: a3                 INC DPTR
CODE:3856: 60 01              JZ 0x3859
CODE:3858: 0e                 INC R6

; ===== FUN_CODE_3859 =====
CODE:3859: cf                 XCH A | R7
CODE:385a: 54 c0              ANL A | #0xc0
CODE:385c: 25 e0              ADD A | A
CODE:385e: 60 a8              JZ 0x3808
CODE:3860: 40 b8              JC 0x381a
CODE:3862: e4                 CLR A
CODE:3863: 93                 MOVC A | @A+DPTR
CODE:3864: a3                 INC DPTR
CODE:3865: fa                 MOV R2 | A
CODE:3866: e4                 CLR A
CODE:3867: 93                 MOVC A | @A+DPTR
CODE:3868: a3                 INC DPTR
CODE:3869: f8                 MOV R0 | A

; ===== FUN_CODE_386a =====
CODE:386a: e4                 CLR A
CODE:386b: 93                 MOVC A | @A+DPTR
CODE:386c: a3                 INC DPTR
CODE:386d: c8                 XCH A | R0
CODE:386e: c5 82              XCH A | DPL
CODE:3870: c8                 XCH A | R0
CODE:3871: ca                 XCH A | R2
CODE:3872: c5 83              XCH A | DPH
CODE:3874: ca                 XCH A | R2
CODE:3875: f0                 MOVX @DPTR | A
CODE:3876: a3                 INC DPTR
CODE:3877: c8                 XCH A | R0
CODE:3878: c5 82              XCH A | DPL
CODE:387a: c8                 XCH A | R0
CODE:387b: ca                 XCH A | R2
CODE:387c: c5 83              XCH A | DPH
CODE:387e: ca                 XCH A | R2
CODE:387f: df e9              DJNZ R7 | 0x386a
CODE:3881: de e7              DJNZ R6 | 0x386a
CODE:3883: 80 be              SJMP 0x3843

; ===== FUN_CODE_3885 =====
CODE:3885: e5 90              MOV A | 0x90
CODE:3887: 54 01              ANL A | #0x1
CODE:3889: b4 00 02           CJNE A | #0x0 | 0x388e
CODE:388c: e4                 CLR A
CODE:388d: 73                 JMP @A+DPTR

; ===== FUN_CODE_388e =====
CODE:388e: c4                 SWAP A
CODE:388f: 03                 RR A
CODE:3890: c0 e0              PUSH A
CODE:3892: 74 3a              MOV A | #0x3a
CODE:3894: c0 e0              PUSH A
CODE:3896: c0 82              PUSH DPL
CODE:3898: c0 83              PUSH DPH
CODE:389a: 02 3a 00           LJMP 0x3a00

; ===== FUN_CODE_389d =====
CODE:389d: e5 90              MOV A | 0x90
CODE:389f: 54 01              ANL A | #0x1
CODE:38a1: b4 01 02           CJNE A | #0x1 | 0x38a6
CODE:38a4: e4                 CLR A
CODE:38a5: 73                 JMP @A+DPTR

; ===== FUN_CODE_38a6 =====
CODE:38a6: c4                 SWAP A
CODE:38a7: 03                 RR A
CODE:38a8: c0 e0              PUSH A
CODE:38aa: 74 3a              MOV A | #0x3a
CODE:38ac: c0 e0              PUSH A
CODE:38ae: c0 82              PUSH DPL
CODE:38b0: c0 83              PUSH DPH
CODE:38b2: 02 3a 08           LJMP 0x3a08

; ===== FUN_CODE_38bc =====
CODE:38bc: 90 f0 62           MOV DPTR | #0xf062
CODE:38bf: 01 9d              AJMP 0x389d

; ===== FUN_CODE_38c6 =====
CODE:38c6: 90 ef df           MOV DPTR | #0xefdf
CODE:38c9: 01 9d              AJMP 0x389d

; ===== FUN_CODE_38cb =====
CODE:38cb: 90 ef 5c           MOV DPTR | #0xef5c
CODE:38ce: 01 9d              AJMP 0x389d

; ===== FUN_CODE_38d0 =====
CODE:38d0: 90 6e 8e           MOV DPTR | #0x6e8e
CODE:38d3: 01 9d              AJMP 0x389d

; ===== FUN_CODE_38d5 =====
CODE:38d5: 90 73 18           MOV DPTR | #0x7318
CODE:38d8: 01 9d              AJMP 0x389d

; ===== FUN_CODE_38ee =====
CODE:38ee: 90 54 01           MOV DPTR | #0x5401
CODE:38f1: 01 9d              AJMP 0x389d

; ===== FUN_CODE_38f8 =====
CODE:38f8: 90 55 28           MOV DPTR | #0x5528
CODE:38fb: 01 9d              AJMP 0x389d

; ===== FUN_CODE_38fd =====
CODE:38fd: 90 5a e9           MOV DPTR | #0x5ae9
CODE:3900: 01 9d              AJMP 0x389d

; ===== FUN_CODE_3939 =====
CODE:3939: 90 b2 b0           MOV DPTR | #0xb2b0
CODE:393c: 01 85              AJMP 0x3885

; ===== FUN_CODE_3a00 =====
CODE:3a00: 43 90 01           ORL 0x90 | #0x1
CODE:3a03: 53 90 fe           ANL 0x90 | #0xfe
CODE:3a06: 22                 RET 

; ===== FUN_CODE_3a08 =====
CODE:3a08: 43 90 01           ORL 0x90 | #0x1
CODE:3a0b: 22                 RET 

; ===== FUN_CODE_4077 =====
CODE:4077: ec                 MOV A | R4
CODE:4078: fa                 MOV R2 | A
CODE:4079: a9 f0              MOV R1 | B
CODE:407b: ed                 MOV A | R5
CODE:407c: fb                 MOV R3 | A
CODE:407d: 22                 RET 

; ===== FUN_CODE_40ab =====
CODE:40ab: 88 f0              MOV B | R0
CODE:40ad: ed                 MOV A | R5
CODE:40ae: 24 02              ADD A | #0x2
CODE:40b0: b4 04 00           CJNE A | #0x4 | 0x40b3

; ===== FUN_CODE_40b3 =====
CODE:40b3: 50 c2              JNC 0x4077
CODE:40b5: f5 82              MOV DPL | A
CODE:40b7: eb                 MOV A | R3
CODE:40b8: 24 02              ADD A | #0x2
CODE:40ba: b4 04 00           CJNE A | #0x4 | 0x40bd

; ===== FUN_CODE_40bd =====
CODE:40bd: 50 b8              JNC 0x4077
CODE:40bf: 23                 RL A
CODE:40c0: 23                 RL A
CODE:40c1: 45 82              ORL A | DPL
CODE:40c3: f5 82              MOV DPL | A
CODE:40c5: ef                 MOV A | R7
CODE:40c6: 4e                 ORL A | R6
CODE:40c7: 60 ae              JZ 0x4077
CODE:40c9: ef                 MOV A | R7
CODE:40ca: 60 01              JZ 0x40cd
CODE:40cc: 0e                 INC R6

; ===== FUN_CODE_40cd =====
CODE:40cd: e5 82              MOV A | DPL
CODE:40cf: 23                 RL A
CODE:40d0: 90 40 2b           MOV DPTR | #0x402b
CODE:40d3: 73                 JMP @A+DPTR

; ===== FUN_CODE_40f6 =====
CODE:40f6: bb 01 06           CJNE R3 | #0x1 | 0x40ff
CODE:40f9: 89 82              MOV DPL | R1
CODE:40fb: 8a 83              MOV DPH | R2
CODE:40fd: e0                 MOVX A | @DPTR
CODE:40fe: 22                 RET 

; ===== FUN_CODE_40ff =====
CODE:40ff: 50 02              JNC 0x4103
CODE:4101: e7                 MOV A | @R1
CODE:4102: 22                 RET 

; ===== FUN_CODE_4103 =====
CODE:4103: bb fe 02           CJNE R3 | #0xfe | 0x4108
CODE:4106: e3                 MOVX A | @R1
CODE:4107: 22                 RET 

; ===== FUN_CODE_4108 =====
CODE:4108: 89 82              MOV DPL | R1
CODE:410a: 8a 83              MOV DPH | R2
CODE:410c: e4                 CLR A
CODE:410d: 93                 MOVC A | @A+DPTR
CODE:410e: 22                 RET 

; ===== FUN_CODE_410f =====
CODE:410f: bb 01 0c           CJNE R3 | #0x1 | 0x411e
CODE:4112: e5 82              MOV A | DPL
CODE:4114: 29                 ADD A | R1
CODE:4115: f5 82              MOV DPL | A
CODE:4117: e5 83              MOV A | DPH
CODE:4119: 3a                 ADDC A | R2
CODE:411a: f5 83              MOV DPH | A
CODE:411c: e0                 MOVX A | @DPTR
CODE:411d: 22                 RET 

; ===== FUN_CODE_411e =====
CODE:411e: 50 06              JNC 0x4126
CODE:4120: e9                 MOV A | R1
CODE:4121: 25 82              ADD A | DPL
CODE:4123: f8                 MOV R0 | A
CODE:4124: e6                 MOV A | @R0
CODE:4125: 22                 RET 

; ===== FUN_CODE_4126 =====
CODE:4126: bb fe 06           CJNE R3 | #0xfe | 0x412f
CODE:4129: e9                 MOV A | R1
CODE:412a: 25 82              ADD A | DPL
CODE:412c: f8                 MOV R0 | A
CODE:412d: e2                 MOVX A | @R0
CODE:412e: 22                 RET 

; ===== FUN_CODE_412f =====
CODE:412f: e5 82              MOV A | DPL
CODE:4131: 29                 ADD A | R1
CODE:4132: f5 82              MOV DPL | A
CODE:4134: e5 83              MOV A | DPH
CODE:4136: 3a                 ADDC A | R2
CODE:4137: f5 83              MOV DPH | A
CODE:4139: e4                 CLR A
CODE:413a: 93                 MOVC A | @A+DPTR
CODE:413b: 22                 RET 

; ===== FUN_CODE_413c =====
CODE:413c: bb 01 06           CJNE R3 | #0x1 | 0x4145
CODE:413f: 89 82              MOV DPL | R1
CODE:4141: 8a 83              MOV DPH | R2
CODE:4143: f0                 MOVX @DPTR | A
CODE:4144: 22                 RET 

; ===== FUN_CODE_4145 =====
CODE:4145: 50 02              JNC 0x4149
CODE:4147: f7                 MOV @R1 | A
CODE:4148: 22                 RET 

; ===== FUN_CODE_4149 =====
CODE:4149: bb fe 01           CJNE R3 | #0xfe | 0x414d
CODE:414c: f3                 MOVX @R1 | A

; ===== FUN_CODE_414d =====
CODE:414d: 22                 RET 

; ===== FUN_CODE_414e =====
CODE:414e: f8                 MOV R0 | A
CODE:414f: bb 01 0d           CJNE R3 | #0x1 | 0x415f
CODE:4152: e5 82              MOV A | DPL
CODE:4154: 29                 ADD A | R1
CODE:4155: f5 82              MOV DPL | A
CODE:4157: e5 83              MOV A | DPH
CODE:4159: 3a                 ADDC A | R2
CODE:415a: f5 83              MOV DPH | A
CODE:415c: e8                 MOV A | R0
CODE:415d: f0                 MOVX @DPTR | A
CODE:415e: 22                 RET 

; ===== FUN_CODE_415f =====
CODE:415f: 50 06              JNC 0x4167
CODE:4161: e9                 MOV A | R1
CODE:4162: 25 82              ADD A | DPL
CODE:4164: c8                 XCH A | R0
CODE:4165: f6                 MOV @R0 | A
CODE:4166: 22                 RET 

; ===== FUN_CODE_4167 =====
CODE:4167: bb fe 05           CJNE R3 | #0xfe | 0x416f
CODE:416a: e9                 MOV A | R1
CODE:416b: 25 82              ADD A | DPL
CODE:416d: c8                 XCH A | R0
CODE:416e: f2                 MOVX @R0 | A

; ===== FUN_CODE_416f =====
CODE:416f: 22                 RET 

; ===== FUN_CODE_420f =====
CODE:420f: c5 f0              XCH A | B
CODE:4211: f8                 MOV R0 | A
CODE:4212: a3                 INC DPTR
CODE:4213: e0                 MOVX A | @DPTR
CODE:4214: 28                 ADD A | R0
CODE:4215: f0                 MOVX @DPTR | A
CODE:4216: c5 f0              XCH A | B
CODE:4218: f8                 MOV R0 | A
CODE:4219: e5 82              MOV A | DPL
CODE:421b: 15 82              DEC DPL
CODE:421d: 70 02              JNZ 0x4221
CODE:421f: 15 83              DEC DPH

; ===== FUN_CODE_4221 =====
CODE:4221: e0                 MOVX A | @DPTR
CODE:4222: 38                 ADDC A | R0
CODE:4223: f0                 MOVX @DPTR | A
CODE:4224: 22                 RET 

; ===== FUN_CODE_4225 =====
CODE:4225: a3                 INC DPTR
CODE:4226: f8                 MOV R0 | A
CODE:4227: e0                 MOVX A | @DPTR
CODE:4228: c5 f0              XCH A | B
CODE:422a: 25 f0              ADD A | B
CODE:422c: f0                 MOVX @DPTR | A
CODE:422d: e5 82              MOV A | DPL
CODE:422f: 15 82              DEC DPL
CODE:4231: 70 02              JNZ 0x4235
CODE:4233: 15 83              DEC DPH

; ===== FUN_CODE_4235 =====
CODE:4235: e0                 MOVX A | @DPTR
CODE:4236: c8                 XCH A | R0
CODE:4237: 38                 ADDC A | R0
CODE:4238: f0                 MOVX @DPTR | A
CODE:4239: e8                 MOV A | R0
CODE:423a: 22                 RET 

; ===== FUN_CODE_43e8 =====
CODE:43e8: eb                 MOV A | R3
CODE:43e9: 9f                 SUBB A | R7
CODE:43ea: f5 f0              MOV B | A
CODE:43ec: ea                 MOV A | R2
CODE:43ed: 9e                 SUBB A | R6
CODE:43ee: 42 f0              ORL B | A
CODE:43f0: e9                 MOV A | R1
CODE:43f1: 9d                 SUBB A | R5
CODE:43f2: 42 f0              ORL B | A
CODE:43f4: ec                 MOV A | R4
CODE:43f5: 64 80              XRL A | #0x80
CODE:43f7: c8                 XCH A | R0
CODE:43f8: 64 80              XRL A | #0x80
CODE:43fa: 98                 SUBB A | R0
CODE:43fb: 45 f0              ORL A | B
CODE:43fd: 22                 RET 

; ===== FUN_CODE_444a =====
CODE:444a: ec                 MOV A | R4
CODE:444b: f0                 MOVX @DPTR | A
CODE:444c: a3                 INC DPTR
CODE:444d: ed                 MOV A | R5
CODE:444e: f0                 MOVX @DPTR | A
CODE:444f: a3                 INC DPTR
CODE:4450: ee                 MOV A | R6
CODE:4451: f0                 MOVX @DPTR | A
CODE:4452: a3                 INC DPTR
CODE:4453: ef                 MOV A | R7
CODE:4454: f0                 MOVX @DPTR | A
CODE:4455: 22                 RET 

; ===== FUN_CODE_4456 =====
CODE:4456: a8 82              MOV R0 | DPL
CODE:4458: 85 83 f0           MOV B | DPH
CODE:445b: d0 83              POP DPH
CODE:445d: d0 82              POP DPL
CODE:445f: 12 44 6d           LCALL 0x446d
CODE:4462: 12 44 6d           LCALL 0x446d
CODE:4465: 12 44 6d           LCALL 0x446d
CODE:4468: 12 44 6d           LCALL 0x446d
CODE:446b: e4                 CLR A
CODE:446c: 73                 JMP @A+DPTR

; ===== FUN_CODE_446d =====
CODE:446d: e4                 CLR A
CODE:446e: 93                 MOVC A | @A+DPTR
CODE:446f: a3                 INC DPTR
CODE:4470: c5 83              XCH A | DPH
CODE:4472: c5 f0              XCH A | B
CODE:4474: c5 83              XCH A | DPH
CODE:4476: c8                 XCH A | R0
CODE:4477: c5 82              XCH A | DPL
CODE:4479: c8                 XCH A | R0
CODE:447a: f0                 MOVX @DPTR | A
CODE:447b: a3                 INC DPTR
CODE:447c: c5 83              XCH A | DPH
CODE:447e: c5 f0              XCH A | B
CODE:4480: c5 83              XCH A | DPH
CODE:4482: c8                 XCH A | R0
CODE:4483: c5 82              XCH A | DPL
CODE:4485: c8                 XCH A | R0
CODE:4486: 22                 RET 

; ===== FUN_CODE_4625 =====
CODE:4625: 7f 00              MOV R7 | #0x0
CODE:4627: f8                 MOV R0 | A
CODE:4628: 45 f0              ORL A | B
CODE:462a: 60 0e              JZ 0x463a
CODE:462c: e8                 MOV A | R0
CODE:462d: 63 f0 80           XRL B | #0x80
CODE:4630: 64 80              XRL A | #0x80
CODE:4632: d3                 SETB CY
CODE:4633: 95 f0              SUBB A | B
CODE:4635: 1f                 DEC R7
CODE:4636: 40 02              JC 0x463a
CODE:4638: 7f 01              MOV R7 | #0x1

; ===== FUN_CODE_463a =====
CODE:463a: 22                 RET 

; ===== FUN_CODE_4682 =====
CODE:4682: 88 f0              MOV B | R0
CODE:4684: ed                 MOV A | R5
CODE:4685: 24 02              ADD A | #0x2
CODE:4687: b4 04 00           CJNE A | #0x4 | 0x468a

; ===== FUN_CODE_468a =====
CODE:468a: 50 99              JNC 0x4625
CODE:468c: f5 82              MOV DPL | A
CODE:468e: eb                 MOV A | R3
CODE:468f: 24 02              ADD A | #0x2
CODE:4691: b4 04 00           CJNE A | #0x4 | 0x4694

; ===== FUN_CODE_4694 =====
CODE:4694: 50 8f              JNC 0x4625
CODE:4696: 23                 RL A
CODE:4697: 23                 RL A
CODE:4698: 45 82              ORL A | DPL
CODE:469a: 23                 RL A
CODE:469b: 90 45 73           MOV DPTR | #0x4573
CODE:469e: 73                 JMP @A+DPTR

; ===== FUN_CODE_4739 =====
CODE:4739: ec                 MOV A | R4
CODE:473a: fa                 MOV R2 | A
CODE:473b: a9 f0              MOV R1 | B
CODE:473d: ed                 MOV A | R5
CODE:473e: fb                 MOV R3 | A
CODE:473f: 22                 RET 

; ===== FUN_CODE_476b =====
CODE:476b: 88 f0              MOV B | R0
CODE:476d: ed                 MOV A | R5
CODE:476e: 24 02              ADD A | #0x2
CODE:4770: b4 04 00           CJNE A | #0x4 | 0x4773

; ===== FUN_CODE_4773 =====
CODE:4773: 50 c4              JNC 0x4739
CODE:4775: f5 82              MOV DPL | A
CODE:4777: eb                 MOV A | R3
CODE:4778: 24 02              ADD A | #0x2
CODE:477a: b4 04 00           CJNE A | #0x4 | 0x477d

; ===== FUN_CODE_477d =====
CODE:477d: 50 ba              JNC 0x4739
CODE:477f: 23                 RL A
CODE:4780: 23                 RL A
CODE:4781: 45 82              ORL A | DPL
CODE:4783: 23                 RL A
CODE:4784: 90 46 ef           MOV DPTR | #0x46ef
CODE:4787: 73                 JMP @A+DPTR

; ===== FUN_CODE_50ce =====
CODE:50ce: ce                 XCH A | R6
CODE:50cf: ef                 MOV A | R7
CODE:50d0: ce                 XCH A | R6
CODE:50d1: ee                 MOV A | R6
CODE:50d2: c3                 CLR CY
CODE:50d3: 94 61              SUBB A | #0x61
CODE:50d5: 40 0b              JC 0x50e2
CODE:50d7: ee                 MOV A | R6
CODE:50d8: c3                 CLR CY
CODE:50d9: 94 7b              SUBB A | #0x7b
CODE:50db: 50 05              JNC 0x50e2
CODE:50dd: ee                 MOV A | R6
CODE:50de: 24 e0              ADD A | #0xe0
CODE:50e0: ff                 MOV R7 | A
CODE:50e1: 22                 RET 

; ===== FUN_CODE_50e2 =====
CODE:50e2: cf                 XCH A | R7
CODE:50e3: ee                 MOV A | R6
CODE:50e4: cf                 XCH A | R7
CODE:50e5: 22                 RET 

; ===== FUN_CODE_50f8 =====
CODE:50f8: 90 8b 39           MOV DPTR | #0x8b39
CODE:50fb: eb                 MOV A | R3
CODE:50fc: f0                 MOVX @DPTR | A
CODE:50fd: a3                 INC DPTR
CODE:50fe: ea                 MOV A | R2
CODE:50ff: f0                 MOVX @DPTR | A
CODE:5100: a3                 INC DPTR
CODE:5101: e9                 MOV A | R1
CODE:5102: f0                 MOVX @DPTR | A
CODE:5103: 90 8b 3f           MOV DPTR | #0x8b3f
CODE:5106: eb                 MOV A | R3
CODE:5107: f0                 MOVX @DPTR | A
CODE:5108: a3                 INC DPTR
CODE:5109: ea                 MOV A | R2
CODE:510a: f0                 MOVX @DPTR | A
CODE:510b: a3                 INC DPTR
CODE:510c: e9                 MOV A | R1
CODE:510d: f0                 MOVX @DPTR | A

; ===== FUN_CODE_510e =====
CODE:510e: 90 8b 39           MOV DPTR | #0x8b39
CODE:5111: e0                 MOVX A | @DPTR
CODE:5112: fb                 MOV R3 | A
CODE:5113: a3                 INC DPTR
CODE:5114: e4                 CLR A
CODE:5115: 75 f0 01           MOV B | #0x1
CODE:5118: 12 42 25           LCALL 0x4225
CODE:511b: a9 f0              MOV R1 | B
CODE:511d: fa                 MOV R2 | A
CODE:511e: 12 40 f6           LCALL 0x40f6
CODE:5121: 70 eb              JNZ 0x510e
CODE:5123: 90 8b 3a           MOV DPTR | #0x8b3a
CODE:5126: 74 ff              MOV A | #0xff
CODE:5128: f5 f0              MOV B | A
CODE:512a: 12 42 0f           LCALL 0x420f

; ===== FUN_CODE_512d =====
CODE:512d: 90 8b 3c           MOV DPTR | #0x8b3c
CODE:5130: e0                 MOVX A | @DPTR
CODE:5131: fb                 MOV R3 | A
CODE:5132: a3                 INC DPTR
CODE:5133: e4                 CLR A
CODE:5134: 75 f0 01           MOV B | #0x1
CODE:5137: 12 42 25           LCALL 0x4225
CODE:513a: a9 f0              MOV R1 | B
CODE:513c: fa                 MOV R2 | A
CODE:513d: 12 40 f6           LCALL 0x40f6
CODE:5140: ff                 MOV R7 | A
CODE:5141: 90 8b 39           MOV DPTR | #0x8b39
CODE:5144: e0                 MOVX A | @DPTR
CODE:5145: fb                 MOV R3 | A
CODE:5146: a3                 INC DPTR
CODE:5147: e4                 CLR A
CODE:5148: 75 f0 01           MOV B | #0x1
CODE:514b: 12 42 25           LCALL 0x4225
CODE:514e: a9 f0              MOV R1 | B
CODE:5150: fa                 MOV R2 | A
CODE:5151: ef                 MOV A | R7
CODE:5152: 12 41 3c           LCALL 0x413c
CODE:5155: 70 d6              JNZ 0x512d
CODE:5157: 90 8b 3f           MOV DPTR | #0x8b3f
CODE:515a: e0                 MOVX A | @DPTR
CODE:515b: fb                 MOV R3 | A
CODE:515c: a3                 INC DPTR
CODE:515d: e0                 MOVX A | @DPTR
CODE:515e: fa                 MOV R2 | A
CODE:515f: a3                 INC DPTR
CODE:5160: e0                 MOVX A | @DPTR
CODE:5161: f9                 MOV R1 | A
CODE:5162: 22                 RET 

; ===== FUN_CODE_5163 =====
CODE:5163: 90 8b 39           MOV DPTR | #0x8b39
CODE:5166: eb                 MOV A | R3
CODE:5167: f0                 MOVX @DPTR | A
CODE:5168: a3                 INC DPTR
CODE:5169: ea                 MOV A | R2
CODE:516a: f0                 MOVX @DPTR | A
CODE:516b: a3                 INC DPTR
CODE:516c: e9                 MOV A | R1
CODE:516d: f0                 MOVX @DPTR | A
CODE:516e: e4                 CLR A
CODE:516f: 90 8b 41           MOV DPTR | #0x8b41
CODE:5172: f0                 MOVX @DPTR | A
CODE:5173: a3                 INC DPTR
CODE:5174: f0                 MOVX @DPTR | A
CODE:5175: d3                 SETB CY
CODE:5176: 90 8b 40           MOV DPTR | #0x8b40
CODE:5179: e0                 MOVX A | @DPTR
CODE:517a: 94 00              SUBB A | #0x0
CODE:517c: 90 8b 3f           MOV DPTR | #0x8b3f
CODE:517f: e0                 MOVX A | @DPTR
CODE:5180: 64 80              XRL A | #0x80
CODE:5182: 94 80              SUBB A | #0x80
CODE:5184: 50 03              JNC 0x5189
CODE:5186: 02 52 1d           LJMP 0x521d

; ===== FUN_CODE_5189 =====
CODE:5189: 90 8b 39           MOV DPTR | #0x8b39
CODE:518c: e0                 MOVX A | @DPTR
CODE:518d: fb                 MOV R3 | A
CODE:518e: a3                 INC DPTR
CODE:518f: e0                 MOVX A | @DPTR
CODE:5190: fa                 MOV R2 | A
CODE:5191: a3                 INC DPTR
CODE:5192: e0                 MOVX A | @DPTR
CODE:5193: f9                 MOV R1 | A
CODE:5194: 90 8b 41           MOV DPTR | #0x8b41
CODE:5197: e0                 MOVX A | @DPTR
CODE:5198: fe                 MOV R6 | A
CODE:5199: a3                 INC DPTR
CODE:519a: e0                 MOVX A | @DPTR
CODE:519b: f5 82              MOV DPL | A
CODE:519d: 8e 83              MOV DPH | R6
CODE:519f: 12 41 0f           LCALL 0x410f
CODE:51a2: 60 10              JZ 0x51b4
CODE:51a4: 90 8b 42           MOV DPTR | #0x8b42
CODE:51a7: e0                 MOVX A | @DPTR
CODE:51a8: 04                 INC A
CODE:51a9: f0                 MOVX @DPTR | A
CODE:51aa: 70 06              JNZ 0x51b2
CODE:51ac: 90 8b 41           MOV DPTR | #0x8b41
CODE:51af: e0                 MOVX A | @DPTR
CODE:51b0: 04                 INC A
CODE:51b1: f0                 MOVX @DPTR | A

; ===== thunk_FUN_CODE_5189 =====
CODE:51b2: 80 d5              SJMP 0x5189

; ===== FUN_CODE_51b4 =====
CODE:51b4: 90 8b 3c           MOV DPTR | #0x8b3c
CODE:51b7: e0                 MOVX A | @DPTR
CODE:51b8: fb                 MOV R3 | A
CODE:51b9: a3                 INC DPTR
CODE:51ba: e0                 MOVX A | @DPTR
CODE:51bb: fa                 MOV R2 | A
CODE:51bc: a3                 INC DPTR
CODE:51bd: e0                 MOVX A | @DPTR
CODE:51be: f9                 MOV R1 | A
CODE:51bf: 12 40 f6           LCALL 0x40f6
CODE:51c2: 60 3f              JZ 0x5203
CODE:51c4: 90 8b 3c           MOV DPTR | #0x8b3c
CODE:51c7: e0                 MOVX A | @DPTR
CODE:51c8: a3                 INC DPTR
CODE:51c9: e4                 CLR A
CODE:51ca: 75 f0 01           MOV B | #0x1
CODE:51cd: 12 42 25           LCALL 0x4225
CODE:51d0: a9 f0              MOV R1 | B
CODE:51d2: fa                 MOV R2 | A
CODE:51d3: 12 40 f6           LCALL 0x40f6
CODE:51d6: ff                 MOV R7 | A
CODE:51d7: 90 8b 39           MOV DPTR | #0x8b39
CODE:51da: e0                 MOVX A | @DPTR
CODE:51db: fb                 MOV R3 | A
CODE:51dc: a3                 INC DPTR
CODE:51dd: e0                 MOVX A | @DPTR
CODE:51de: fa                 MOV R2 | A
CODE:51df: a3                 INC DPTR
CODE:51e0: e0                 MOVX A | @DPTR
CODE:51e1: f9                 MOV R1 | A
CODE:51e2: 90 8b 41           MOV DPTR | #0x8b41
CODE:51e5: e4                 CLR A
CODE:51e6: 75 f0 01           MOV B | #0x1
CODE:51e9: 12 42 25           LCALL 0x4225
CODE:51ec: 85 f0 82           MOV DPL | B
CODE:51ef: f5 83              MOV DPH | A
CODE:51f1: ef                 MOV A | R7
CODE:51f2: 12 41 4e           LCALL 0x414e
CODE:51f5: 90 8b 3f           MOV DPTR | #0x8b3f
CODE:51f8: 74 ff              MOV A | #0xff
CODE:51fa: f5 f0              MOV B | A
CODE:51fc: 12 42 0f           LCALL 0x420f
CODE:51ff: 45 f0              ORL A | B
CODE:5201: 70 b1              JNZ 0x51b4

; ===== FUN_CODE_5203 =====
CODE:5203: 90 8b 39           MOV DPTR | #0x8b39
CODE:5206: e0                 MOVX A | @DPTR
CODE:5207: fb                 MOV R3 | A
CODE:5208: a3                 INC DPTR
CODE:5209: e0                 MOVX A | @DPTR
CODE:520a: fa                 MOV R2 | A
CODE:520b: a3                 INC DPTR
CODE:520c: e0                 MOVX A | @DPTR
CODE:520d: f9                 MOV R1 | A
CODE:520e: 90 8b 41           MOV DPTR | #0x8b41
CODE:5211: e0                 MOVX A | @DPTR
CODE:5212: fe                 MOV R6 | A
CODE:5213: a3                 INC DPTR
CODE:5214: e0                 MOVX A | @DPTR
CODE:5215: f5 82              MOV DPL | A
CODE:5217: 8e 83              MOV DPH | R6
CODE:5219: e4                 CLR A
CODE:521a: 12 41 4e           LCALL 0x414e

; ===== FUN_CODE_521d =====
CODE:521d: 90 8b 39           MOV DPTR | #0x8b39
CODE:5220: e0                 MOVX A | @DPTR
CODE:5221: fb                 MOV R3 | A
CODE:5222: a3                 INC DPTR
CODE:5223: e0                 MOVX A | @DPTR
CODE:5224: fa                 MOV R2 | A
CODE:5225: a3                 INC DPTR
CODE:5226: e0                 MOVX A | @DPTR
CODE:5227: f9                 MOV R1 | A
CODE:5228: 22                 RET 

; ===== FUN_CODE_5290 =====
CODE:5290: 90 8b 39           MOV DPTR | #0x8b39
CODE:5293: eb                 MOV A | R3
CODE:5294: f0                 MOVX @DPTR | A
CODE:5295: a3                 INC DPTR
CODE:5296: ea                 MOV A | R2
CODE:5297: f0                 MOVX @DPTR | A
CODE:5298: a3                 INC DPTR
CODE:5299: e9                 MOV A | R1
CODE:529a: f0                 MOVX @DPTR | A
CODE:529b: e4                 CLR A
CODE:529c: 90 8b 41           MOV DPTR | #0x8b41
CODE:529f: f0                 MOVX @DPTR | A
CODE:52a0: a3                 INC DPTR
CODE:52a1: f0                 MOVX @DPTR | A

; ===== FUN_CODE_52a2 =====
CODE:52a2: 90 8b 3f           MOV DPTR | #0x8b3f
CODE:52a5: 74 ff              MOV A | #0xff
CODE:52a7: f5 f0              MOV B | A
CODE:52a9: 12 42 25           LCALL 0x4225
CODE:52ac: 45 f0              ORL A | B
CODE:52ae: 60 3c              JZ 0x52ec
CODE:52b0: 90 8b 3c           MOV DPTR | #0x8b3c
CODE:52b3: e0                 MOVX A | @DPTR
CODE:52b4: fb                 MOV R3 | A
CODE:52b5: a3                 INC DPTR
CODE:52b6: e0                 MOVX A | @DPTR
CODE:52b7: fa                 MOV R2 | A
CODE:52b8: a3                 INC DPTR
CODE:52b9: e0                 MOVX A | @DPTR
CODE:52ba: f9                 MOV R1 | A
CODE:52bb: 12 40 f6           LCALL 0x40f6
CODE:52be: ff                 MOV R7 | A
CODE:52bf: 90 8b 39           MOV DPTR | #0x8b39
CODE:52c2: e0                 MOVX A | @DPTR
CODE:52c3: fb                 MOV R3 | A
CODE:52c4: a3                 INC DPTR
CODE:52c5: e0                 MOVX A | @DPTR
CODE:52c6: fa                 MOV R2 | A
CODE:52c7: a3                 INC DPTR
CODE:52c8: e0                 MOVX A | @DPTR
CODE:52c9: f9                 MOV R1 | A
CODE:52ca: 90 8b 41           MOV DPTR | #0x8b41
CODE:52cd: e4                 CLR A
CODE:52ce: 75 f0 01           MOV B | #0x1
CODE:52d1: 12 42 25           LCALL 0x4225
CODE:52d4: 85 f0 82           MOV DPL | B
CODE:52d7: f5 83              MOV DPH | A
CODE:52d9: ef                 MOV A | R7
CODE:52da: 12 41 4e           LCALL 0x414e
CODE:52dd: ef                 MOV A | R7
CODE:52de: 60 c2              JZ 0x52a2
CODE:52e0: 90 8b 3d           MOV DPTR | #0x8b3d
CODE:52e3: e4                 CLR A
CODE:52e4: 75 f0 01           MOV B | #0x1
CODE:52e7: 12 42 0f           LCALL 0x420f
CODE:52ea: 80 b6              SJMP 0x52a2

; ===== FUN_CODE_52ec =====
CODE:52ec: 90 8b 39           MOV DPTR | #0x8b39
CODE:52ef: e0                 MOVX A | @DPTR
CODE:52f0: fb                 MOV R3 | A
CODE:52f1: a3                 INC DPTR
CODE:52f2: e0                 MOVX A | @DPTR
CODE:52f3: fa                 MOV R2 | A
CODE:52f4: a3                 INC DPTR
CODE:52f5: e0                 MOVX A | @DPTR
CODE:52f6: f9                 MOV R1 | A
CODE:52f7: 22                 RET 

; ===== FUN_CODE_52f8 =====
CODE:52f8: e4                 CLR A
CODE:52f9: ff                 MOV R7 | A
CODE:52fa: fe                 MOV R6 | A

; ===== FUN_CODE_52fb =====
CODE:52fb: 12 40 f6           LCALL 0x40f6
CODE:52fe: 60 0c              JZ 0x530c
CODE:5300: 0f                 INC R7
CODE:5301: ef                 MOV A | R7
CODE:5302: 70 01              JNZ 0x5305
CODE:5304: 0e                 INC R6

; ===== FUN_CODE_5305 =====
CODE:5305: 09                 INC R1
CODE:5306: e9                 MOV A | R1
CODE:5307: 70 f2              JNZ 0x52fb
CODE:5309: 0a                 INC R2
CODE:530a: 80 ef              SJMP 0x52fb

; ===== FUN_CODE_530c =====
CODE:530c: 22                 RET 

; ===== FUN_CODE_58c2 =====
CODE:58c2: f0                 MOVX @DPTR | A
CODE:58c3: 80 41              SJMP 0x5906

; ===== FUN_CODE_5906 =====
CODE:5906: 90 80 5d           MOV DPTR | #0x805d
CODE:5909: e0                 MOVX A | @DPTR
CODE:590a: fe                 MOV R6 | A
CODE:590b: a3                 INC DPTR
CODE:590c: e0                 MOVX A | @DPTR
CODE:590d: f4                 CPL A
CODE:590e: ff                 MOV R7 | A
CODE:590f: ee                 MOV A | R6
CODE:5910: f4                 CPL A
CODE:5911: fe                 MOV R6 | A
CODE:5912: ef                 MOV A | R7
CODE:5913: 64 40              XRL A | #0x40
CODE:5915: 4e                 ORL A | R6
CODE:5916: 60 02              JZ 0x591a
CODE:5918: c2 0b              CLR 0x0b

; ===== FUN_CODE_591a =====
CODE:591a: 7b 01              MOV R3 | #0x1
CODE:591c: 7a 86              MOV R2 | #0x86
CODE:591e: 79 61              MOV R1 | #0x61
CODE:5920: 12 52 f8           LCALL 0x52f8
CODE:5923: c3                 CLR CY
CODE:5924: ef                 MOV A | R7
CODE:5925: 94 06              SUBB A | #0x6
CODE:5927: ee                 MOV A | R6
CODE:5928: 64 80              XRL A | #0x80
CODE:592a: 94 80              SUBB A | #0x80
CODE:592c: 40 03              JC 0x5931
CODE:592e: 02 5a 64           LJMP 0x5a64

; ===== FUN_CODE_5931 =====
CODE:5931: 30 0b 33           JNB 0x0b | 0x5967
CODE:5934: e4                 CLR A
CODE:5935: 90 8a 4a           MOV DPTR | #0x8a4a
CODE:5938: f0                 MOVX @DPTR | A
CODE:5939: a3                 INC DPTR
CODE:593a: f0                 MOVX @DPTR | A

; ===== FUN_CODE_593b =====
CODE:593b: 90 8a 4b           MOV DPTR | #0x8a4b
CODE:593e: e0                 MOVX A | @DPTR
CODE:593f: 24 61              ADD A | #0x61
CODE:5941: f5 82              MOV DPL | A
CODE:5943: e4                 CLR A
CODE:5944: 34 86              ADDC A | #0x86
CODE:5946: f5 83              MOV DPH | A
CODE:5948: e4                 CLR A
CODE:5949: f0                 MOVX @DPTR | A
CODE:594a: 90 8a 4b           MOV DPTR | #0x8a4b
CODE:594d: e0                 MOVX A | @DPTR
CODE:594e: 04                 INC A
CODE:594f: f0                 MOVX @DPTR | A
CODE:5950: 70 06              JNZ 0x5958
CODE:5952: 90 8a 4a           MOV DPTR | #0x8a4a
CODE:5955: e0                 MOVX A | @DPTR
CODE:5956: 04                 INC A
CODE:5957: f0                 MOVX @DPTR | A

; ===== FUN_CODE_5958 =====
CODE:5958: 90 8a 4a           MOV DPTR | #0x8a4a
CODE:595b: e0                 MOVX A | @DPTR
CODE:595c: 70 04              JNZ 0x5962
CODE:595e: a3                 INC DPTR
CODE:595f: e0                 MOVX A | @DPTR
CODE:5960: 64 0b              XRL A | #0xb

; ===== FUN_CODE_5962 =====
CODE:5962: 70 d7              JNZ 0x593b
CODE:5964: 02 5a 64           LJMP 0x5a64

; ===== FUN_CODE_5967 =====
CODE:5967: 90 86 61           MOV DPTR | #0x8661
CODE:596a: e0                 MOVX A | @DPTR
CODE:596b: b4 30 2d           CJNE A | #0x30 | 0x599b
CODE:596e: a3                 INC DPTR
CODE:596f: e0                 MOVX A | @DPTR
CODE:5970: 64 2e              XRL A | #0x2e
CODE:5972: 60 27              JZ 0x599b
CODE:5974: 90 8a 47           MOV DPTR | #0x8a47
CODE:5977: e0                 MOVX A | @DPTR
CODE:5978: 64 2e              XRL A | #0x2e
CODE:597a: 60 1f              JZ 0x599b
CODE:597c: 90 8b 3c           MOV DPTR | #0x8b3c
CODE:597f: 74 01              MOV A | #0x1
CODE:5981: f0                 MOVX @DPTR | A
CODE:5982: a3                 INC DPTR
CODE:5983: 74 8a              MOV A | #0x8a
CODE:5985: f0                 MOVX @DPTR | A
CODE:5986: a3                 INC DPTR
CODE:5987: 74 47              MOV A | #0x47
CODE:5989: f0                 MOVX @DPTR | A
CODE:598a: a3                 INC DPTR
CODE:598b: e4                 CLR A
CODE:598c: f0                 MOVX @DPTR | A
CODE:598d: a3                 INC DPTR
CODE:598e: 04                 INC A
CODE:598f: f0                 MOVX @DPTR | A
CODE:5990: fb                 MOV R3 | A
CODE:5991: 7a 86              MOV R2 | #0x86
CODE:5993: 79 61              MOV R1 | #0x61
CODE:5995: 12 52 90           LCALL 0x5290
CODE:5998: 02 5a 64           LJMP 0x5a64

; ===== FUN_CODE_599b =====
CODE:599b: 90 8a 47           MOV DPTR | #0x8a47
CODE:599e: e0                 MOVX A | @DPTR
CODE:599f: ff                 MOV R7 | A
CODE:59a0: b4 2e 0a           CJNE A | #0x2e | 0x59ad
CODE:59a3: 90 80 33           MOV DPTR | #0x8033
CODE:59a6: e0                 MOVX A | @DPTR
CODE:59a7: 70 02              JNZ 0x59ab
CODE:59a9: a3                 INC DPTR
CODE:59aa: e0                 MOVX A | @DPTR

; ===== FUN_CODE_59ab =====
CODE:59ab: 60 11              JZ 0x59be

; ===== FUN_CODE_59ad =====
CODE:59ad: 90 86 61           MOV DPTR | #0x8661
CODE:59b0: e0                 MOVX A | @DPTR
CODE:59b1: 60 03              JZ 0x59b6
CODE:59b3: 02 5a 35           LJMP 0x5a35

; ===== FUN_CODE_59b6 =====
CODE:59b6: ef                 MOV A | R7
CODE:59b7: 64 2e              XRL A | #0x2e
CODE:59b9: 60 03              JZ 0x59be
CODE:59bb: 02 5a 35           LJMP 0x5a35

; ===== FUN_CODE_59be =====
CODE:59be: 90 86 61           MOV DPTR | #0x8661
CODE:59c1: e0                 MOVX A | @DPTR
CODE:59c2: 70 39              JNZ 0x59fd
CODE:59c4: ef                 MOV A | R7
CODE:59c5: b4 2e 35           CJNE A | #0x2e | 0x59fd
CODE:59c8: 78 61              MOV R0 | #0x61
CODE:59ca: 7c 86              MOV R4 | #0x86
CODE:59cc: 7d 01              MOV R5 | #0x1
CODE:59ce: 7b ff              MOV R3 | #0xff
CODE:59d0: 7a 2d              MOV R2 | #0x2d
CODE:59d2: 79 e4              MOV R1 | #0xe4
CODE:59d4: 12 47 6b           LCALL 0x476b
CODE:59d7: 90 8b 3c           MOV DPTR | #0x8b3c
CODE:59da: 74 01              MOV A | #0x1
CODE:59dc: f0                 MOVX @DPTR | A
CODE:59dd: a3                 INC DPTR
CODE:59de: 74 8a              MOV A | #0x8a
CODE:59e0: f0                 MOVX @DPTR | A
CODE:59e1: a3                 INC DPTR
CODE:59e2: 74 47              MOV A | #0x47
CODE:59e4: f0                 MOVX @DPTR | A
CODE:59e5: a3                 INC DPTR
CODE:59e6: e4                 CLR A
CODE:59e7: f0                 MOVX @DPTR | A
CODE:59e8: a3                 INC DPTR
CODE:59e9: 04                 INC A
CODE:59ea: f0                 MOVX @DPTR | A
CODE:59eb: fb                 MOV R3 | A
CODE:59ec: 7a 86              MOV R2 | #0x86
CODE:59ee: 79 61              MOV R1 | #0x61
CODE:59f0: 12 51 63           LCALL 0x5163
CODE:59f3: 90 80 33           MOV DPTR | #0x8033
CODE:59f6: e4                 CLR A
CODE:59f7: f0                 MOVX @DPTR | A
CODE:59f8: a3                 INC DPTR
CODE:59f9: 04                 INC A
CODE:59fa: f0                 MOVX @DPTR | A
CODE:59fb: 80 67              SJMP 0x5a64

; ===== FUN_CODE_59fd =====
CODE:59fd: 90 8a 47           MOV DPTR | #0x8a47
CODE:5a00: e0                 MOVX A | @DPTR
CODE:5a01: 64 2e              XRL A | #0x2e
CODE:5a03: 70 5f              JNZ 0x5a64
CODE:5a05: 90 80 33           MOV DPTR | #0x8033
CODE:5a08: e0                 MOVX A | @DPTR
CODE:5a09: 70 02              JNZ 0x5a0d
CODE:5a0b: a3                 INC DPTR
CODE:5a0c: e0                 MOVX A | @DPTR

; ===== FUN_CODE_5a0d =====
CODE:5a0d: 70 55              JNZ 0x5a64
CODE:5a0f: 7b 01              MOV R3 | #0x1
CODE:5a11: 90 8b 3c           MOV DPTR | #0x8b3c
CODE:5a14: 04                 INC A
CODE:5a15: f0                 MOVX @DPTR | A
CODE:5a16: a3                 INC DPTR
CODE:5a17: 74 8a              MOV A | #0x8a
CODE:5a19: f0                 MOVX @DPTR | A
CODE:5a1a: a3                 INC DPTR
CODE:5a1b: 74 47              MOV A | #0x47
CODE:5a1d: f0                 MOVX @DPTR | A
CODE:5a1e: a3                 INC DPTR
CODE:5a1f: e4                 CLR A
CODE:5a20: f0                 MOVX @DPTR | A
CODE:5a21: a3                 INC DPTR
CODE:5a22: 04                 INC A
CODE:5a23: f0                 MOVX @DPTR | A
CODE:5a24: 7a 86              MOV R2 | #0x86
CODE:5a26: 79 61              MOV R1 | #0x61
CODE:5a28: 12 51 63           LCALL 0x5163
CODE:5a2b: 90 80 33           MOV DPTR | #0x8033
CODE:5a2e: e4                 CLR A
CODE:5a2f: f0                 MOVX @DPTR | A
CODE:5a30: a3                 INC DPTR
CODE:5a31: 04                 INC A
CODE:5a32: f0                 MOVX @DPTR | A
CODE:5a33: 80 2f              SJMP 0x5a64

; ===== FUN_CODE_5a35 =====
CODE:5a35: 90 8a 47           MOV DPTR | #0x8a47
CODE:5a38: e0                 MOVX A | @DPTR
CODE:5a39: b4 2e 0c           CJNE A | #0x2e | 0x5a48
CODE:5a3c: 90 80 33           MOV DPTR | #0x8033
CODE:5a3f: e0                 MOVX A | @DPTR
CODE:5a40: 70 04              JNZ 0x5a46
CODE:5a42: a3                 INC DPTR
CODE:5a43: e0                 MOVX A | @DPTR
CODE:5a44: 64 01              XRL A | #0x1

; ===== FUN_CODE_5a46 =====
CODE:5a46: 60 1c              JZ 0x5a64

; ===== FUN_CODE_5a48 =====
CODE:5a48: 90 8b 3c           MOV DPTR | #0x8b3c
CODE:5a4b: 74 01              MOV A | #0x1
CODE:5a4d: f0                 MOVX @DPTR | A
CODE:5a4e: a3                 INC DPTR
CODE:5a4f: 74 8a              MOV A | #0x8a
CODE:5a51: f0                 MOVX @DPTR | A
CODE:5a52: a3                 INC DPTR
CODE:5a53: 74 47              MOV A | #0x47
CODE:5a55: f0                 MOVX @DPTR | A
CODE:5a56: a3                 INC DPTR
CODE:5a57: e4                 CLR A
CODE:5a58: f0                 MOVX @DPTR | A
CODE:5a59: a3                 INC DPTR
CODE:5a5a: 04                 INC A
CODE:5a5b: f0                 MOVX @DPTR | A
CODE:5a5c: fb                 MOV R3 | A
CODE:5a5d: 7a 86              MOV R2 | #0x86
CODE:5a5f: 79 61              MOV R1 | #0x61
CODE:5a61: 12 51 63           LCALL 0x5163

; ===== FUN_CODE_5a64 =====
CODE:5a64: 7b 01              MOV R3 | #0x1
CODE:5a66: 7a 86              MOV R2 | #0x86
CODE:5a68: 79 61              MOV R1 | #0x61
CODE:5a6a: 12 52 f8           LCALL 0x52f8
CODE:5a6d: 90 8a 49           MOV DPTR | #0x8a49
CODE:5a70: ef                 MOV A | R7
CODE:5a71: f0                 MOVX @DPTR | A
CODE:5a72: 78 9e              MOV R0 | #0x9e
CODE:5a74: 7c 80              MOV R4 | #0x80
CODE:5a76: 7d 01              MOV R5 | #0x1
CODE:5a78: 7b 01              MOV R3 | #0x1
CODE:5a7a: 7a 86              MOV R2 | #0x86
CODE:5a7c: 79 61              MOV R1 | #0x61
CODE:5a7e: 12 47 6b           LCALL 0x476b
CODE:5a81: 90 8a 49           MOV DPTR | #0x8a49
CODE:5a84: e0                 MOVX A | @DPTR
CODE:5a85: ff                 MOV R7 | A
CODE:5a86: c3                 CLR CY
CODE:5a87: 74 0c              MOV A | #0xc
CODE:5a89: 9f                 SUBB A | R7
CODE:5a8a: f0                 MOVX @DPTR | A

; ===== FUN_CODE_5a8b =====
CODE:5a8b: 90 8a 49           MOV DPTR | #0x8a49
CODE:5a8e: e0                 MOVX A | @DPTR
CODE:5a8f: 60 1f              JZ 0x5ab0
CODE:5a91: 90 8b 3c           MOV DPTR | #0x8b3c
CODE:5a94: 74 ff              MOV A | #0xff
CODE:5a96: f0                 MOVX @DPTR | A
CODE:5a97: a3                 INC DPTR
CODE:5a98: 74 2d              MOV A | #0x2d
CODE:5a9a: f0                 MOVX @DPTR | A
CODE:5a9b: a3                 INC DPTR
CODE:5a9c: 74 e6              MOV A | #0xe6
CODE:5a9e: f0                 MOVX @DPTR | A
CODE:5a9f: 7b 01              MOV R3 | #0x1
CODE:5aa1: 7a 80              MOV R2 | #0x80
CODE:5aa3: 79 9e              MOV R1 | #0x9e
CODE:5aa5: 12 50 f8           LCALL 0x50f8
CODE:5aa8: 90 8a 49           MOV DPTR | #0x8a49
CODE:5aab: e0                 MOVX A | @DPTR
CODE:5aac: 14                 DEC A
CODE:5aad: f0                 MOVX @DPTR | A
CODE:5aae: 80 db              SJMP 0x5a8b

; ===== FUN_CODE_5ab0 =====
CODE:5ab0: 20 0a 1c           JB 0x0a | 0x5acf
CODE:5ab3: 7f 17              MOV R7 | #0x17
CODE:5ab5: 12 ef df           LCALL 0xefdf
CODE:5ab8: 7b ff              MOV R3 | #0xff
CODE:5aba: 7a 2d              MOV R2 | #0x2d
CODE:5abc: 79 e8              MOV R1 | #0xe8
CODE:5abe: 12 ef 5c           LCALL 0xef5c
CODE:5ac1: 7f 57              MOV R7 | #0x57
CODE:5ac3: 12 ef df           LCALL 0xefdf
CODE:5ac6: 7b ff              MOV R3 | #0xff
CODE:5ac8: 7a 2d              MOV R2 | #0x2d
CODE:5aca: 79 e8              MOV R1 | #0xe8
CODE:5acc: 12 ef 5c           LCALL 0xef5c

; ===== FUN_CODE_5acf =====
CODE:5acf: 7f 1c              MOV R7 | #0x1c
CODE:5ad1: 12 ef df           LCALL 0xefdf
CODE:5ad4: 7b 01              MOV R3 | #0x1
CODE:5ad6: 7a 80              MOV R2 | #0x80
CODE:5ad8: 79 9e              MOV R1 | #0x9e
CODE:5ada: 12 ef 5c           LCALL 0xef5c
CODE:5add: 30 0b 06           JNB 0x0b | 0x5ae6
CODE:5ae0: e4                 CLR A
CODE:5ae1: 90 86 61           MOV DPTR | #0x8661
CODE:5ae4: f0                 MOVX @DPTR | A
CODE:5ae5: 22                 RET 

; ===== FUN_CODE_5ae6 =====
CODE:5ae6: d2 0a              SETB 0x0a
CODE:5ae8: 22                 RET 

; ===== FUN_CODE_ef5c =====
CODE:ef5c: 90 8a e2           MOV DPTR | #0x8ae2
CODE:ef5f: eb                 MOV A | R3
CODE:ef60: f0                 MOVX @DPTR | A
CODE:ef61: a3                 INC DPTR
CODE:ef62: ea                 MOV A | R2
CODE:ef63: f0                 MOVX @DPTR | A
CODE:ef64: a3                 INC DPTR
CODE:ef65: e9                 MOV A | R1
CODE:ef66: f0                 MOVX @DPTR | A
CODE:ef67: 12 ef fe           LCALL 0xeffe
CODE:ef6a: 90 7e 01           MOV DPTR | #0x7e01
CODE:ef6d: 74 38              MOV A | #0x38
CODE:ef6f: f0                 MOVX @DPTR | A
CODE:ef70: 12 f0 11           LCALL 0xf011
CODE:ef73: 90 7e 01           MOV DPTR | #0x7e01
CODE:ef76: 74 06              MOV A | #0x6
CODE:ef78: f0                 MOVX @DPTR | A
CODE:ef79: 12 f0 11           LCALL 0xf011
CODE:ef7c: 90 7e 01           MOV DPTR | #0x7e01
CODE:ef7f: 74 0c              MOV A | #0xc
CODE:ef81: f0                 MOVX @DPTR | A
CODE:ef82: 12 f0 11           LCALL 0xf011
CODE:ef85: 90 80 54           MOV DPTR | #0x8054
CODE:ef88: e0                 MOVX A | @DPTR
CODE:ef89: 54 f3              ANL A | #0xf3
CODE:ef8b: f0                 MOVX @DPTR | A
CODE:ef8c: 44 10              ORL A | #0x10
CODE:ef8e: f0                 MOVX @DPTR | A
CODE:ef8f: 90 7d 02           MOV DPTR | #0x7d02
CODE:ef92: f0                 MOVX @DPTR | A
CODE:ef93: 90 8a e2           MOV DPTR | #0x8ae2
CODE:ef96: e0                 MOVX A | @DPTR
CODE:ef97: fb                 MOV R3 | A
CODE:ef98: a3                 INC DPTR
CODE:ef99: e0                 MOVX A | @DPTR
CODE:ef9a: fa                 MOV R2 | A
CODE:ef9b: a3                 INC DPTR
CODE:ef9c: e0                 MOVX A | @DPTR
CODE:ef9d: f9                 MOV R1 | A
CODE:ef9e: 12 40 f6           LCALL 0x40f6
CODE:efa1: 78 1e              MOV R0 | #0x1e
CODE:efa3: f6                 MOV @R0 | A

; ===== FUN_CODE_efa4 =====
CODE:efa4: 78 1e              MOV R0 | #0x1e
CODE:efa6: e6                 MOV A | @R0
CODE:efa7: 60 32              JZ 0xefdb
CODE:efa9: 90 8a e2           MOV DPTR | #0x8ae2
CODE:efac: e0                 MOVX A | @DPTR
CODE:efad: fb                 MOV R3 | A
CODE:efae: a3                 INC DPTR
CODE:efaf: e0                 MOVX A | @DPTR
CODE:efb0: fa                 MOV R2 | A
CODE:efb1: a3                 INC DPTR
CODE:efb2: e0                 MOVX A | @DPTR
CODE:efb3: f9                 MOV R1 | A
CODE:efb4: 12 40 f6           LCALL 0x40f6
CODE:efb7: 90 7e 01           MOV DPTR | #0x7e01
CODE:efba: f0                 MOVX @DPTR | A
CODE:efbb: 12 f0 11           LCALL 0xf011
CODE:efbe: 90 8a e3           MOV DPTR | #0x8ae3
CODE:efc1: e4                 CLR A
CODE:efc2: 75 f0 01           MOV B | #0x1
CODE:efc5: 12 42 0f           LCALL 0x420f
CODE:efc8: 90 8a e2           MOV DPTR | #0x8ae2
CODE:efcb: e0                 MOVX A | @DPTR
CODE:efcc: fb                 MOV R3 | A
CODE:efcd: a3                 INC DPTR
CODE:efce: e0                 MOVX A | @DPTR
CODE:efcf: fa                 MOV R2 | A
CODE:efd0: a3                 INC DPTR
CODE:efd1: e0                 MOVX A | @DPTR
CODE:efd2: f9                 MOV R1 | A
CODE:efd3: 12 40 f6           LCALL 0x40f6
CODE:efd6: 78 1e              MOV R0 | #0x1e
CODE:efd8: f6                 MOV @R0 | A
CODE:efd9: 80 c9              SJMP 0xefa4

; ===== FUN_CODE_efdb =====
CODE:efdb: 12 ef fe           LCALL 0xeffe
CODE:efde: 22                 RET 

; ===== FUN_CODE_efdf =====
CODE:efdf: 90 8a e2           MOV DPTR | #0x8ae2
CODE:efe2: ef                 MOV A | R7
CODE:efe3: f0                 MOVX @DPTR | A
CODE:efe4: 12 ef fe           LCALL 0xeffe
CODE:efe7: 90 7e 01           MOV DPTR | #0x7e01
CODE:efea: 74 02              MOV A | #0x2
CODE:efec: f0                 MOVX @DPTR | A
CODE:efed: 12 f0 11           LCALL 0xf011
CODE:eff0: 90 8a e2           MOV DPTR | #0x8ae2
CODE:eff3: e0                 MOVX A | @DPTR
CODE:eff4: 44 80              ORL A | #0x80
CODE:eff6: 90 7e 01           MOV DPTR | #0x7e01
CODE:eff9: f0                 MOVX @DPTR | A
CODE:effa: 12 f0 11           LCALL 0xf011
CODE:effd: 22                 RET 

; ===== FUN_CODE_effe =====
CODE:effe: 90 80 54           MOV DPTR | #0x8054
CODE:f001: e0                 MOVX A | @DPTR
CODE:f002: 54 e3              ANL A | #0xe3
CODE:f004: f0                 MOVX @DPTR | A
CODE:f005: 90 7d 02           MOV DPTR | #0x7d02
CODE:f008: f0                 MOVX @DPTR | A
CODE:f009: 7f 01              MOV R7 | #0x1
CODE:f00b: 7e 00              MOV R6 | #0x0
CODE:f00d: 12 f0 62           LCALL 0xf062
CODE:f010: 22                 RET 

; ===== FUN_CODE_f011 =====
CODE:f011: 90 80 54           MOV DPTR | #0x8054
CODE:f014: e0                 MOVX A | @DPTR
CODE:f015: 44 04              ORL A | #0x4
CODE:f017: f0                 MOVX @DPTR | A
CODE:f018: 90 7d 02           MOV DPTR | #0x7d02
CODE:f01b: f0                 MOVX @DPTR | A
CODE:f01c: 54 fb              ANL A | #0xfb
CODE:f01e: 90 80 54           MOV DPTR | #0x8054
CODE:f021: f0                 MOVX @DPTR | A
CODE:f022: 90 7d 02           MOV DPTR | #0x7d02
CODE:f025: f0                 MOVX @DPTR | A
CODE:f026: 7f 01              MOV R7 | #0x1
CODE:f028: 7e 00              MOV R6 | #0x0
CODE:f02a: 12 f0 62           LCALL 0xf062
CODE:f02d: 22                 RET 

; ===== FUN_CODE_f062 =====
CODE:f062: e4                 CLR A
CODE:f063: fd                 MOV R5 | A
CODE:f064: fc                 MOV R4 | A

; ===== FUN_CODE_f065 =====
CODE:f065: c3                 CLR CY
CODE:f066: ed                 MOV A | R5
CODE:f067: 9f                 SUBB A | R7
CODE:f068: ee                 MOV A | R6
CODE:f069: 64 80              XRL A | #0x80
CODE:f06b: f8                 MOV R0 | A
CODE:f06c: ec                 MOV A | R4
CODE:f06d: 64 80              XRL A | #0x80
CODE:f06f: 98                 SUBB A | R0
CODE:f070: 50 15              JNC 0xf087
CODE:f072: e4                 CLR A
CODE:f073: fb                 MOV R3 | A
CODE:f074: fa                 MOV R2 | A

; ===== FUN_CODE_f075 =====
CODE:f075: 0b                 INC R3
CODE:f076: bb 00 01           CJNE R3 | #0x0 | 0xf07a
CODE:f079: 0a                 INC R2

; ===== FUN_CODE_f07a =====
CODE:f07a: eb                 MOV A | R3
CODE:f07b: 64 c8              XRL A | #0xc8
CODE:f07d: 4a                 ORL A | R2
CODE:f07e: 70 f5              JNZ 0xf075
CODE:f080: 0d                 INC R5
CODE:f081: bd 00 01           CJNE R5 | #0x0 | 0xf085
CODE:f084: 0c                 INC R4

; ===== FUN_CODE_f085 =====
CODE:f085: 80 de              SJMP 0xf065

; ===== FUN_CODE_f087 =====
CODE:f087: 22                 RET 
