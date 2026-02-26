
; ===== thunk_FUN_CODE_37f9 =====
CODE:0000: 02 37 f9           LJMP 0x37f9

; ===== FUN_CODE_0003 =====
CODE:0003: ff                 MOV R7 | A
CODE:0004: ff                 MOV R7 | A
CODE:0005: ff                 MOV R7 | A
CODE:0006: ff                 MOV R7 | A
CODE:0007: ff                 MOV R7 | A
CODE:0008: ff                 MOV R7 | A
CODE:0009: ff                 MOV R7 | A
CODE:000a: ff                 MOV R7 | A

; ===== thunk_FUN_CODE_24dd =====
CODE:000b: 02 24 dd           LJMP 0x24dd

; ===== thunk_FUN_CODE_2619 =====
CODE:0013: 02 26 19           LJMP 0x2619

; ===== FUN_CODE_001b =====
CODE:001b: ff                 MOV R7 | A
CODE:001c: ff                 MOV R7 | A
CODE:001d: ff                 MOV R7 | A
CODE:001e: ff                 MOV R7 | A
CODE:001f: ff                 MOV R7 | A
CODE:0020: ff                 MOV R7 | A
CODE:0021: ff                 MOV R7 | A
CODE:0022: ff                 MOV R7 | A

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
CODE:0064: 12 38 c1           LCALL 0x38c1
CODE:0067: 12 1f 64           LCALL 0x1f64
CODE:006a: 90 80 35           MOV DPTR | #0x8035
CODE:006d: e0                 MOVX A | @DPTR
CODE:006e: 44 08              ORL A | #0x8
CODE:0070: f0                 MOVX @DPTR | A
CODE:0071: 90 7b 00           MOV DPTR | #0x7b00
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

; ===== FUN_CODE_0257 =====
CODE:0257: 12 1f 64           LCALL 0x1f64
CODE:025a: 90 80 f7           MOV DPTR | #0x80f7
CODE:025d: e0                 MOVX A | @DPTR
CODE:025e: 70 04              JNZ 0x0264
CODE:0260: a3                 INC DPTR
CODE:0261: e0                 MOVX A | @DPTR
CODE:0262: 64 04              XRL A | #0x4

; ===== FUN_CODE_0264 =====
CODE:0264: 70 15              JNZ 0x027b
CODE:0266: 90 8a 2a           MOV DPTR | #0x8a2a
CODE:0269: e0                 MOVX A | @DPTR
CODE:026a: 70 0f              JNZ 0x027b
CODE:026c: 20 1f 0c           JB 0x1f | 0x027b
CODE:026f: 20 08 09           JB 0x08 | 0x027b
CODE:0272: 7f e8              MOV R7 | #0xe8
CODE:0274: 7e 03              MOV R6 | #0x3
CODE:0276: 12 1f 7a           LCALL 0x1f7a
CODE:0279: d2 1f              SETB 0x1f

; ===== FUN_CODE_027b =====
CODE:027b: 12 1f 64           LCALL 0x1f64
CODE:027e: 90 80 f7           MOV DPTR | #0x80f7
CODE:0281: e0                 MOVX A | @DPTR
CODE:0282: 70 04              JNZ 0x0288
CODE:0284: a3                 INC DPTR
CODE:0285: e0                 MOVX A | @DPTR
CODE:0286: 64 05              XRL A | #0x5

; ===== FUN_CODE_0288 =====
CODE:0288: 70 0b              JNZ 0x0295
CODE:028a: 90 8a 2a           MOV DPTR | #0x8a2a
CODE:028d: e0                 MOVX A | @DPTR
CODE:028e: 70 05              JNZ 0x0295
CODE:0290: 20 08 02           JB 0x08 | 0x0295
CODE:0293: d2 08              SETB 0x08

; ===== FUN_CODE_0295 =====
CODE:0295: 90 81 08           MOV DPTR | #0x8108
CODE:0298: e0                 MOVX A | @DPTR
CODE:0299: 70 04              JNZ 0x029f
CODE:029b: a3                 INC DPTR
CODE:029c: e0                 MOVX A | @DPTR
CODE:029d: 64 0c              XRL A | #0xc

; ===== FUN_CODE_029f =====
CODE:029f: 70 03              JNZ 0x02a4
CODE:02a1: 02 03 55           LJMP 0x0355

; ===== FUN_CODE_02a4 =====
CODE:02a4: 30 08 03           JNB 0x08 | 0x02aa
CODE:02a7: 02 03 55           LJMP 0x0355

; ===== FUN_CODE_02aa =====
CODE:02aa: 12 2c ed           LCALL 0x2ced
CODE:02ad: ef                 MOV A | R7
CODE:02ae: 60 58              JZ 0x0308
CODE:02b0: 20 08 55           JB 0x08 | 0x0308
CODE:02b3: 12 1f 64           LCALL 0x1f64
CODE:02b6: 90 6f 02           MOV DPTR | #0x6f02
CODE:02b9: e0                 MOVX A | @DPTR
CODE:02ba: 30 e2 03           JNB 0xe2 | 0x02c0
CODE:02bd: 12 38 ee           LCALL 0x38ee

; ===== FUN_CODE_02c0 =====
CODE:02c0: 7f f4              MOV R7 | #0xf4
CODE:02c2: 7e 01              MOV R6 | #0x1
CODE:02c4: 7d 00              MOV R5 | #0x0
CODE:02c6: 7c 00              MOV R4 | #0x0
CODE:02c8: 90 81 c0           MOV DPTR | #0x81c0
CODE:02cb: e0                 MOVX A | @DPTR
CODE:02cc: f8                 MOV R0 | A
CODE:02cd: a3                 INC DPTR
CODE:02ce: e0                 MOVX A | @DPTR
CODE:02cf: f9                 MOV R1 | A
CODE:02d0: a3                 INC DPTR
CODE:02d1: e0                 MOVX A | @DPTR
CODE:02d2: fa                 MOV R2 | A
CODE:02d3: a3                 INC DPTR
CODE:02d4: e0                 MOVX A | @DPTR
CODE:02d5: fb                 MOV R3 | A
CODE:02d6: d3                 SETB CY
CODE:02d7: 12 43 e8           LCALL 0x43e8
CODE:02da: 40 ce              JC 0x02aa
CODE:02dc: 7f 17              MOV R7 | #0x17
CODE:02de: 12 38 c6           LCALL 0x38c6
CODE:02e1: 7b ff              MOV R3 | #0xff
CODE:02e3: 7a 22              MOV R2 | #0x22
CODE:02e5: 79 0b              MOV R1 | #0xb
CODE:02e7: 12 38 cb           LCALL 0x38cb

; ===== <no_function> =====
CODE:02fe: 00                 NOP 
CODE:02ff: 00                 NOP 
CODE:0300: 02 58 c2           LJMP 0x58c2

; ===== FUN_CODE_0308 =====
CODE:0308: 12 2b a8           LCALL 0x2ba8
CODE:030b: ef                 MOV A | R7
CODE:030c: 60 47              JZ 0x0355
CODE:030e: 20 08 44           JB 0x08 | 0x0355
CODE:0311: 12 1f 64           LCALL 0x1f64
CODE:0314: 90 6f 02           MOV DPTR | #0x6f02
CODE:0317: e0                 MOVX A | @DPTR
CODE:0318: 30 e2 03           JNB 0xe2 | 0x031e
CODE:031b: 12 38 ee           LCALL 0x38ee

; ===== FUN_CODE_031e =====
CODE:031e: 90 80 35           MOV DPTR | #0x8035
CODE:0321: e0                 MOVX A | @DPTR
CODE:0322: 44 08              ORL A | #0x8
CODE:0324: f0                 MOVX @DPTR | A
CODE:0325: 90 7b 00           MOV DPTR | #0x7b00
CODE:0328: f0                 MOVX @DPTR | A
CODE:0329: 44 20              ORL A | #0x20
CODE:032b: 90 80 35           MOV DPTR | #0x8035
CODE:032e: f0                 MOVX @DPTR | A
CODE:032f: 90 7b 00           MOV DPTR | #0x7b00
CODE:0332: f0                 MOVX @DPTR | A
CODE:0333: 7f 17              MOV R7 | #0x17
CODE:0335: 12 38 c6           LCALL 0x38c6
CODE:0338: 7b ff              MOV R3 | #0xff
CODE:033a: 7a 22              MOV R2 | #0x22
CODE:033c: 79 2f              MOV R1 | #0x2f
CODE:033e: 12 38 cb           LCALL 0x38cb

; ===== FUN_CODE_0355 =====
CODE:0355: 90 81 c0           MOV DPTR | #0x81c0
CODE:0358: 12 44 56           LCALL 0x4456

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

; ===== FUN_CODE_1f46 =====
CODE:1f46: 7f 57              MOV R7 | #0x57
CODE:1f48: 12 38 c6           LCALL 0x38c6
CODE:1f4b: 7b ff              MOV R3 | #0xff
CODE:1f4d: 7a 23              MOV R2 | #0x23
CODE:1f4f: 79 19              MOV R1 | #0x19
CODE:1f51: 12 38 cb           LCALL 0x38cb

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

; ===== FUN_CODE_1f7a =====
CODE:1f7a: 90 80 35           MOV DPTR | #0x8035
CODE:1f7d: e0                 MOVX A | @DPTR
CODE:1f7e: 44 20              ORL A | #0x20
CODE:1f80: f0                 MOVX @DPTR | A
CODE:1f81: 90 7b 00           MOV DPTR | #0x7b00
CODE:1f84: f0                 MOVX @DPTR | A
CODE:1f85: 12 1f 97           LCALL 0x1f97
CODE:1f88: 90 80 35           MOV DPTR | #0x8035
CODE:1f8b: e0                 MOVX A | @DPTR
CODE:1f8c: 54 df              ANL A | #0xdf
CODE:1f8e: f0                 MOVX @DPTR | A
CODE:1f8f: 54 df              ANL A | #0xdf
CODE:1f91: f0                 MOVX @DPTR | A
CODE:1f92: 90 7b 00           MOV DPTR | #0x7b00
CODE:1f95: f0                 MOVX @DPTR | A
CODE:1f96: 22                 RET 

; ===== FUN_CODE_1f97 =====
CODE:1f97: 90 8a e2           MOV DPTR | #0x8ae2
CODE:1f9a: ee                 MOV A | R6
CODE:1f9b: f0                 MOVX @DPTR | A
CODE:1f9c: a3                 INC DPTR
CODE:1f9d: ef                 MOV A | R7
CODE:1f9e: f0                 MOVX @DPTR | A
CODE:1f9f: 90 81 bc           MOV DPTR | #0x81bc
CODE:1fa2: 12 44 56           LCALL 0x4456

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

; ===== <no_function> =====
CODE:256c: 00                 NOP 
CODE:256d: 00                 NOP 
CODE:256e: 00                 NOP 
CODE:256f: 00                 NOP 

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

; ===== FUN_CODE_2ba8 =====
CODE:2ba8: e4                 CLR A
CODE:2ba9: 90 8a 42           MOV DPTR | #0x8a42
CODE:2bac: f0                 MOVX @DPTR | A
CODE:2bad: a3                 INC DPTR
CODE:2bae: f0                 MOVX @DPTR | A
CODE:2baf: a3                 INC DPTR
CODE:2bb0: f0                 MOVX @DPTR | A
CODE:2bb1: a3                 INC DPTR
CODE:2bb2: f0                 MOVX @DPTR | A
CODE:2bb3: a3                 INC DPTR
CODE:2bb4: f0                 MOVX @DPTR | A
CODE:2bb5: 90 80 5c           MOV DPTR | #0x805c
CODE:2bb8: e0                 MOVX A | @DPTR
CODE:2bb9: 54 4f              ANL A | #0x4f
CODE:2bbb: f0                 MOVX @DPTR | A
CODE:2bbc: 90 7e 02           MOV DPTR | #0x7e02
CODE:2bbf: f0                 MOVX @DPTR | A
CODE:2bc0: 90 80 50           MOV DPTR | #0x8050
CODE:2bc3: 74 70              MOV A | #0x70
CODE:2bc5: f0                 MOVX @DPTR | A
CODE:2bc6: 90 7b 02           MOV DPTR | #0x7b02
CODE:2bc9: f0                 MOVX @DPTR | A
CODE:2bca: 90 80 54           MOV DPTR | #0x8054
CODE:2bcd: e0                 MOVX A | @DPTR
CODE:2bce: 54 df              ANL A | #0xdf
CODE:2bd0: f0                 MOVX @DPTR | A
CODE:2bd1: 44 02              ORL A | #0x2
CODE:2bd3: f0                 MOVX @DPTR | A
CODE:2bd4: 90 7d 02           MOV DPTR | #0x7d02
CODE:2bd7: f0                 MOVX @DPTR | A
CODE:2bd8: 7f 07              MOV R7 | #0x7
CODE:2bda: 12 2a 0a           LCALL 0x2a0a
CODE:2bdd: 90 8a 43           MOV DPTR | #0x8a43
CODE:2be0: ee                 MOV A | R6
CODE:2be1: f0                 MOVX @DPTR | A
CODE:2be2: a3                 INC DPTR
CODE:2be3: ef                 MOV A | R7
CODE:2be4: f0                 MOVX @DPTR | A
CODE:2be5: 7f 08              MOV R7 | #0x8
CODE:2be7: 12 2a 0a           LCALL 0x2a0a
CODE:2bea: 90 8a 45           MOV DPTR | #0x8a45
CODE:2bed: ee                 MOV A | R6
CODE:2bee: f0                 MOVX @DPTR | A
CODE:2bef: a3                 INC DPTR
CODE:2bf0: ef                 MOV A | R7
CODE:2bf1: f0                 MOVX @DPTR | A
CODE:2bf2: d3                 SETB CY
CODE:2bf3: 90 8a 44           MOV DPTR | #0x8a44
CODE:2bf6: e0                 MOVX A | @DPTR
CODE:2bf7: 94 9a              SUBB A | #0x9a
CODE:2bf9: 90 8a 43           MOV DPTR | #0x8a43
CODE:2bfc: e0                 MOVX A | @DPTR
CODE:2bfd: 64 80              XRL A | #0x80
CODE:2bff: 94 81              SUBB A | #0x81
CODE:2c01: 50 11              JNC 0x2c14
CODE:2c03: d3                 SETB CY
CODE:2c04: 90 8a 46           MOV DPTR | #0x8a46
CODE:2c07: e0                 MOVX A | @DPTR
CODE:2c08: 94 2c              SUBB A | #0x2c
CODE:2c0a: 90 8a 45           MOV DPTR | #0x8a45
CODE:2c0d: e0                 MOVX A | @DPTR
CODE:2c0e: 64 80              XRL A | #0x80
CODE:2c10: 94 81              SUBB A | #0x81
CODE:2c12: 40 09              JC 0x2c1d

; ===== FUN_CODE_2c14 =====
CODE:2c14: 90 8a 42           MOV DPTR | #0x8a42
CODE:2c17: 74 01              MOV A | #0x1
CODE:2c19: f0                 MOVX @DPTR | A
CODE:2c1a: 02 2c b7           LJMP 0x2cb7

; ===== FUN_CODE_2c1d =====
CODE:2c1d: 90 81 bc           MOV DPTR | #0x81bc
CODE:2c20: 12 44 56           LCALL 0x4456

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

; ===== FUN_CODE_2ced =====
CODE:2ced: e4                 CLR A
CODE:2cee: 90 8a 77           MOV DPTR | #0x8a77
CODE:2cf1: f0                 MOVX @DPTR | A
CODE:2cf2: a3                 INC DPTR
CODE:2cf3: f0                 MOVX @DPTR | A
CODE:2cf4: 90 80 5c           MOV DPTR | #0x805c
CODE:2cf7: e0                 MOVX A | @DPTR
CODE:2cf8: 54 4f              ANL A | #0x4f
CODE:2cfa: f0                 MOVX @DPTR | A
CODE:2cfb: 90 7e 02           MOV DPTR | #0x7e02
CODE:2cfe: f0                 MOVX @DPTR | A
CODE:2cff: 90 80 50           MOV DPTR | #0x8050
CODE:2d02: 74 70              MOV A | #0x70
CODE:2d04: f0                 MOVX @DPTR | A
CODE:2d05: 90 7b 02           MOV DPTR | #0x7b02
CODE:2d08: f0                 MOVX @DPTR | A
CODE:2d09: 90 80 54           MOV DPTR | #0x8054
CODE:2d0c: e0                 MOVX A | @DPTR
CODE:2d0d: 54 df              ANL A | #0xdf
CODE:2d0f: f0                 MOVX @DPTR | A
CODE:2d10: 90 7d 02           MOV DPTR | #0x7d02
CODE:2d13: f0                 MOVX @DPTR | A
CODE:2d14: 7f 07              MOV R7 | #0x7
CODE:2d16: 12 2a 0a           LCALL 0x2a0a
CODE:2d19: d3                 SETB CY
CODE:2d1a: ef                 MOV A | R7
CODE:2d1b: 94 9a              SUBB A | #0x9a
CODE:2d1d: ee                 MOV A | R6
CODE:2d1e: 64 80              XRL A | #0x80
CODE:2d20: 94 81              SUBB A | #0x81
CODE:2d22: 40 1a              JC 0x2d3e
CODE:2d24: 7f 0e              MOV R7 | #0xe
CODE:2d26: 12 2a 0a           LCALL 0x2a0a
CODE:2d29: d3                 SETB CY
CODE:2d2a: ef                 MOV A | R7
CODE:2d2b: 94 36              SUBB A | #0x36
CODE:2d2d: ee                 MOV A | R6
CODE:2d2e: 64 80              XRL A | #0x80
CODE:2d30: 94 80              SUBB A | #0x80
CODE:2d32: 40 0a              JC 0x2d3e
CODE:2d34: 90 8a 77           MOV DPTR | #0x8a77
CODE:2d37: e4                 CLR A
CODE:2d38: f0                 MOVX @DPTR | A
CODE:2d39: a3                 INC DPTR
CODE:2d3a: 04                 INC A
CODE:2d3b: f0                 MOVX @DPTR | A
CODE:2d3c: 80 28              SJMP 0x2d66

; ===== FUN_CODE_2d3e =====
CODE:2d3e: 7f 08              MOV R7 | #0x8
CODE:2d40: 12 2a 0a           LCALL 0x2a0a
CODE:2d43: d3                 SETB CY
CODE:2d44: ef                 MOV A | R7
CODE:2d45: 94 7a              SUBB A | #0x7a
CODE:2d47: ee                 MOV A | R6
CODE:2d48: 64 80              XRL A | #0x80
CODE:2d4a: 94 80              SUBB A | #0x80
CODE:2d4c: 40 18              JC 0x2d66
CODE:2d4e: 7f 0f              MOV R7 | #0xf
CODE:2d50: 12 2a 0a           LCALL 0x2a0a
CODE:2d53: d3                 SETB CY
CODE:2d54: ef                 MOV A | R7
CODE:2d55: 94 36              SUBB A | #0x36
CODE:2d57: ee                 MOV A | R6
CODE:2d58: 64 80              XRL A | #0x80
CODE:2d5a: 94 80              SUBB A | #0x80
CODE:2d5c: 40 08              JC 0x2d66
CODE:2d5e: 90 8a 77           MOV DPTR | #0x8a77
CODE:2d61: e4                 CLR A
CODE:2d62: f0                 MOVX @DPTR | A
CODE:2d63: a3                 INC DPTR
CODE:2d64: 04                 INC A
CODE:2d65: f0                 MOVX @DPTR | A

; ===== FUN_CODE_2d66 =====
CODE:2d66: 90 8a 78           MOV DPTR | #0x8a78
CODE:2d69: e0                 MOVX A | @DPTR
CODE:2d6a: ff                 MOV R7 | A

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

; ===== FUN_CODE_38c1 =====
CODE:38c1: 90 f0 2e           MOV DPTR | #0xf02e
CODE:38c4: 01 9d              AJMP 0x389d

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

; ===== FUN_CODE_3939 =====
CODE:3939: 90 b2 b0           MOV DPTR | #0xb2b0
CODE:393c: 01 85              AJMP 0x3885

; ===== FUN_CODE_39ef =====
CODE:39ef: ef                 MOV A | R7
CODE:39f0: c3                 CLR CY
CODE:39f1: 94 30              SUBB A | #0x30
CODE:39f3: 40 09              JC 0x39fe
CODE:39f5: ef                 MOV A | R7
CODE:39f6: c3                 CLR CY
CODE:39f7: 94 3a              SUBB A | #0x3a
CODE:39f9: 50 03              JNC 0x39fe
CODE:39fb: d3                 SETB CY
CODE:39fc: 80 01              SJMP 0x39ff

; ===== FUN_CODE_39fe =====
CODE:39fe: c3                 CLR CY

; ===== FUN_CODE_39ff =====
CODE:39ff: 22                 RET 

; ===== FUN_CODE_3a00 =====
CODE:3a00: 43 90 01           ORL 0x90 | #0x1
CODE:3a03: 53 90 fe           ANL 0x90 | #0xfe
CODE:3a06: 22                 RET 

; ===== FUN_CODE_3a08 =====
CODE:3a08: 43 90 01           ORL 0x90 | #0x1
CODE:3a0b: 22                 RET 

; ===== thunk_FUN_CODE_3dbd =====
CODE:3a0c: 02 3d bd           LJMP 0x3dbd

; ===== FUN_CODE_3a0f =====
CODE:3a0f: e8                 MOV A | R0
CODE:3a10: 64 80              XRL A | #0x80
CODE:3a12: f8                 MOV R0 | A

; ===== FUN_CODE_3a13 =====
CODE:3a13: e9                 MOV A | R1
CODE:3a14: 33                 RLC A
CODE:3a15: e8                 MOV A | R0
CODE:3a16: 33                 RLC A
CODE:3a17: 60 11              JZ 0x3a2a
CODE:3a19: 04                 INC A
CODE:3a1a: 60 f0              JZ 0x3a0c
CODE:3a1c: ed                 MOV A | R5
CODE:3a1d: 33                 RLC A
CODE:3a1e: ec                 MOV A | R4
CODE:3a1f: 33                 RLC A
CODE:3a20: 70 09              JNZ 0x3a2b
CODE:3a22: e8                 MOV A | R0
CODE:3a23: fc                 MOV R4 | A
CODE:3a24: e9                 MOV A | R1
CODE:3a25: fd                 MOV R5 | A
CODE:3a26: ea                 MOV A | R2
CODE:3a27: fe                 MOV R6 | A
CODE:3a28: eb                 MOV A | R3
CODE:3a29: ff                 MOV R7 | A

; ===== FUN_CODE_3a2a =====
CODE:3a2a: 22                 RET 

; ===== FUN_CODE_3a2b =====
CODE:3a2b: 04                 INC A
CODE:3a2c: 60 de              JZ 0x3a0c
CODE:3a2e: d3                 SETB CY
CODE:3a2f: eb                 MOV A | R3
CODE:3a30: 9f                 SUBB A | R7
CODE:3a31: ea                 MOV A | R2
CODE:3a32: 9e                 SUBB A | R6
CODE:3a33: e9                 MOV A | R1
CODE:3a34: 9d                 SUBB A | R5
CODE:3a35: e8                 MOV A | R0
CODE:3a36: c2 e7              CLR 0xe7
CODE:3a38: 8c f0              MOV B | R4
CODE:3a3a: c2 f7              CLR 0xf7
CODE:3a3c: 95 f0              SUBB A | B
CODE:3a3e: 40 0c              JC 0x3a4c
CODE:3a40: e8                 MOV A | R0
CODE:3a41: cc                 XCH A | R4
CODE:3a42: f8                 MOV R0 | A
CODE:3a43: e9                 MOV A | R1
CODE:3a44: cd                 XCH A | R5
CODE:3a45: f9                 MOV R1 | A
CODE:3a46: ea                 MOV A | R2
CODE:3a47: ce                 XCH A | R6
CODE:3a48: fa                 MOV R2 | A
CODE:3a49: eb                 MOV A | R3
CODE:3a4a: cf                 XCH A | R7
CODE:3a4b: fb                 MOV R3 | A

; ===== FUN_CODE_3a4c =====
CODE:3a4c: 12 3d 88           LCALL 0x3d88
CODE:3a4f: 85 d0 f0           MOV B | PSW
CODE:3a52: 58                 ANL A | R0
CODE:3a53: 04                 INC A
CODE:3a54: 70 03              JNZ 0x3a59
CODE:3a56: 20 d5 b3           JB 0xd5 | 0x3a0c

; ===== FUN_CODE_3a59 =====
CODE:3a59: e8                 MOV A | R0
CODE:3a5a: 04                 INC A
CODE:3a5b: 70 07              JNZ 0x3a64
CODE:3a5d: 50 02              JNC 0x3a61
CODE:3a5f: b2 d5              CPL 0xd5

; ===== thunk_FUN_CODE_3dc7 =====
CODE:3a61: 02 3d c7           LJMP 0x3dc7

; ===== FUN_CODE_3a64 =====
CODE:3a64: 92 d5              MOV 0xd5 | CY
CODE:3a66: ec                 MOV A | R4
CODE:3a67: 04                 INC A
CODE:3a68: 60 f7              JZ 0x3a61
CODE:3a6a: e4                 CLR A
CODE:3a6b: cc                 XCH A | R4
CODE:3a6c: c0 e0              PUSH A
CODE:3a6e: c3                 CLR CY
CODE:3a6f: 98                 SUBB A | R0
CODE:3a70: f8                 MOV R0 | A
CODE:3a71: 60 3b              JZ 0x3aae
CODE:3a73: 94 18              SUBB A | #0x18
CODE:3a75: 60 08              JZ 0x3a7f
CODE:3a77: 40 0d              JC 0x3a86
CODE:3a79: d0 e0              POP A
CODE:3a7b: fb                 MOV R3 | A
CODE:3a7c: 02 3d 9f           LJMP 0x3d9f

; ===== FUN_CODE_3a7f =====
CODE:3a7f: e4                 CLR A
CODE:3a80: fb                 MOV R3 | A
CODE:3a81: fa                 MOV R2 | A
CODE:3a82: c9                 XCH A | R1
CODE:3a83: fc                 MOV R4 | A
CODE:3a84: 80 28              SJMP 0x3aae

; ===== FUN_CODE_3a86 =====
CODE:3a86: e8                 MOV A | R0
CODE:3a87: 30 e4 06           JNB 0xe4 | 0x3a90
CODE:3a8a: e4                 CLR A
CODE:3a8b: c9                 XCH A | R1
CODE:3a8c: fb                 MOV R3 | A
CODE:3a8d: e4                 CLR A
CODE:3a8e: ca                 XCH A | R2
CODE:3a8f: fc                 MOV R4 | A

; ===== FUN_CODE_3a90 =====
CODE:3a90: e8                 MOV A | R0
CODE:3a91: 30 e3 05           JNB 0xe3 | 0x3a99
CODE:3a94: e4                 CLR A
CODE:3a95: c9                 XCH A | R1
CODE:3a96: ca                 XCH A | R2
CODE:3a97: cb                 XCH A | R3
CODE:3a98: fc                 MOV R4 | A

; ===== FUN_CODE_3a99 =====
CODE:3a99: e8                 MOV A | R0
CODE:3a9a: 54 07              ANL A | #0x7
CODE:3a9c: 60 10              JZ 0x3aae
CODE:3a9e: f8                 MOV R0 | A

; ===== FUN_CODE_3a9f =====
CODE:3a9f: c3                 CLR CY
CODE:3aa0: e9                 MOV A | R1
CODE:3aa1: 13                 RRC A
CODE:3aa2: f9                 MOV R1 | A
CODE:3aa3: ea                 MOV A | R2
CODE:3aa4: 13                 RRC A
CODE:3aa5: fa                 MOV R2 | A
CODE:3aa6: eb                 MOV A | R3
CODE:3aa7: 13                 RRC A
CODE:3aa8: fb                 MOV R3 | A
CODE:3aa9: ec                 MOV A | R4
CODE:3aaa: 13                 RRC A
CODE:3aab: fc                 MOV R4 | A
CODE:3aac: d8 f1              DJNZ R0 | 0x3a9f

; ===== FUN_CODE_3aae =====
CODE:3aae: 30 f5 2f           JNB 0xf5 | 0x3ae0
CODE:3ab1: c3                 CLR CY
CODE:3ab2: e4                 CLR A
CODE:3ab3: 9c                 SUBB A | R4
CODE:3ab4: fc                 MOV R4 | A
CODE:3ab5: ef                 MOV A | R7
CODE:3ab6: 9b                 SUBB A | R3
CODE:3ab7: ff                 MOV R7 | A
CODE:3ab8: ee                 MOV A | R6
CODE:3ab9: 9a                 SUBB A | R2
CODE:3aba: fe                 MOV R6 | A
CODE:3abb: ed                 MOV A | R5
CODE:3abc: 99                 SUBB A | R1
CODE:3abd: fd                 MOV R5 | A
CODE:3abe: d0 e0              POP A
CODE:3ac0: fb                 MOV R3 | A
CODE:3ac1: ef                 MOV A | R7
CODE:3ac2: 4e                 ORL A | R6
CODE:3ac3: 4d                 ORL A | R5
CODE:3ac4: 4c                 ORL A | R4
CODE:3ac5: 70 12              JNZ 0x3ad9
CODE:3ac7: 22                 RET 

; ===== FUN_CODE_3ac8 =====
CODE:3ac8: db 03              DJNZ R3 | 0x3acd
CODE:3aca: 02 3d c4           LJMP 0x3dc4

; ===== FUN_CODE_3acd =====
CODE:3acd: ec                 MOV A | R4
CODE:3ace: 2c                 ADD A | R4
CODE:3acf: fc                 MOV R4 | A
CODE:3ad0: ef                 MOV A | R7
CODE:3ad1: 33                 RLC A
CODE:3ad2: ff                 MOV R7 | A
CODE:3ad3: ee                 MOV A | R6
CODE:3ad4: 33                 RLC A
CODE:3ad5: fe                 MOV R6 | A
CODE:3ad6: ed                 MOV A | R5
CODE:3ad7: 33                 RLC A
CODE:3ad8: fd                 MOV R5 | A

; ===== FUN_CODE_3ad9 =====
CODE:3ad9: ed                 MOV A | R5
CODE:3ada: 30 e7 eb           JNB 0xe7 | 0x3ac8
CODE:3add: 02 3d 9f           LJMP 0x3d9f

; ===== FUN_CODE_3ae0 =====
CODE:3ae0: ef                 MOV A | R7
CODE:3ae1: 2b                 ADD A | R3
CODE:3ae2: ff                 MOV R7 | A
CODE:3ae3: ee                 MOV A | R6
CODE:3ae4: 3a                 ADDC A | R2
CODE:3ae5: fe                 MOV R6 | A
CODE:3ae6: ed                 MOV A | R5
CODE:3ae7: 39                 ADDC A | R1
CODE:3ae8: fd                 MOV R5 | A
CODE:3ae9: d0 e0              POP A
CODE:3aeb: fb                 MOV R3 | A
CODE:3aec: 50 13              JNC 0x3b01
CODE:3aee: 0b                 INC R3
CODE:3aef: bb 00 03           CJNE R3 | #0x0 | 0x3af5
CODE:3af2: 02 3d c7           LJMP 0x3dc7

; ===== FUN_CODE_3af5 =====
CODE:3af5: ed                 MOV A | R5
CODE:3af6: 13                 RRC A
CODE:3af7: fd                 MOV R5 | A
CODE:3af8: ee                 MOV A | R6
CODE:3af9: 13                 RRC A
CODE:3afa: fe                 MOV R6 | A
CODE:3afb: ef                 MOV A | R7
CODE:3afc: 13                 RRC A
CODE:3afd: ff                 MOV R7 | A
CODE:3afe: ec                 MOV A | R4
CODE:3aff: 13                 RRC A
CODE:3b00: fc                 MOV R4 | A

; ===== thunk_FUN_CODE_3d9f =====
CODE:3b01: 02 3d 9f           LJMP 0x3d9f

; ===== FUN_CODE_3b04 =====
CODE:3b04: ec                 MOV A | R4
CODE:3b05: 4d                 ORL A | R5
CODE:3b06: 60 11              JZ 0x3b19
CODE:3b08: e8                 MOV A | R0
CODE:3b09: 49                 ORL A | R1
CODE:3b0a: 70 17              JNZ 0x3b23
CODE:3b0c: ed                 MOV A | R5
CODE:3b0d: 33                 RLC A
CODE:3b0e: ec                 MOV A | R4
CODE:3b0f: 33                 RLC A
CODE:3b10: 04                 INC A
CODE:3b11: 60 0d              JZ 0x3b20
CODE:3b13: e4                 CLR A
CODE:3b14: fc                 MOV R4 | A
CODE:3b15: ff                 MOV R7 | A
CODE:3b16: fe                 MOV R6 | A
CODE:3b17: fd                 MOV R5 | A

; ===== FUN_CODE_3b18 =====
CODE:3b18: 22                 RET 

; ===== FUN_CODE_3b19 =====
CODE:3b19: e9                 MOV A | R1
CODE:3b1a: 33                 RLC A
CODE:3b1b: e8                 MOV A | R0
CODE:3b1c: 33                 RLC A
CODE:3b1d: 04                 INC A
CODE:3b1e: 70 f8              JNZ 0x3b18

; ===== thunk_FUN_CODE_3dbd =====
CODE:3b20: 02 3d bd           LJMP 0x3dbd

; ===== FUN_CODE_3b23 =====
CODE:3b23: 12 3d 88           LCALL 0x3d88
CODE:3b26: 58                 ANL A | R0
CODE:3b27: 04                 INC A
CODE:3b28: 60 09              JZ 0x3b33
CODE:3b2a: e4                 CLR A
CODE:3b2b: cc                 XCH A | R4
CODE:3b2c: 24 81              ADD A | #0x81
CODE:3b2e: 50 06              JNC 0x3b36
CODE:3b30: 28                 ADD A | R0
CODE:3b31: 50 09              JNC 0x3b3c

; ===== thunk_FUN_CODE_3dc7 =====
CODE:3b33: 02 3d c7           LJMP 0x3dc7

; ===== FUN_CODE_3b36 =====
CODE:3b36: 28                 ADD A | R0
CODE:3b37: 40 03              JC 0x3b3c
CODE:3b39: 02 3d c4           LJMP 0x3dc4

; ===== FUN_CODE_3b3c =====
CODE:3b3c: c0 e0              PUSH A
CODE:3b3e: eb                 MOV A | R3
CODE:3b3f: 4a                 ORL A | R2
CODE:3b40: 70 44              JNZ 0x3b86
CODE:3b42: b9 80 06           CJNE R1 | #0x80 | 0x3b4b

; ===== FUN_CODE_3b45 =====
CODE:3b45: d0 e0              POP A
CODE:3b47: fb                 MOV R3 | A
CODE:3b48: 02 3d b3           LJMP 0x3db3

; ===== FUN_CODE_3b4b =====
CODE:3b4b: ef                 MOV A | R7
CODE:3b4c: 4e                 ORL A | R6
CODE:3b4d: 70 1c              JNZ 0x3b6b
CODE:3b4f: bd 80 08           CJNE R5 | #0x80 | 0x3b5a

; ===== FUN_CODE_3b52 =====
CODE:3b52: eb                 MOV A | R3
CODE:3b53: ff                 MOV R7 | A
CODE:3b54: ea                 MOV A | R2
CODE:3b55: fe                 MOV R6 | A
CODE:3b56: e9                 MOV A | R1
CODE:3b57: fd                 MOV R5 | A
CODE:3b58: 80 eb              SJMP 0x3b45

; ===== FUN_CODE_3b5a =====
CODE:3b5a: e9                 MOV A | R1
CODE:3b5b: 8d f0              MOV B | R5
CODE:3b5d: a4                 MUL AB
CODE:3b5e: fe                 MOV R6 | A
CODE:3b5f: e5 f0              MOV A | B
CODE:3b61: 02 3b ed           LJMP 0x3bed

; ===== FUN_CODE_3b64 =====
CODE:3b64: e9                 MOV A | R1
CODE:3b65: cd                 XCH A | R5
CODE:3b66: f9                 MOV R1 | A
CODE:3b67: ea                 MOV A | R2
CODE:3b68: fe                 MOV R6 | A
CODE:3b69: eb                 MOV A | R3
CODE:3b6a: ff                 MOV R7 | A

; ===== FUN_CODE_3b6b =====
CODE:3b6b: ef                 MOV A | R7
CODE:3b6c: 89 f0              MOV B | R1
CODE:3b6e: a4                 MUL AB
CODE:3b6f: fc                 MOV R4 | A
CODE:3b70: e5 f0              MOV A | B
CODE:3b72: ce                 XCH A | R6
CODE:3b73: 89 f0              MOV B | R1
CODE:3b75: a4                 MUL AB
CODE:3b76: 2e                 ADD A | R6
CODE:3b77: ff                 MOV R7 | A
CODE:3b78: e4                 CLR A
CODE:3b79: 35 f0              ADDC A | B
CODE:3b7b: cd                 XCH A | R5
CODE:3b7c: 89 f0              MOV B | R1
CODE:3b7e: a4                 MUL AB
CODE:3b7f: 2d                 ADD A | R5
CODE:3b80: fe                 MOV R6 | A
CODE:3b81: e4                 CLR A
CODE:3b82: 35 f0              ADDC A | B
CODE:3b84: 80 67              SJMP 0x3bed

; ===== FUN_CODE_3b86 =====
CODE:3b86: ef                 MOV A | R7
CODE:3b87: 4e                 ORL A | R6
CODE:3b88: 70 05              JNZ 0x3b8f
CODE:3b8a: bd 80 d7           CJNE R5 | #0x80 | 0x3b64
CODE:3b8d: 80 c3              SJMP 0x3b52

; ===== FUN_CODE_3b8f =====
CODE:3b8f: ef                 MOV A | R7
CODE:3b90: 8b f0              MOV B | R3
CODE:3b92: a4                 MUL AB
CODE:3b93: ac f0              MOV R4 | B
CODE:3b95: ee                 MOV A | R6
CODE:3b96: 8b f0              MOV B | R3
CODE:3b98: a4                 MUL AB
CODE:3b99: 2c                 ADD A | R4
CODE:3b9a: fc                 MOV R4 | A
CODE:3b9b: e4                 CLR A
CODE:3b9c: 35 f0              ADDC A | B
CODE:3b9e: f8                 MOV R0 | A
CODE:3b9f: ef                 MOV A | R7
CODE:3ba0: 8a f0              MOV B | R2
CODE:3ba2: a4                 MUL AB
CODE:3ba3: 2c                 ADD A | R4
CODE:3ba4: e5 f0              MOV A | B
CODE:3ba6: 38                 ADDC A | R0
CODE:3ba7: fc                 MOV R4 | A
CODE:3ba8: e4                 CLR A
CODE:3ba9: 33                 RLC A
CODE:3baa: cb                 XCH A | R3
CODE:3bab: 8d f0              MOV B | R5
CODE:3bad: a4                 MUL AB
CODE:3bae: 2c                 ADD A | R4
CODE:3baf: fc                 MOV R4 | A
CODE:3bb0: e5 f0              MOV A | B
CODE:3bb2: 3b                 ADDC A | R3
CODE:3bb3: f8                 MOV R0 | A
CODE:3bb4: ee                 MOV A | R6
CODE:3bb5: 8a f0              MOV B | R2
CODE:3bb7: a4                 MUL AB
CODE:3bb8: 2c                 ADD A | R4
CODE:3bb9: fc                 MOV R4 | A
CODE:3bba: e5 f0              MOV A | B
CODE:3bbc: 38                 ADDC A | R0
CODE:3bbd: f8                 MOV R0 | A
CODE:3bbe: e4                 CLR A
CODE:3bbf: 33                 RLC A
CODE:3bc0: cf                 XCH A | R7
CODE:3bc1: 89 f0              MOV B | R1
CODE:3bc3: a4                 MUL AB
CODE:3bc4: 2c                 ADD A | R4
CODE:3bc5: fc                 MOV R4 | A
CODE:3bc6: e5 f0              MOV A | B
CODE:3bc8: 38                 ADDC A | R0
CODE:3bc9: cf                 XCH A | R7
CODE:3bca: 34 00              ADDC A | #0x0
CODE:3bcc: ce                 XCH A | R6
CODE:3bcd: 89 f0              MOV B | R1
CODE:3bcf: a4                 MUL AB
CODE:3bd0: 2f                 ADD A | R7
CODE:3bd1: ff                 MOV R7 | A
CODE:3bd2: e5 f0              MOV A | B
CODE:3bd4: 3e                 ADDC A | R6
CODE:3bd5: fe                 MOV R6 | A
CODE:3bd6: e4                 CLR A
CODE:3bd7: 33                 RLC A
CODE:3bd8: c9                 XCH A | R1
CODE:3bd9: 8d f0              MOV B | R5
CODE:3bdb: a4                 MUL AB
CODE:3bdc: 2e                 ADD A | R6
CODE:3bdd: fe                 MOV R6 | A
CODE:3bde: e5 f0              MOV A | B
CODE:3be0: 39                 ADDC A | R1
CODE:3be1: cd                 XCH A | R5
CODE:3be2: 8a f0              MOV B | R2
CODE:3be4: a4                 MUL AB
CODE:3be5: 2f                 ADD A | R7
CODE:3be6: ff                 MOV R7 | A
CODE:3be7: e5 f0              MOV A | B
CODE:3be9: 3e                 ADDC A | R6
CODE:3bea: fe                 MOV R6 | A
CODE:3beb: e4                 CLR A
CODE:3bec: 3d                 ADDC A | R5

; ===== FUN_CODE_3bed =====
CODE:3bed: fd                 MOV R5 | A
CODE:3bee: 33                 RLC A
CODE:3bef: d0 e0              POP A
CODE:3bf1: fb                 MOV R3 | A
CODE:3bf2: 50 07              JNC 0x3bfb
CODE:3bf4: 0b                 INC R3
CODE:3bf5: bb 00 0f           CJNE R3 | #0x0 | 0x3c07
CODE:3bf8: 02 3d c7           LJMP 0x3dc7

; ===== FUN_CODE_3bfb =====
CODE:3bfb: ec                 MOV A | R4
CODE:3bfc: 2c                 ADD A | R4
CODE:3bfd: fc                 MOV R4 | A
CODE:3bfe: ef                 MOV A | R7
CODE:3bff: 33                 RLC A
CODE:3c00: ff                 MOV R7 | A
CODE:3c01: ee                 MOV A | R6
CODE:3c02: 33                 RLC A
CODE:3c03: fe                 MOV R6 | A
CODE:3c04: ed                 MOV A | R5
CODE:3c05: 33                 RLC A
CODE:3c06: fd                 MOV R5 | A

; ===== thunk_FUN_CODE_3d9f =====
CODE:3c07: 02 3d 9f           LJMP 0x3d9f

; ===== FUN_CODE_3c0a =====
CODE:3c0a: 02 3d c7           LJMP 0x3dc7

; ===== FUN_CODE_3c0d =====
CODE:3c0d: ec                 MOV A | R4
CODE:3c0e: 5d                 ANL A | R5
CODE:3c0f: 04                 INC A
CODE:3c10: 60 05              JZ 0x3c17
CODE:3c12: e8                 MOV A | R0
CODE:3c13: 59                 ANL A | R1
CODE:3c14: 04                 INC A
CODE:3c15: 70 03              JNZ 0x3c1a

; ===== thunk_FUN_CODE_3dbd =====
CODE:3c17: 02 3d bd           LJMP 0x3dbd

; ===== FUN_CODE_3c1a =====
CODE:3c1a: 12 3d 88           LCALL 0x3d88
CODE:3c1d: 58                 ANL A | R0
CODE:3c1e: 04                 INC A
CODE:3c1f: 60 f6              JZ 0x3c17
CODE:3c21: ec                 MOV A | R4
CODE:3c22: 48                 ORL A | R0
CODE:3c23: 60 f2              JZ 0x3c17
CODE:3c25: ec                 MOV A | R4
CODE:3c26: 70 04              JNZ 0x3c2c
CODE:3c28: fd                 MOV R5 | A
CODE:3c29: fe                 MOV R6 | A
CODE:3c2a: ff                 MOV R7 | A
CODE:3c2b: 22                 RET 

; ===== FUN_CODE_3c2c =====
CODE:3c2c: c8                 XCH A | R0
CODE:3c2d: 24 81              ADD A | #0x81
CODE:3c2f: c8                 XCH A | R0
CODE:3c30: 50 07              JNC 0x3c39
CODE:3c32: c3                 CLR CY
CODE:3c33: 98                 SUBB A | R0
CODE:3c34: 50 06              JNC 0x3c3c

; ===== thunk_FUN_CODE_3dc4 =====
CODE:3c36: 02 3d c4           LJMP 0x3dc4

; ===== FUN_CODE_3c39 =====
CODE:3c39: 98                 SUBB A | R0
CODE:3c3a: 50 ce              JNC 0x3c0a

; ===== FUN_CODE_3c3c =====
CODE:3c3c: f5 82              MOV DPL | A
CODE:3c3e: e9                 MOV A | R1
CODE:3c3f: 29                 ADD A | R1
CODE:3c40: 4b                 ORL A | R3
CODE:3c41: 4a                 ORL A | R2
CODE:3c42: 70 05              JNZ 0x3c49
CODE:3c44: ab 82              MOV R3 | DPL
CODE:3c46: 02 3d b3           LJMP 0x3db3

; ===== FUN_CODE_3c49 =====
CODE:3c49: 75 f0 00           MOV B | #0x0
CODE:3c4c: 7c 1a              MOV R4 | #0x1a
CODE:3c4e: 78 80              MOV R0 | #0x80

; ===== FUN_CODE_3c50 =====
CODE:3c50: c3                 CLR CY
CODE:3c51: ef                 MOV A | R7
CODE:3c52: 9b                 SUBB A | R3
CODE:3c53: ee                 MOV A | R6
CODE:3c54: 9a                 SUBB A | R2
CODE:3c55: ed                 MOV A | R5
CODE:3c56: 99                 SUBB A | R1
CODE:3c57: 40 0d              JC 0x3c66

; ===== FUN_CODE_3c59 =====
CODE:3c59: c3                 CLR CY
CODE:3c5a: ef                 MOV A | R7
CODE:3c5b: 9b                 SUBB A | R3
CODE:3c5c: ff                 MOV R7 | A
CODE:3c5d: ee                 MOV A | R6
CODE:3c5e: 9a                 SUBB A | R2
CODE:3c5f: fe                 MOV R6 | A
CODE:3c60: ed                 MOV A | R5
CODE:3c61: 99                 SUBB A | R1
CODE:3c62: fd                 MOV R5 | A
CODE:3c63: e8                 MOV A | R0
CODE:3c64: 42 f0              ORL B | A

; ===== FUN_CODE_3c66 =====
CODE:3c66: dc 23              DJNZ R4 | 0x3c8b
CODE:3c68: ac f0              MOV R4 | B
CODE:3c6a: d0 e0              POP A
CODE:3c6c: ff                 MOV R7 | A
CODE:3c6d: d0 e0              POP A
CODE:3c6f: fe                 MOV R6 | A
CODE:3c70: d0 e0              POP A
CODE:3c72: fd                 MOV R5 | A
CODE:3c73: ab 82              MOV R3 | DPL
CODE:3c75: 20 e7 10           JB 0xe7 | 0x3c88
CODE:3c78: 1b                 DEC R3
CODE:3c79: eb                 MOV A | R3
CODE:3c7a: 60 ba              JZ 0x3c36
CODE:3c7c: ec                 MOV A | R4
CODE:3c7d: 2c                 ADD A | R4
CODE:3c7e: fc                 MOV R4 | A
CODE:3c7f: ef                 MOV A | R7
CODE:3c80: 33                 RLC A
CODE:3c81: ff                 MOV R7 | A
CODE:3c82: ee                 MOV A | R6
CODE:3c83: 33                 RLC A
CODE:3c84: fe                 MOV R6 | A
CODE:3c85: ed                 MOV A | R5
CODE:3c86: 33                 RLC A
CODE:3c87: fd                 MOV R5 | A

; ===== thunk_FUN_CODE_3d9f =====
CODE:3c88: 02 3d 9f           LJMP 0x3d9f

; ===== FUN_CODE_3c8b =====
CODE:3c8b: e8                 MOV A | R0
CODE:3c8c: 03                 RR A
CODE:3c8d: f8                 MOV R0 | A
CODE:3c8e: 30 e7 05           JNB 0xe7 | 0x3c96
CODE:3c91: c0 f0              PUSH B
CODE:3c93: 75 f0 00           MOV B | #0x0

; ===== FUN_CODE_3c96 =====
CODE:3c96: ef                 MOV A | R7
CODE:3c97: 2f                 ADD A | R7
CODE:3c98: ff                 MOV R7 | A
CODE:3c99: ee                 MOV A | R6
CODE:3c9a: 33                 RLC A
CODE:3c9b: fe                 MOV R6 | A
CODE:3c9c: ed                 MOV A | R5
CODE:3c9d: 33                 RLC A
CODE:3c9e: fd                 MOV R5 | A
CODE:3c9f: 40 b8              JC 0x3c59
CODE:3ca1: 30 e7 c2           JNB 0xe7 | 0x3c66
CODE:3ca4: 80 aa              SJMP 0x3c50

; ===== FUN_CODE_3ca6 =====
CODE:3ca6: 74 f8              MOV A | #0xf8
CODE:3ca8: cc                 XCH A | R4
CODE:3ca9: 64 80              XRL A | #0x80
CODE:3cab: cc                 XCH A | R4
CODE:3cac: c8                 XCH A | R0
CODE:3cad: 64 80              XRL A | #0x80
CODE:3caf: c8                 XCH A | R0
CODE:3cb0: f5 82              MOV DPL | A
CODE:3cb2: 04                 INC A
CODE:3cb3: 60 43              JZ 0x3cf8
CODE:3cb5: c3                 CLR CY
CODE:3cb6: eb                 MOV A | R3
CODE:3cb7: 9f                 SUBB A | R7
CODE:3cb8: f5 f0              MOV B | A
CODE:3cba: ea                 MOV A | R2
CODE:3cbb: 9e                 SUBB A | R6
CODE:3cbc: 42 f0              ORL B | A
CODE:3cbe: e9                 MOV A | R1
CODE:3cbf: 9d                 SUBB A | R5
CODE:3cc0: 42 f0              ORL B | A
CODE:3cc2: e8                 MOV A | R0
CODE:3cc3: 9c                 SUBB A | R4
CODE:3cc4: 45 f0              ORL A | B
CODE:3cc6: 60 30              JZ 0x3cf8
CODE:3cc8: 50 18              JNC 0x3ce2
CODE:3cca: e5 82              MOV A | DPL
CODE:3ccc: 5f                 ANL A | R7
CODE:3ccd: ff                 MOV R7 | A
CODE:3cce: e5 82              MOV A | DPL
CODE:3cd0: f4                 CPL A
CODE:3cd1: 2b                 ADD A | R3
CODE:3cd2: 55 82              ANL A | DPL
CODE:3cd4: fb                 MOV R3 | A
CODE:3cd5: 50 21              JNC 0x3cf8
CODE:3cd7: 0a                 INC R2
CODE:3cd8: ba 00 1d           CJNE R2 | #0x0 | 0x3cf8
CODE:3cdb: 09                 INC R1
CODE:3cdc: b9 00 19           CJNE R1 | #0x0 | 0x3cf8
CODE:3cdf: 08                 INC R0
CODE:3ce0: 80 16              SJMP 0x3cf8

; ===== FUN_CODE_3ce2 =====
CODE:3ce2: e5 82              MOV A | DPL
CODE:3ce4: 5b                 ANL A | R3
CODE:3ce5: fb                 MOV R3 | A
CODE:3ce6: e5 82              MOV A | DPL
CODE:3ce8: f4                 CPL A
CODE:3ce9: 2f                 ADD A | R7
CODE:3cea: 55 82              ANL A | DPL
CODE:3cec: ff                 MOV R7 | A
CODE:3ced: 50 09              JNC 0x3cf8
CODE:3cef: 0e                 INC R6
CODE:3cf0: be 00 05           CJNE R6 | #0x0 | 0x3cf8
CODE:3cf3: 0d                 INC R5
CODE:3cf4: bd 00 01           CJNE R5 | #0x0 | 0x3cf8
CODE:3cf7: 0c                 INC R4

; ===== FUN_CODE_3cf8 =====
CODE:3cf8: c3                 CLR CY
CODE:3cf9: eb                 MOV A | R3
CODE:3cfa: 9f                 SUBB A | R7
CODE:3cfb: f5 f0              MOV B | A
CODE:3cfd: ea                 MOV A | R2
CODE:3cfe: 9e                 SUBB A | R6
CODE:3cff: 42 f0              ORL B | A
CODE:3d01: e9                 MOV A | R1
CODE:3d02: 9d                 SUBB A | R5
CODE:3d03: 42 f0              ORL B | A
CODE:3d05: e8                 MOV A | R0
CODE:3d06: 9c                 SUBB A | R4
CODE:3d07: 45 f0              ORL A | B
CODE:3d09: 60 07              JZ 0x3d12
CODE:3d0b: cc                 XCH A | R4
CODE:3d0c: 48                 ORL A | R0
CODE:3d0d: 20 e7 01           JB 0xe7 | 0x3d11
CODE:3d10: b3                 CPL CY

; ===== FUN_CODE_3d11 =====
CODE:3d11: ec                 MOV A | R4

; ===== FUN_CODE_3d12 =====
CODE:3d12: 22                 RET 

; ===== FUN_CODE_3d18 =====
CODE:3d18: 75 f0 10           MOV B | #0x10
CODE:3d1b: 80 05              SJMP 0x3d22

; ===== FUN_CODE_3d22 =====
CODE:3d22: 7e 00              MOV R6 | #0x0
CODE:3d24: 7f 00              MOV R7 | #0x0
CODE:3d26: 33                 RLC A
CODE:3d27: 92 d5              MOV 0xd5 | CY
CODE:3d29: 30 d5 03           JNB 0xd5 | 0x3d2f
CODE:3d2c: 12 43 da           LCALL 0x43da

; ===== FUN_CODE_3d2f =====
CODE:3d2f: ec                 MOV A | R4
CODE:3d30: 33                 RLC A
CODE:3d31: 40 10              JC 0x3d43
CODE:3d33: ef                 MOV A | R7
CODE:3d34: 33                 RLC A
CODE:3d35: ff                 MOV R7 | A
CODE:3d36: ee                 MOV A | R6
CODE:3d37: 33                 RLC A
CODE:3d38: fe                 MOV R6 | A
CODE:3d39: ed                 MOV A | R5
CODE:3d3a: 33                 RLC A
CODE:3d3b: fd                 MOV R5 | A
CODE:3d3c: ec                 MOV A | R4
CODE:3d3d: 33                 RLC A
CODE:3d3e: fc                 MOV R4 | A
CODE:3d3f: d5 f0 ed           DJNZ B | 0x3d2f
CODE:3d42: 22                 RET 

; ===== FUN_CODE_3d43 =====
CODE:3d43: e5 f0              MOV A | B
CODE:3d45: 24 7e              ADD A | #0x7e
CODE:3d47: a2 d5              MOV CY | 0xd5
CODE:3d49: 13                 RRC A
CODE:3d4a: cc                 XCH A | R4
CODE:3d4b: 92 e7              MOV 0xe7 | CY
CODE:3d4d: cd                 XCH A | R5
CODE:3d4e: ce                 XCH A | R6
CODE:3d4f: ff                 MOV R7 | A
CODE:3d50: 22                 RET 

; ===== FUN_CODE_3d88 =====
CODE:3d88: e9                 MOV A | R1
CODE:3d89: d2 e7              SETB 0xe7
CODE:3d8b: c9                 XCH A | R1
CODE:3d8c: 33                 RLC A
CODE:3d8d: e8                 MOV A | R0
CODE:3d8e: 33                 RLC A
CODE:3d8f: f8                 MOV R0 | A
CODE:3d90: 92 d5              MOV 0xd5 | CY
CODE:3d92: ed                 MOV A | R5
CODE:3d93: d2 e7              SETB 0xe7
CODE:3d95: cd                 XCH A | R5
CODE:3d96: 33                 RLC A
CODE:3d97: ec                 MOV A | R4
CODE:3d98: 33                 RLC A
CODE:3d99: fc                 MOV R4 | A
CODE:3d9a: 50 02              JNC 0x3d9e
CODE:3d9c: b2 d5              CPL 0xd5

; ===== FUN_CODE_3d9e =====
CODE:3d9e: 22                 RET 

; ===== FUN_CODE_3d9f =====
CODE:3d9f: ec                 MOV A | R4
CODE:3da0: 30 e7 10           JNB 0xe7 | 0x3db3
CODE:3da3: 0f                 INC R7
CODE:3da4: bf 00 0c           CJNE R7 | #0x0 | 0x3db3
CODE:3da7: 0e                 INC R6
CODE:3da8: be 00 08           CJNE R6 | #0x0 | 0x3db3
CODE:3dab: 0d                 INC R5
CODE:3dac: bd 00 04           CJNE R5 | #0x0 | 0x3db3
CODE:3daf: 0b                 INC R3
CODE:3db0: eb                 MOV A | R3
CODE:3db1: 60 14              JZ 0x3dc7

; ===== FUN_CODE_3db3 =====
CODE:3db3: a2 d5              MOV CY | 0xd5
CODE:3db5: eb                 MOV A | R3
CODE:3db6: 13                 RRC A
CODE:3db7: fc                 MOV R4 | A
CODE:3db8: ed                 MOV A | R5
CODE:3db9: 92 e7              MOV 0xe7 | CY
CODE:3dbb: fd                 MOV R5 | A
CODE:3dbc: 22                 RET 

; ===== FUN_CODE_3dbd =====
CODE:3dbd: 74 ff              MOV A | #0xff

; ===== FUN_CODE_3dbf =====
CODE:3dbf: fc                 MOV R4 | A
CODE:3dc0: fd                 MOV R5 | A

; ===== FUN_CODE_3dc1 =====
CODE:3dc1: fe                 MOV R6 | A
CODE:3dc2: ff                 MOV R7 | A
CODE:3dc3: 22                 RET 

; ===== FUN_CODE_3dc4 =====
CODE:3dc4: e4                 CLR A
CODE:3dc5: 80 f8              SJMP 0x3dbf

; ===== FUN_CODE_3dc7 =====
CODE:3dc7: a2 d5              MOV CY | 0xd5
CODE:3dc9: 74 ff              MOV A | #0xff
CODE:3dcb: 13                 RRC A
CODE:3dcc: fc                 MOV R4 | A
CODE:3dcd: 7d 80              MOV R5 | #0x80
CODE:3dcf: 80 f0              SJMP 0x3dc1

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

; ===== FUN_CODE_4170 =====
CODE:4170: ef                 MOV A | R7
CODE:4171: f8                 MOV R0 | A
CODE:4172: 8d f0              MOV B | R5
CODE:4174: a4                 MUL AB
CODE:4175: ff                 MOV R7 | A
CODE:4176: ed                 MOV A | R5
CODE:4177: c5 f0              XCH A | B
CODE:4179: ce                 XCH A | R6
CODE:417a: a4                 MUL AB
CODE:417b: 2e                 ADD A | R6
CODE:417c: fe                 MOV R6 | A
CODE:417d: ec                 MOV A | R4
CODE:417e: 88 f0              MOV B | R0
CODE:4180: a4                 MUL AB
CODE:4181: 2e                 ADD A | R6
CODE:4182: fe                 MOV R6 | A
CODE:4183: 22                 RET 

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

; ===== FUN_CODE_43da =====
CODE:43da: c3                 CLR CY
CODE:43db: e4                 CLR A
CODE:43dc: 9f                 SUBB A | R7
CODE:43dd: ff                 MOV R7 | A
CODE:43de: e4                 CLR A
CODE:43df: 9e                 SUBB A | R6
CODE:43e0: fe                 MOV R6 | A
CODE:43e1: e4                 CLR A
CODE:43e2: 9d                 SUBB A | R5
CODE:43e3: fd                 MOV R5 | A
CODE:43e4: e4                 CLR A
CODE:43e5: 9c                 SUBB A | R4
CODE:43e6: fc                 MOV R4 | A
CODE:43e7: 22                 RET 

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

; ===== FUN_CODE_50b9 =====
CODE:50b9: ef                 MOV A | R7
CODE:50ba: c3                 CLR CY
CODE:50bb: 94 09              SUBB A | #0x9
CODE:50bd: 40 06              JC 0x50c5
CODE:50bf: ef                 MOV A | R7
CODE:50c0: c3                 CLR CY
CODE:50c1: 94 0e              SUBB A | #0xe
CODE:50c3: 40 04              JC 0x50c9

; ===== FUN_CODE_50c5 =====
CODE:50c5: ef                 MOV A | R7
CODE:50c6: b4 20 03           CJNE A | #0x20 | 0x50cc

; ===== FUN_CODE_50c9 =====
CODE:50c9: d3                 SETB CY
CODE:50ca: 80 01              SJMP 0x50cd

; ===== FUN_CODE_50cc =====
CODE:50cc: c3                 CLR CY

; ===== FUN_CODE_50cd =====
CODE:50cd: 22                 RET 

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

; ===== FUN_CODE_5334 =====
CODE:5334: 90 8b 2a           MOV DPTR | #0x8b2a
CODE:5337: e0                 MOVX A | @DPTR
CODE:5338: fb                 MOV R3 | A
CODE:5339: a3                 INC DPTR
CODE:533a: e0                 MOVX A | @DPTR
CODE:533b: fa                 MOV R2 | A
CODE:533c: a3                 INC DPTR
CODE:533d: e0                 MOVX A | @DPTR
CODE:533e: f9                 MOV R1 | A
CODE:533f: 12 40 f6           LCALL 0x40f6
CODE:5342: ff                 MOV R7 | A
CODE:5343: 12 50 b9           LCALL 0x50b9
CODE:5346: 50 0c              JNC 0x5354
CODE:5348: 90 8b 2b           MOV DPTR | #0x8b2b
CODE:534b: e4                 CLR A
CODE:534c: 75 f0 01           MOV B | #0x1
CODE:534f: 12 42 0f           LCALL 0x420f

; ===== FUN_CODE_5354 =====
CODE:5354: d2 39              SETB 0x39
CODE:5356: 90 8b 2a           MOV DPTR | #0x8b2a
CODE:5359: e0                 MOVX A | @DPTR
CODE:535a: fb                 MOV R3 | A
CODE:535b: a3                 INC DPTR
CODE:535c: e0                 MOVX A | @DPTR
CODE:535d: fa                 MOV R2 | A
CODE:535e: a3                 INC DPTR
CODE:535f: e0                 MOVX A | @DPTR
CODE:5360: f9                 MOV R1 | A
CODE:5361: 12 40 f6           LCALL 0x40f6
CODE:5364: ff                 MOV R7 | A
CODE:5365: 64 2b              XRL A | #0x2b
CODE:5367: 60 04              JZ 0x536d
CODE:5369: ef                 MOV A | R7
CODE:536a: b4 2d 1d           CJNE A | #0x2d | 0x538a

; ===== FUN_CODE_536d =====
CODE:536d: 90 8b 2a           MOV DPTR | #0x8b2a
CODE:5370: e0                 MOVX A | @DPTR
CODE:5371: fb                 MOV R3 | A
CODE:5372: a3                 INC DPTR
CODE:5373: e4                 CLR A
CODE:5374: 75 f0 01           MOV B | #0x1
CODE:5377: 12 42 25           LCALL 0x4225
CODE:537a: a9 f0              MOV R1 | B
CODE:537c: fa                 MOV R2 | A
CODE:537d: 12 40 f6           LCALL 0x40f6
CODE:5380: 64 2d              XRL A | #0x2d
CODE:5382: 60 03              JZ 0x5387
CODE:5384: d3                 SETB CY
CODE:5385: 80 01              SJMP 0x5388

; ===== FUN_CODE_5387 =====
CODE:5387: c3                 CLR CY

; ===== FUN_CODE_5388 =====
CODE:5388: 92 39              MOV 0x39 | CY

; ===== FUN_CODE_538a =====
CODE:538a: e4                 CLR A
CODE:538b: 90 8b 2d           MOV DPTR | #0x8b2d
CODE:538e: f0                 MOVX @DPTR | A
CODE:538f: a3                 INC DPTR
CODE:5390: f0                 MOVX @DPTR | A

; ===== FUN_CODE_5391 =====
CODE:5391: 90 8b 2a           MOV DPTR | #0x8b2a
CODE:5394: e0                 MOVX A | @DPTR
CODE:5395: fb                 MOV R3 | A
CODE:5396: a3                 INC DPTR
CODE:5397: e0                 MOVX A | @DPTR
CODE:5398: fa                 MOV R2 | A
CODE:5399: a3                 INC DPTR
CODE:539a: e0                 MOVX A | @DPTR
CODE:539b: f9                 MOV R1 | A
CODE:539c: 12 40 f6           LCALL 0x40f6
CODE:539f: ff                 MOV R7 | A
CODE:53a0: 12 39 ef           LCALL 0x39ef
CODE:53a3: 50 3f              JNC 0x53e4
CODE:53a5: 90 8b 2a           MOV DPTR | #0x8b2a
CODE:53a8: e0                 MOVX A | @DPTR
CODE:53a9: fb                 MOV R3 | A
CODE:53aa: a3                 INC DPTR
CODE:53ab: e0                 MOVX A | @DPTR
CODE:53ac: fa                 MOV R2 | A
CODE:53ad: a3                 INC DPTR
CODE:53ae: e0                 MOVX A | @DPTR
CODE:53af: f9                 MOV R1 | A
CODE:53b0: 12 40 f6           LCALL 0x40f6
CODE:53b3: ff                 MOV R7 | A
CODE:53b4: 33                 RLC A
CODE:53b5: 95 e0              SUBB A | A
CODE:53b7: fe                 MOV R6 | A
CODE:53b8: ef                 MOV A | R7
CODE:53b9: 24 d0              ADD A | #0xd0
CODE:53bb: fb                 MOV R3 | A
CODE:53bc: ee                 MOV A | R6
CODE:53bd: 34 ff              ADDC A | #0xff
CODE:53bf: fa                 MOV R2 | A
CODE:53c0: 90 8b 2d           MOV DPTR | #0x8b2d
CODE:53c3: e0                 MOVX A | @DPTR
CODE:53c4: fe                 MOV R6 | A
CODE:53c5: a3                 INC DPTR
CODE:53c6: e0                 MOVX A | @DPTR
CODE:53c7: ff                 MOV R7 | A
CODE:53c8: 7c 00              MOV R4 | #0x0
CODE:53ca: 7d 0a              MOV R5 | #0xa
CODE:53cc: 12 41 70           LCALL 0x4170
CODE:53cf: ef                 MOV A | R7
CODE:53d0: 2b                 ADD A | R3
CODE:53d1: f0                 MOVX @DPTR | A
CODE:53d2: ee                 MOV A | R6
CODE:53d3: 3a                 ADDC A | R2
CODE:53d4: 90 8b 2d           MOV DPTR | #0x8b2d
CODE:53d7: f0                 MOVX @DPTR | A
CODE:53d8: 90 8b 2b           MOV DPTR | #0x8b2b
CODE:53db: e4                 CLR A
CODE:53dc: 75 f0 01           MOV B | #0x1
CODE:53df: 12 42 0f           LCALL 0x420f

; ===== FUN_CODE_53e4 =====
CODE:53e4: 30 39 0a           JNB 0x39 | 0x53f1
CODE:53e7: 90 8b 2d           MOV DPTR | #0x8b2d
CODE:53ea: e0                 MOVX A | @DPTR
CODE:53eb: fe                 MOV R6 | A
CODE:53ec: a3                 INC DPTR
CODE:53ed: e0                 MOVX A | @DPTR
CODE:53ee: ff                 MOV R7 | A
CODE:53ef: 80 0f              SJMP 0x5400

; ===== FUN_CODE_53f1 =====
CODE:53f1: 90 8b 2d           MOV DPTR | #0x8b2d
CODE:53f4: e0                 MOVX A | @DPTR
CODE:53f5: fe                 MOV R6 | A
CODE:53f6: a3                 INC DPTR
CODE:53f7: e0                 MOVX A | @DPTR
CODE:53f8: ff                 MOV R7 | A
CODE:53f9: c3                 CLR CY
CODE:53fa: e4                 CLR A
CODE:53fb: 9f                 SUBB A | R7
CODE:53fc: ff                 MOV R7 | A
CODE:53fd: e4                 CLR A
CODE:53fe: 9e                 SUBB A | R6
CODE:53ff: fe                 MOV R6 | A

; ===== FUN_CODE_5400 =====
CODE:5400: 22                 RET 

; ===== FUN_CODE_58c2 =====
CODE:58c2: a3                 INC DPTR
CODE:58c3: ef                 MOV A | R7
CODE:58c4: f0                 MOVX @DPTR | A
CODE:58c5: fd                 MOV R5 | A
CODE:58c6: ac 06              MOV R4 | 0x06
CODE:58c8: ec                 MOV A | R4
CODE:58c9: 12 3d 18           LCALL 0x3d18
CODE:58cc: 7b 00              MOV R3 | #0x0
CODE:58ce: 7a 00              MOV R2 | #0x0
CODE:58d0: 79 7a              MOV R1 | #0x7a
CODE:58d2: 78 44              MOV R0 | #0x44
CODE:58d4: 12 3c 0d           LCALL 0x3c0d
CODE:58d7: 90 80 c9           MOV DPTR | #0x80c9
CODE:58da: 12 44 4a           LCALL 0x444a

; ===== <no_function> =====
CODE:a90f: 3c                 ADDC A | R4
CODE:a910: 23                 RL A
CODE:a911: d7                 XCHD A | @R1
CODE:a912: 0a                 INC R2
CODE:a913: e4                 CLR A
CODE:a914: 90 8a df           MOV DPTR | #0x8adf
CODE:a917: f0                 MOVX @DPTR | A
CODE:a918: c2 1a              CLR 0x1a
CODE:a91a: c2 1b              CLR 0x1b
CODE:a91c: c2 1c              CLR 0x1c
CODE:a91e: c2 1d              CLR 0x1d
CODE:a920: 90 81 08           MOV DPTR | #0x8108
CODE:a923: e0                 MOVX A | @DPTR
CODE:a924: fe                 MOV R6 | A
CODE:a925: a3                 INC DPTR
CODE:a926: e0                 MOVX A | @DPTR
CODE:a927: ff                 MOV R7 | A
CODE:a928: 64 03              XRL A | #0x3
CODE:a92a: 4e                 ORL A | R6
CODE:a92b: 70 03              JNZ 0xa930
CODE:a92d: 02 aa b4           LJMP 0xaab4

; ===== FUN_CODE_a930 =====
CODE:a930: 30 30 06           JNB 0x30 | 0xa939
CODE:a933: 30 2c 03           JNB 0x2c | 0xa939
CODE:a936: 02 aa b4           LJMP 0xaab4

; ===== FUN_CODE_a939 =====
CODE:a939: 20 01 03           JB 0x01 | 0xa93f
CODE:a93c: 02 aa b4           LJMP 0xaab4

; ===== FUN_CODE_a93f =====
CODE:a93f: 20 03 03           JB 0x03 | 0xa945
CODE:a942: 02 aa b4           LJMP 0xaab4

; ===== FUN_CODE_a945 =====
CODE:a945: 20 04 03           JB 0x04 | 0xa94b
CODE:a948: 02 aa b4           LJMP 0xaab4

; ===== FUN_CODE_a94b =====
CODE:a94b: 90 8a df           MOV DPTR | #0x8adf
CODE:a94e: 74 01              MOV A | #0x1
CODE:a950: f0                 MOVX @DPTR | A
CODE:a951: ef                 MOV A | R7
CODE:a952: 64 02              XRL A | #0x2
CODE:a954: 4e                 ORL A | R6
CODE:a955: 60 03              JZ 0xa95a
CODE:a957: 02 aa 00           LJMP 0xaa00

; ===== FUN_CODE_a95a =====
CODE:a95a: fb                 MOV R3 | A
CODE:a95b: fa                 MOV R2 | A
CODE:a95c: 79 c8              MOV R1 | #0xc8
CODE:a95e: 78 42              MOV R0 | #0x42
CODE:a960: 90 80 44           MOV DPTR | #0x8044
CODE:a963: e0                 MOVX A | @DPTR
CODE:a964: fc                 MOV R4 | A
CODE:a965: a3                 INC DPTR
CODE:a966: e0                 MOVX A | @DPTR
CODE:a967: fd                 MOV R5 | A
CODE:a968: a3                 INC DPTR
CODE:a969: e0                 MOVX A | @DPTR
CODE:a96a: fe                 MOV R6 | A
CODE:a96b: a3                 INC DPTR
CODE:a96c: e0                 MOVX A | @DPTR
CODE:a96d: ff                 MOV R7 | A
CODE:a96e: 12 3c 0d           LCALL 0x3c0d
CODE:a971: a8 04              MOV R0 | 0x04
CODE:a973: a9 05              MOV R1 | 0x05
CODE:a975: aa 06              MOV R2 | 0x06
CODE:a977: ab 07              MOV R3 | 0x07
CODE:a979: 7f 00              MOV R7 | #0x0
CODE:a97b: 7e 00              MOV R6 | #0x0
CODE:a97d: 7d 80              MOV R5 | #0x80
CODE:a97f: 7c 3f              MOV R4 | #0x3f
CODE:a981: 12 3a 0f           LCALL 0x3a0f
CODE:a984: 90 80 38           MOV DPTR | #0x8038
CODE:a987: e0                 MOVX A | @DPTR
CODE:a988: f8                 MOV R0 | A
CODE:a989: a3                 INC DPTR
CODE:a98a: e0                 MOVX A | @DPTR
CODE:a98b: f9                 MOV R1 | A
CODE:a98c: a3                 INC DPTR
CODE:a98d: e0                 MOVX A | @DPTR
CODE:a98e: fa                 MOV R2 | A
CODE:a98f: a3                 INC DPTR
CODE:a990: e0                 MOVX A | @DPTR
CODE:a991: fb                 MOV R3 | A
CODE:a992: 12 3b 04           LCALL 0x3b04
CODE:a995: 90 80 c9           MOV DPTR | #0x80c9
CODE:a998: e0                 MOVX A | @DPTR
CODE:a999: f8                 MOV R0 | A
CODE:a99a: a3                 INC DPTR
CODE:a99b: e0                 MOVX A | @DPTR
CODE:a99c: f9                 MOV R1 | A
CODE:a99d: a3                 INC DPTR
CODE:a99e: e0                 MOVX A | @DPTR
CODE:a99f: fa                 MOV R2 | A
CODE:a9a0: a3                 INC DPTR
CODE:a9a1: e0                 MOVX A | @DPTR
CODE:a9a2: fb                 MOV R3 | A
CODE:a9a3: 12 3c a6           LCALL 0x3ca6
CODE:a9a6: 40 4a              JC 0xa9f2
CODE:a9a8: 7b 00              MOV R3 | #0x0
CODE:a9aa: 7a 00              MOV R2 | #0x0
CODE:a9ac: 79 c8              MOV R1 | #0xc8
CODE:a9ae: 78 42              MOV R0 | #0x42
CODE:a9b0: 90 80 40           MOV DPTR | #0x8040
CODE:a9b3: e0                 MOVX A | @DPTR
CODE:a9b4: fc                 MOV R4 | A
CODE:a9b5: a3                 INC DPTR
CODE:a9b6: e0                 MOVX A | @DPTR
CODE:a9b7: fd                 MOV R5 | A
CODE:a9b8: a3                 INC DPTR
CODE:a9b9: e0                 MOVX A | @DPTR
CODE:a9ba: fe                 MOV R6 | A
CODE:a9bb: a3                 INC DPTR
CODE:a9bc: e0                 MOVX A | @DPTR
CODE:a9bd: ff                 MOV R7 | A
CODE:a9be: 12 3c 0d           LCALL 0x3c0d
CODE:a9c1: 7b 00              MOV R3 | #0x0
CODE:a9c3: 7a 00              MOV R2 | #0x0
CODE:a9c5: 79 80              MOV R1 | #0x80
CODE:a9c7: 78 3f              MOV R0 | #0x3f
CODE:a9c9: 12 3a 13           LCALL 0x3a13
CODE:a9cc: 90 80 38           MOV DPTR | #0x8038
CODE:a9cf: e0                 MOVX A | @DPTR
CODE:a9d0: f8                 MOV R0 | A
CODE:a9d1: a3                 INC DPTR
CODE:a9d2: e0                 MOVX A | @DPTR
CODE:a9d3: f9                 MOV R1 | A
CODE:a9d4: a3                 INC DPTR
CODE:a9d5: e0                 MOVX A | @DPTR
CODE:a9d6: fa                 MOV R2 | A
CODE:a9d7: a3                 INC DPTR
CODE:a9d8: e0                 MOVX A | @DPTR
CODE:a9d9: fb                 MOV R3 | A
CODE:a9da: 12 3b 04           LCALL 0x3b04
CODE:a9dd: 90 80 c9           MOV DPTR | #0x80c9
CODE:a9e0: e0                 MOVX A | @DPTR
CODE:a9e1: f8                 MOV R0 | A
CODE:a9e2: a3                 INC DPTR
CODE:a9e3: e0                 MOVX A | @DPTR
CODE:a9e4: f9                 MOV R1 | A
CODE:a9e5: a3                 INC DPTR
CODE:a9e6: e0                 MOVX A | @DPTR
CODE:a9e7: fa                 MOV R2 | A
CODE:a9e8: a3                 INC DPTR
CODE:a9e9: e0                 MOVX A | @DPTR
CODE:a9ea: fb                 MOV R3 | A
CODE:a9eb: 12 3c a6           LCALL 0x3ca6
CODE:a9ee: 60 09              JZ 0xa9f9
CODE:a9f0: 40 07              JC 0xa9f9

; ===== FUN_CODE_a9f2 =====
CODE:a9f2: d2 1b              SETB 0x1b
CODE:a9f4: c2 1a              CLR 0x1a
CODE:a9f6: 02 aa b4           LJMP 0xaab4

; ===== FUN_CODE_a9f9 =====
CODE:a9f9: d2 1a              SETB 0x1a
CODE:a9fb: c2 1b              CLR 0x1b
CODE:a9fd: 02 aa b4           LJMP 0xaab4

; ===== FUN_CODE_aa00 =====
CODE:aa00: 7b 00              MOV R3 | #0x0
CODE:aa02: 7a 00              MOV R2 | #0x0
CODE:aa04: 79 c8              MOV R1 | #0xc8
CODE:aa06: 78 42              MOV R0 | #0x42
CODE:aa08: 90 80 44           MOV DPTR | #0x8044
CODE:aa0b: e0                 MOVX A | @DPTR
CODE:aa0c: fc                 MOV R4 | A
CODE:aa0d: a3                 INC DPTR
CODE:aa0e: e0                 MOVX A | @DPTR
CODE:aa0f: fd                 MOV R5 | A
CODE:aa10: a3                 INC DPTR
CODE:aa11: e0                 MOVX A | @DPTR
CODE:aa12: fe                 MOV R6 | A
CODE:aa13: a3                 INC DPTR
CODE:aa14: e0                 MOVX A | @DPTR
CODE:aa15: ff                 MOV R7 | A
CODE:aa16: 12 3c 0d           LCALL 0x3c0d
CODE:aa19: a8 04              MOV R0 | 0x04
CODE:aa1b: a9 05              MOV R1 | 0x05
CODE:aa1d: aa 06              MOV R2 | 0x06
CODE:aa1f: ab 07              MOV R3 | 0x07
CODE:aa21: 7f 00              MOV R7 | #0x0
CODE:aa23: 7e 00              MOV R6 | #0x0
CODE:aa25: 7d 80              MOV R5 | #0x80
CODE:aa27: 7c 3f              MOV R4 | #0x3f
CODE:aa29: 12 3a 0f           LCALL 0x3a0f
CODE:aa2c: 90 80 38           MOV DPTR | #0x8038
CODE:aa2f: e0                 MOVX A | @DPTR
CODE:aa30: f8                 MOV R0 | A
CODE:aa31: a3                 INC DPTR
CODE:aa32: e0                 MOVX A | @DPTR
CODE:aa33: f9                 MOV R1 | A
CODE:aa34: a3                 INC DPTR
CODE:aa35: e0                 MOVX A | @DPTR
CODE:aa36: fa                 MOV R2 | A
CODE:aa37: a3                 INC DPTR
CODE:aa38: e0                 MOVX A | @DPTR
CODE:aa39: fb                 MOV R3 | A
CODE:aa3a: 12 3b 04           LCALL 0x3b04
CODE:aa3d: 90 80 c9           MOV DPTR | #0x80c9
CODE:aa40: e0                 MOVX A | @DPTR
CODE:aa41: f8                 MOV R0 | A
CODE:aa42: a3                 INC DPTR
CODE:aa43: e0                 MOVX A | @DPTR
CODE:aa44: f9                 MOV R1 | A
CODE:aa45: a3                 INC DPTR
CODE:aa46: e0                 MOVX A | @DPTR
CODE:aa47: fa                 MOV R2 | A
CODE:aa48: a3                 INC DPTR
CODE:aa49: e0                 MOVX A | @DPTR
CODE:aa4a: fb                 MOV R3 | A
CODE:aa4b: 12 3c a6           LCALL 0x3ca6
CODE:aa4e: 50 0b              JNC 0xaa5b
CODE:aa50: d2 1b              SETB 0x1b
CODE:aa52: c2 1a              CLR 0x1a
CODE:aa54: e4                 CLR A
CODE:aa55: 90 86 91           MOV DPTR | #0x8691
CODE:aa58: f0                 MOVX @DPTR | A
CODE:aa59: 80 59              SJMP 0xaab4

; ===== FUN_CODE_aa5b =====
CODE:aa5b: 7b 00              MOV R3 | #0x0
CODE:aa5d: 7a 00              MOV R2 | #0x0
CODE:aa5f: 79 c8              MOV R1 | #0xc8
CODE:aa61: 78 42              MOV R0 | #0x42
CODE:aa63: 90 80 40           MOV DPTR | #0x8040
CODE:aa66: e0                 MOVX A | @DPTR
CODE:aa67: fc                 MOV R4 | A
CODE:aa68: a3                 INC DPTR
CODE:aa69: e0                 MOVX A | @DPTR
CODE:aa6a: fd                 MOV R5 | A
CODE:aa6b: a3                 INC DPTR
CODE:aa6c: e0                 MOVX A | @DPTR
CODE:aa6d: fe                 MOV R6 | A
CODE:aa6e: a3                 INC DPTR
CODE:aa6f: e0                 MOVX A | @DPTR
CODE:aa70: ff                 MOV R7 | A
CODE:aa71: 12 3c 0d           LCALL 0x3c0d
CODE:aa74: 7b 00              MOV R3 | #0x0
CODE:aa76: 7a 00              MOV R2 | #0x0
CODE:aa78: 79 80              MOV R1 | #0x80
CODE:aa7a: 78 3f              MOV R0 | #0x3f
CODE:aa7c: 12 3a 13           LCALL 0x3a13
CODE:aa7f: 90 80 38           MOV DPTR | #0x8038
CODE:aa82: e0                 MOVX A | @DPTR
CODE:aa83: f8                 MOV R0 | A
CODE:aa84: a3                 INC DPTR
CODE:aa85: e0                 MOVX A | @DPTR
CODE:aa86: f9                 MOV R1 | A
CODE:aa87: a3                 INC DPTR
CODE:aa88: e0                 MOVX A | @DPTR
CODE:aa89: fa                 MOV R2 | A
CODE:aa8a: a3                 INC DPTR
CODE:aa8b: e0                 MOVX A | @DPTR
CODE:aa8c: fb                 MOV R3 | A
CODE:aa8d: 12 3b 04           LCALL 0x3b04
CODE:aa90: 90 80 c9           MOV DPTR | #0x80c9
CODE:aa93: e0                 MOVX A | @DPTR
CODE:aa94: f8                 MOV R0 | A
CODE:aa95: a3                 INC DPTR
CODE:aa96: e0                 MOVX A | @DPTR
CODE:aa97: f9                 MOV R1 | A
CODE:aa98: a3                 INC DPTR
CODE:aa99: e0                 MOVX A | @DPTR
CODE:aa9a: fa                 MOV R2 | A
CODE:aa9b: a3                 INC DPTR
CODE:aa9c: e0                 MOVX A | @DPTR
CODE:aa9d: fb                 MOV R3 | A
CODE:aa9e: 12 3c a6           LCALL 0x3ca6
CODE:aaa1: 60 0d              JZ 0xaab0
CODE:aaa3: 40 0b              JC 0xaab0
CODE:aaa5: 12 1f 46           LCALL 0x1f46
CODE:aaa8: 90 86 91           MOV DPTR | #0x8691
CODE:aaab: 74 01              MOV A | #0x1
CODE:aaad: f0                 MOVX @DPTR | A
CODE:aaae: 80 04              SJMP 0xaab4

; ===== FUN_CODE_aab0 =====
CODE:aab0: d2 1a              SETB 0x1a
CODE:aab2: c2 1b              CLR 0x1b

; ===== FUN_CODE_aab4 =====
CODE:aab4: 90 81 08           MOV DPTR | #0x8108
CODE:aab7: e0                 MOVX A | @DPTR
CODE:aab8: fe                 MOV R6 | A
CODE:aab9: a3                 INC DPTR
CODE:aaba: e0                 MOVX A | @DPTR
CODE:aabb: ff                 MOV R7 | A
CODE:aabc: 64 03              XRL A | #0x3
CODE:aabe: 4e                 ORL A | R6
CODE:aabf: 60 12              JZ 0xaad3
CODE:aac1: ef                 MOV A | R7
CODE:aac2: 64 01              XRL A | #0x1
CODE:aac4: 4e                 ORL A | R6
CODE:aac5: 60 03              JZ 0xaaca
CODE:aac7: 02 ad 7d           LJMP 0xad7d

; ===== FUN_CODE_aaca =====
CODE:aaca: 30 30 06           JNB 0x30 | 0xaad3
CODE:aacd: 20 2c 03           JB 0x2c | 0xaad3
CODE:aad0: 02 ad 7d           LJMP 0xad7d

; ===== FUN_CODE_aad3 =====
CODE:aad3: 20 1b 09           JB 0x1b | 0xaadf
CODE:aad6: 30 05 06           JNB 0x05 | 0xaadf
CODE:aad9: 30 00 03           JNB 0x00 | 0xaadf
CODE:aadc: 20 01 1c           JB 0x01 | 0xaafb

; ===== FUN_CODE_aadf =====
CODE:aadf: 30 1b 03           JNB 0x1b | 0xaae5
CODE:aae2: 02 ad 7d           LJMP 0xad7d

; ===== FUN_CODE_aae5 =====
CODE:aae5: 90 80 36           MOV DPTR | #0x8036
CODE:aae8: e0                 MOVX A | @DPTR
CODE:aae9: fe                 MOV R6 | A
CODE:aaea: a3                 INC DPTR
CODE:aaeb: e0                 MOVX A | @DPTR
CODE:aaec: ff                 MOV R7 | A
CODE:aaed: 64 05              XRL A | #0x5
CODE:aaef: 4e                 ORL A | R6
CODE:aaf0: 60 09              JZ 0xaafb
CODE:aaf2: ef                 MOV A | R7
CODE:aaf3: 64 06              XRL A | #0x6
CODE:aaf5: 4e                 ORL A | R6
CODE:aaf6: 60 03              JZ 0xaafb
CODE:aaf8: 02 ad 7d           LJMP 0xad7d

; ===== FUN_CODE_aafb =====
CODE:aafb: 90 80 36           MOV DPTR | #0x8036
CODE:aafe: e0                 MOVX A | @DPTR
CODE:aaff: 70 04              JNZ 0xab05
CODE:ab01: a3                 INC DPTR
CODE:ab02: e0                 MOVX A | @DPTR
CODE:ab03: 64 04              XRL A | #0x4

; ===== FUN_CODE_ab05 =====
CODE:ab05: 60 03              JZ 0xab0a
CODE:ab07: 02 ab d9           LJMP 0xabd9

; ===== FUN_CODE_ab0a =====
CODE:ab0a: ff                 MOV R7 | A
CODE:ab0b: fe                 MOV R6 | A
CODE:ab0c: fd                 MOV R5 | A
CODE:ab0d: 7c 41              MOV R4 | #0x41
CODE:ab0f: 90 80 48           MOV DPTR | #0x8048
CODE:ab12: e0                 MOVX A | @DPTR
CODE:ab13: f8                 MOV R0 | A
CODE:ab14: a3                 INC DPTR
CODE:ab15: e0                 MOVX A | @DPTR
CODE:ab16: f9                 MOV R1 | A
CODE:ab17: a3                 INC DPTR
CODE:ab18: e0                 MOVX A | @DPTR
CODE:ab19: fa                 MOV R2 | A
CODE:ab1a: a3                 INC DPTR
CODE:ab1b: e0                 MOVX A | @DPTR
CODE:ab1c: fb                 MOV R3 | A
CODE:ab1d: 12 3c a6           LCALL 0x3ca6
CODE:ab20: 40 36              JC 0xab58
CODE:ab22: 7f 00              MOV R7 | #0x0
CODE:ab24: 7e 00              MOV R6 | #0x0
CODE:ab26: 7d f0              MOV R5 | #0xf0
CODE:ab28: 7c 41              MOV R4 | #0x41
CODE:ab2a: 90 80 48           MOV DPTR | #0x8048
CODE:ab2d: e0                 MOVX A | @DPTR
CODE:ab2e: f8                 MOV R0 | A
CODE:ab2f: a3                 INC DPTR
CODE:ab30: e0                 MOVX A | @DPTR
CODE:ab31: f9                 MOV R1 | A
CODE:ab32: a3                 INC DPTR
CODE:ab33: e0                 MOVX A | @DPTR
CODE:ab34: fa                 MOV R2 | A
CODE:ab35: a3                 INC DPTR
CODE:ab36: e0                 MOVX A | @DPTR
CODE:ab37: fb                 MOV R3 | A
CODE:ab38: 12 3c a6           LCALL 0x3ca6
CODE:ab3b: 50 27              JNC 0xab64
CODE:ab3d: 7f 00              MOV R7 | #0x0
CODE:ab3f: 7e 00              MOV R6 | #0x0
CODE:ab41: 7d 16              MOV R5 | #0x16
CODE:ab43: 7c 43              MOV R4 | #0x43
CODE:ab45: 90 80 38           MOV DPTR | #0x8038
CODE:ab48: e0                 MOVX A | @DPTR
CODE:ab49: f8                 MOV R0 | A
CODE:ab4a: a3                 INC DPTR
CODE:ab4b: e0                 MOVX A | @DPTR
CODE:ab4c: f9                 MOV R1 | A
CODE:ab4d: a3                 INC DPTR
CODE:ab4e: e0                 MOVX A | @DPTR
CODE:ab4f: fa                 MOV R2 | A
CODE:ab50: a3                 INC DPTR
CODE:ab51: e0                 MOVX A | @DPTR
CODE:ab52: fb                 MOV R3 | A
CODE:ab53: 12 3c a6           LCALL 0x3ca6
CODE:ab56: 40 0c              JC 0xab64

; ===== FUN_CODE_ab58 =====
CODE:ab58: 90 8a e0           MOV DPTR | #0x8ae0
CODE:ab5b: e4                 CLR A
CODE:ab5c: f0                 MOVX @DPTR | A
CODE:ab5d: a3                 INC DPTR
CODE:ab5e: 74 0a              MOV A | #0xa
CODE:ab60: f0                 MOVX @DPTR | A
CODE:ab61: 02 ac 5e           LJMP 0xac5e

; ===== FUN_CODE_ab64 =====
CODE:ab64: 7f 00              MOV R7 | #0x0
CODE:ab66: 7e 00              MOV R6 | #0x0
CODE:ab68: 7d f0              MOV R5 | #0xf0
CODE:ab6a: 7c 41              MOV R4 | #0x41
CODE:ab6c: 90 80 48           MOV DPTR | #0x8048
CODE:ab6f: e0                 MOVX A | @DPTR
CODE:ab70: f8                 MOV R0 | A
CODE:ab71: a3                 INC DPTR
CODE:ab72: e0                 MOVX A | @DPTR
CODE:ab73: f9                 MOV R1 | A
CODE:ab74: a3                 INC DPTR
CODE:ab75: e0                 MOVX A | @DPTR
CODE:ab76: fa                 MOV R2 | A
CODE:ab77: a3                 INC DPTR
CODE:ab78: e0                 MOVX A | @DPTR
CODE:ab79: fb                 MOV R3 | A
CODE:ab7a: 12 3c a6           LCALL 0x3ca6
CODE:ab7d: 50 27              JNC 0xaba6
CODE:ab7f: 7f 00              MOV R7 | #0x0
CODE:ab81: 7e 00              MOV R6 | #0x0
CODE:ab83: 7d 16              MOV R5 | #0x16
CODE:ab85: 7c 43              MOV R4 | #0x43
CODE:ab87: 90 80 38           MOV DPTR | #0x8038
CODE:ab8a: e0                 MOVX A | @DPTR
CODE:ab8b: f8                 MOV R0 | A
CODE:ab8c: a3                 INC DPTR
CODE:ab8d: e0                 MOVX A | @DPTR
CODE:ab8e: f9                 MOV R1 | A
CODE:ab8f: a3                 INC DPTR
CODE:ab90: e0                 MOVX A | @DPTR
CODE:ab91: fa                 MOV R2 | A
CODE:ab92: a3                 INC DPTR
CODE:ab93: e0                 MOVX A | @DPTR
CODE:ab94: fb                 MOV R3 | A
CODE:ab95: 12 3c a6           LCALL 0x3ca6
CODE:ab98: 50 0c              JNC 0xaba6
CODE:ab9a: 90 8a e0           MOV DPTR | #0x8ae0
CODE:ab9d: e4                 CLR A
CODE:ab9e: f0                 MOVX @DPTR | A
CODE:ab9f: a3                 INC DPTR
CODE:aba0: 74 06              MOV A | #0x6
CODE:aba2: f0                 MOVX @DPTR | A
CODE:aba3: 02 ac 5e           LJMP 0xac5e

; ===== FUN_CODE_aba6 =====
CODE:aba6: 7f 9a              MOV R7 | #0x9a
CODE:aba8: 7e 99              MOV R6 | #0x99
CODE:abaa: 7d d9              MOV R5 | #0xd9
CODE:abac: 7c 40              MOV R4 | #0x40
CODE:abae: 90 80 38           MOV DPTR | #0x8038
CODE:abb1: e0                 MOVX A | @DPTR
CODE:abb2: f8                 MOV R0 | A
CODE:abb3: a3                 INC DPTR
CODE:abb4: e0                 MOVX A | @DPTR
CODE:abb5: f9                 MOV R1 | A
CODE:abb6: a3                 INC DPTR
CODE:abb7: e0                 MOVX A | @DPTR
CODE:abb8: fa                 MOV R2 | A
CODE:abb9: a3                 INC DPTR
CODE:abba: e0                 MOVX A | @DPTR
CODE:abbb: fb                 MOV R3 | A
CODE:abbc: 12 3c a6           LCALL 0x3ca6
CODE:abbf: 50 0c              JNC 0xabcd
CODE:abc1: 90 8a e0           MOV DPTR | #0x8ae0
CODE:abc4: e4                 CLR A
CODE:abc5: f0                 MOVX @DPTR | A
CODE:abc6: a3                 INC DPTR
CODE:abc7: 74 05              MOV A | #0x5
CODE:abc9: f0                 MOVX @DPTR | A
CODE:abca: 02 ac 5e           LJMP 0xac5e

; ===== FUN_CODE_abcd =====
CODE:abcd: 90 8a e0           MOV DPTR | #0x8ae0
CODE:abd0: e4                 CLR A
CODE:abd1: f0                 MOVX @DPTR | A
CODE:abd2: a3                 INC DPTR
CODE:abd3: 74 06              MOV A | #0x6
CODE:abd5: f0                 MOVX @DPTR | A
CODE:abd6: 02 ac 5e           LJMP 0xac5e

; ===== FUN_CODE_abd9 =====
CODE:abd9: 90 80 36           MOV DPTR | #0x8036
CODE:abdc: e0                 MOVX A | @DPTR
CODE:abdd: 70 04              JNZ 0xabe3
CODE:abdf: a3                 INC DPTR
CODE:abe0: e0                 MOVX A | @DPTR
CODE:abe1: 64 01              XRL A | #0x1

; ===== FUN_CODE_abe3 =====
CODE:abe3: 70 79              JNZ 0xac5e
CODE:abe5: ff                 MOV R7 | A
CODE:abe6: fe                 MOV R6 | A
CODE:abe7: 7d 30              MOV R5 | #0x30
CODE:abe9: 7c 41              MOV R4 | #0x41
CODE:abeb: 90 80 48           MOV DPTR | #0x8048
CODE:abee: e0                 MOVX A | @DPTR
CODE:abef: f8                 MOV R0 | A
CODE:abf0: a3                 INC DPTR
CODE:abf1: e0                 MOVX A | @DPTR
CODE:abf2: f9                 MOV R1 | A
CODE:abf3: a3                 INC DPTR
CODE:abf4: e0                 MOVX A | @DPTR
CODE:abf5: fa                 MOV R2 | A
CODE:abf6: a3                 INC DPTR
CODE:abf7: e0                 MOVX A | @DPTR
CODE:abf8: fb                 MOV R3 | A
CODE:abf9: 12 3c a6           LCALL 0x3ca6
CODE:abfc: 50 0b              JNC 0xac09
CODE:abfe: 90 8a e0           MOV DPTR | #0x8ae0
CODE:ac01: e4                 CLR A
CODE:ac02: f0                 MOVX @DPTR | A
CODE:ac03: a3                 INC DPTR
CODE:ac04: 74 32              MOV A | #0x32
CODE:ac06: f0                 MOVX @DPTR | A
CODE:ac07: 80 55              SJMP 0xac5e

; ===== FUN_CODE_ac09 =====
CODE:ac09: 7f 00              MOV R7 | #0x0
CODE:ac0b: 7e 00              MOV R6 | #0x0
CODE:ac0d: 7d c8              MOV R5 | #0xc8
CODE:ac0f: 7c 41              MOV R4 | #0x41
CODE:ac11: 90 80 48           MOV DPTR | #0x8048
CODE:ac14: e0                 MOVX A | @DPTR
CODE:ac15: f8                 MOV R0 | A
CODE:ac16: a3                 INC DPTR
CODE:ac17: e0                 MOVX A | @DPTR
CODE:ac18: f9                 MOV R1 | A
CODE:ac19: a3                 INC DPTR
CODE:ac1a: e0                 MOVX A | @DPTR
CODE:ac1b: fa                 MOV R2 | A
CODE:ac1c: a3                 INC DPTR
CODE:ac1d: e0                 MOVX A | @DPTR
CODE:ac1e: fb                 MOV R3 | A
CODE:ac1f: 12 3c a6           LCALL 0x3ca6
CODE:ac22: 50 0b              JNC 0xac2f
CODE:ac24: 90 8a e0           MOV DPTR | #0x8ae0
CODE:ac27: e4                 CLR A
CODE:ac28: f0                 MOVX @DPTR | A
CODE:ac29: a3                 INC DPTR
CODE:ac2a: 74 23              MOV A | #0x23
CODE:ac2c: f0                 MOVX @DPTR | A
CODE:ac2d: 80 2f              SJMP 0xac5e

; ===== FUN_CODE_ac2f =====
CODE:ac2f: 7f 00              MOV R7 | #0x0
CODE:ac31: 7e 00              MOV R6 | #0x0
CODE:ac33: 7d 96              MOV R5 | #0x96
CODE:ac35: 7c 42              MOV R4 | #0x42
CODE:ac37: 90 80 48           MOV DPTR | #0x8048
CODE:ac3a: e0                 MOVX A | @DPTR
CODE:ac3b: f8                 MOV R0 | A
CODE:ac3c: a3                 INC DPTR
CODE:ac3d: e0                 MOVX A | @DPTR
CODE:ac3e: f9                 MOV R1 | A
CODE:ac3f: a3                 INC DPTR
CODE:ac40: e0                 MOVX A | @DPTR
CODE:ac41: fa                 MOV R2 | A
CODE:ac42: a3                 INC DPTR
CODE:ac43: e0                 MOVX A | @DPTR
CODE:ac44: fb                 MOV R3 | A
CODE:ac45: 12 3c a6           LCALL 0x3ca6
CODE:ac48: 50 0b              JNC 0xac55
CODE:ac4a: 90 8a e0           MOV DPTR | #0x8ae0
CODE:ac4d: e4                 CLR A
CODE:ac4e: f0                 MOVX @DPTR | A
CODE:ac4f: a3                 INC DPTR
CODE:ac50: 74 19              MOV A | #0x19
CODE:ac52: f0                 MOVX @DPTR | A
CODE:ac53: 80 09              SJMP 0xac5e

; ===== FUN_CODE_ac55 =====
CODE:ac55: 90 8a e0           MOV DPTR | #0x8ae0
CODE:ac58: e4                 CLR A
CODE:ac59: f0                 MOVX @DPTR | A
CODE:ac5a: a3                 INC DPTR
CODE:ac5b: 74 14              MOV A | #0x14
CODE:ac5d: f0                 MOVX @DPTR | A

; ===== FUN_CODE_ac5e =====
CODE:ac5e: 90 80 36           MOV DPTR | #0x8036
CODE:ac61: e0                 MOVX A | @DPTR
CODE:ac62: fe                 MOV R6 | A
CODE:ac63: a3                 INC DPTR
CODE:ac64: e0                 MOVX A | @DPTR
CODE:ac65: ff                 MOV R7 | A
CODE:ac66: 64 01              XRL A | #0x1
CODE:ac68: 4e                 ORL A | R6
CODE:ac69: 60 06              JZ 0xac71
CODE:ac6b: ef                 MOV A | R7
CODE:ac6c: 64 04              XRL A | #0x4
CODE:ac6e: 4e                 ORL A | R6
CODE:ac6f: 70 7a              JNZ 0xaceb

; ===== FUN_CODE_ac71 =====
CODE:ac71: 7f d7              MOV R7 | #0xd7
CODE:ac73: 7e a3              MOV R6 | #0xa3
CODE:ac75: 7d f0              MOV R5 | #0xf0
CODE:ac77: 7c 3e              MOV R4 | #0x3e
CODE:ac79: 90 80 38           MOV DPTR | #0x8038
CODE:ac7c: e0                 MOVX A | @DPTR
CODE:ac7d: f8                 MOV R0 | A
CODE:ac7e: a3                 INC DPTR
CODE:ac7f: e0                 MOVX A | @DPTR
CODE:ac80: f9                 MOV R1 | A
CODE:ac81: a3                 INC DPTR
CODE:ac82: e0                 MOVX A | @DPTR
CODE:ac83: fa                 MOV R2 | A
CODE:ac84: a3                 INC DPTR
CODE:ac85: e0                 MOVX A | @DPTR
CODE:ac86: fb                 MOV R3 | A
CODE:ac87: 12 3c a6           LCALL 0x3ca6
CODE:ac8a: 40 40              JC 0xaccc
CODE:ac8c: 7f 51              MOV R7 | #0x51
CODE:ac8e: 7e 6b              MOV R6 | #0x6b
CODE:ac90: 7d 9a              MOV R5 | #0x9a
CODE:ac92: 7c 3d              MOV R4 | #0x3d
CODE:ac94: 90 80 38           MOV DPTR | #0x8038
CODE:ac97: e0                 MOVX A | @DPTR
CODE:ac98: f8                 MOV R0 | A
CODE:ac99: a3                 INC DPTR
CODE:ac9a: e0                 MOVX A | @DPTR
CODE:ac9b: f9                 MOV R1 | A
CODE:ac9c: a3                 INC DPTR
CODE:ac9d: e0                 MOVX A | @DPTR
CODE:ac9e: fa                 MOV R2 | A
CODE:ac9f: a3                 INC DPTR
CODE:aca0: e0                 MOVX A | @DPTR
CODE:aca1: fb                 MOV R3 | A
CODE:aca2: 12 3b 04           LCALL 0x3b04
CODE:aca5: c0 04              PUSH 0x04
CODE:aca7: c0 05              PUSH 0x05
CODE:aca9: c0 06              PUSH 0x06
CODE:acab: c0 07              PUSH 0x07
CODE:acad: 90 8a e0           MOV DPTR | #0x8ae0
CODE:acb0: e0                 MOVX A | @DPTR
CODE:acb1: fc                 MOV R4 | A
CODE:acb2: a3                 INC DPTR
CODE:acb3: e0                 MOVX A | @DPTR
CODE:acb4: fd                 MOV R5 | A
CODE:acb5: ec                 MOV A | R4
CODE:acb6: 12 3d 18           LCALL 0x3d18
CODE:acb9: d0 03              POP 0x03
CODE:acbb: d0 02              POP 0x02
CODE:acbd: d0 01              POP 0x01
CODE:acbf: d0 00              POP 0x00
CODE:acc1: 12 3c 0d           LCALL 0x3c0d
CODE:acc4: 90 8a d9           MOV DPTR | #0x8ad9
CODE:acc7: 12 44 4a           LCALL 0x444a

; ===== FUN_CODE_accc =====
CODE:accc: 90 8a e0           MOV DPTR | #0x8ae0
CODE:accf: e0                 MOVX A | @DPTR
CODE:acd0: fc                 MOV R4 | A
CODE:acd1: a3                 INC DPTR
CODE:acd2: e0                 MOVX A | @DPTR
CODE:acd3: fd                 MOV R5 | A
CODE:acd4: ec                 MOV A | R4
CODE:acd5: 12 3d 18           LCALL 0x3d18
CODE:acd8: 7b 70              MOV R3 | #0x70
CODE:acda: 7a 27              MOV R2 | #0x27
CODE:acdc: 79 11              MOV R1 | #0x11
CODE:acde: 78 3d              MOV R0 | #0x3d
CODE:ace0: 12 3c 0d           LCALL 0x3c0d
CODE:ace3: 90 8a d9           MOV DPTR | #0x8ad9
CODE:ace6: 12 44 4a           LCALL 0x444a

; ===== FUN_CODE_aceb =====
CODE:aceb: 90 8a d9           MOV DPTR | #0x8ad9
CODE:acee: 12 44 56           LCALL 0x4456

; ===== FUN_CODE_ad7d =====
CODE:ad7d: 90 81 08           MOV DPTR | #0x8108
CODE:ad80: e0                 MOVX A | @DPTR
CODE:ad81: 70 04              JNZ 0xad87
CODE:ad83: a3                 INC DPTR
CODE:ad84: e0                 MOVX A | @DPTR
CODE:ad85: 64 01              XRL A | #0x1

; ===== FUN_CODE_ad87 =====
CODE:ad87: 60 03              JZ 0xad8c
CODE:ad89: 02 b2 af           LJMP 0xb2af

; ===== FUN_CODE_ad8c =====
CODE:ad8c: 30 1b 03           JNB 0x1b | 0xad92
CODE:ad8f: 02 b2 af           LJMP 0xb2af

; ===== FUN_CODE_ad92 =====
CODE:ad92: 90 8a df           MOV DPTR | #0x8adf
CODE:ad95: e0                 MOVX A | @DPTR
CODE:ad96: 60 03              JZ 0xad9b
CODE:ad98: 02 ae 96           LJMP 0xae96

; ===== FUN_CODE_ad9b =====
CODE:ad9b: 20 01 03           JB 0x01 | 0xada1
CODE:ad9e: 02 ae 96           LJMP 0xae96

; ===== FUN_CODE_ada1 =====
CODE:ada1: 30 30 06           JNB 0x30 | 0xadaa
CODE:ada4: 30 2c 03           JNB 0x2c | 0xadaa
CODE:ada7: 02 ae 96           LJMP 0xae96

; ===== FUN_CODE_adaa =====
CODE:adaa: c2 1a              CLR 0x1a
CODE:adac: 30 03 16           JNB 0x03 | 0xadc5
CODE:adaf: 90 80 40           MOV DPTR | #0x8040
CODE:adb2: e0                 MOVX A | @DPTR
CODE:adb3: fc                 MOV R4 | A
CODE:adb4: a3                 INC DPTR
CODE:adb5: e0                 MOVX A | @DPTR
CODE:adb6: fd                 MOV R5 | A
CODE:adb7: a3                 INC DPTR
CODE:adb8: e0                 MOVX A | @DPTR
CODE:adb9: fe                 MOV R6 | A
CODE:adba: a3                 INC DPTR
CODE:adbb: e0                 MOVX A | @DPTR
CODE:adbc: ff                 MOV R7 | A
CODE:adbd: 90 8a c5           MOV DPTR | #0x8ac5
CODE:adc0: 12 44 4a           LCALL 0x444a

; ===== FUN_CODE_adc5 =====
CODE:adc5: 30 04 16           JNB 0x04 | 0xadde
CODE:adc8: 90 80 44           MOV DPTR | #0x8044
CODE:adcb: e0                 MOVX A | @DPTR
CODE:adcc: fc                 MOV R4 | A
CODE:adcd: a3                 INC DPTR
CODE:adce: e0                 MOVX A | @DPTR
CODE:adcf: fd                 MOV R5 | A
CODE:add0: a3                 INC DPTR
CODE:add1: e0                 MOVX A | @DPTR
CODE:add2: fe                 MOV R6 | A
CODE:add3: a3                 INC DPTR
CODE:add4: e0                 MOVX A | @DPTR
CODE:add5: ff                 MOV R7 | A
CODE:add6: 90 8a c9           MOV DPTR | #0x8ac9
CODE:add9: 12 44 4a           LCALL 0x444a

; ===== FUN_CODE_adde =====
CODE:adde: 90 8a c5           MOV DPTR | #0x8ac5
CODE:ade1: 12 44 56           LCALL 0x4456

; ===== FUN_CODE_ae96 =====
CODE:ae96: 30 05 09           JNB 0x05 | 0xaea2
CODE:ae99: 30 00 06           JNB 0x00 | 0xaea2
CODE:ae9c: 30 01 03           JNB 0x01 | 0xaea2
CODE:ae9f: 02 b2 af           LJMP 0xb2af

; ===== FUN_CODE_aea2 =====
CODE:aea2: 30 1d 03           JNB 0x1d | 0xaea8
CODE:aea5: c2 1c              CLR 0x1c
CODE:aea7: 22                 RET 

; ===== FUN_CODE_aea8 =====
CODE:aea8: 20 00 3f           JB 0x00 | 0xaeea
CODE:aeab: c2 1a              CLR 0x1a
CODE:aead: 7f 00              MOV R7 | #0x0
CODE:aeaf: 7e 00              MOV R6 | #0x0
CODE:aeb1: 7d 80              MOV R5 | #0x80
CODE:aeb3: 7c 3f              MOV R4 | #0x3f
CODE:aeb5: 90 80 c9           MOV DPTR | #0x80c9
CODE:aeb8: e0                 MOVX A | @DPTR
CODE:aeb9: f8                 MOV R0 | A
CODE:aeba: a3                 INC DPTR
CODE:aebb: e0                 MOVX A | @DPTR
CODE:aebc: f9                 MOV R1 | A
CODE:aebd: a3                 INC DPTR
CODE:aebe: e0                 MOVX A | @DPTR
CODE:aebf: fa                 MOV R2 | A
CODE:aec0: a3                 INC DPTR
CODE:aec1: e0                 MOVX A | @DPTR
CODE:aec2: fb                 MOV R3 | A
CODE:aec3: 12 3c a6           LCALL 0x3ca6
CODE:aec6: 60 0d              JZ 0xaed5
CODE:aec8: 40 0b              JC 0xaed5
CODE:aeca: 90 8a dd           MOV DPTR | #0x8add
CODE:aecd: e4                 CLR A
CODE:aece: f0                 MOVX @DPTR | A
CODE:aecf: a3                 INC DPTR
CODE:aed0: 74 04              MOV A | #0x4
CODE:aed2: f0                 MOVX @DPTR | A
CODE:aed3: 80 24              SJMP 0xaef9

; ===== FUN_CODE_aed5 =====
CODE:aed5: 90 8a dd           MOV DPTR | #0x8add
CODE:aed8: e4                 CLR A
CODE:aed9: f0                 MOVX @DPTR | A
CODE:aeda: a3                 INC DPTR
CODE:aedb: 74 05              MOV A | #0x5
CODE:aedd: f0                 MOVX @DPTR | A
CODE:aede: 90 8a d9           MOV DPTR | #0x8ad9
CODE:aee1: 12 44 56           LCALL 0x4456

; ===== FUN_CODE_aeea =====
CODE:aeea: 90 80 36           MOV DPTR | #0x8036
CODE:aeed: e0                 MOVX A | @DPTR
CODE:aeee: ff                 MOV R7 | A
CODE:aeef: a3                 INC DPTR
CODE:aef0: e0                 MOVX A | @DPTR
CODE:aef1: 90 8a dd           MOV DPTR | #0x8add
CODE:aef4: cf                 XCH A | R7
CODE:aef5: f0                 MOVX @DPTR | A
CODE:aef6: a3                 INC DPTR
CODE:aef7: ef                 MOV A | R7
CODE:aef8: f0                 MOVX @DPTR | A

; ===== FUN_CODE_aef9 =====
CODE:aef9: 30 05 16           JNB 0x05 | 0xaf12
CODE:aefc: 90 80 48           MOV DPTR | #0x8048
CODE:aeff: e0                 MOVX A | @DPTR
CODE:af00: fc                 MOV R4 | A
CODE:af01: a3                 INC DPTR
CODE:af02: e0                 MOVX A | @DPTR
CODE:af03: fd                 MOV R5 | A
CODE:af04: a3                 INC DPTR
CODE:af05: e0                 MOVX A | @DPTR
CODE:af06: fe                 MOV R6 | A
CODE:af07: a3                 INC DPTR
CODE:af08: e0                 MOVX A | @DPTR
CODE:af09: ff                 MOV R7 | A
CODE:af0a: 90 8a cd           MOV DPTR | #0x8acd
CODE:af0d: 12 44 4a           LCALL 0x444a

; ===== FUN_CODE_af12 =====
CODE:af12: 90 8a cd           MOV DPTR | #0x8acd
CODE:af15: 12 44 56           LCALL 0x4456

; ===== FUN_CODE_af1c =====
CODE:af1c: 30 01 16           JNB 0x01 | 0xaf35
CODE:af1f: 90 80 38           MOV DPTR | #0x8038
CODE:af22: e0                 MOVX A | @DPTR
CODE:af23: fc                 MOV R4 | A
CODE:af24: a3                 INC DPTR
CODE:af25: e0                 MOVX A | @DPTR
CODE:af26: fd                 MOV R5 | A
CODE:af27: a3                 INC DPTR
CODE:af28: e0                 MOVX A | @DPTR
CODE:af29: fe                 MOV R6 | A
CODE:af2a: a3                 INC DPTR
CODE:af2b: e0                 MOVX A | @DPTR
CODE:af2c: ff                 MOV R7 | A
CODE:af2d: 90 8a d1           MOV DPTR | #0x8ad1
CODE:af30: 12 44 4a           LCALL 0x444a

; ===== FUN_CODE_af35 =====
CODE:af35: 90 80 c9           MOV DPTR | #0x80c9
CODE:af38: e0                 MOVX A | @DPTR
CODE:af39: fc                 MOV R4 | A
CODE:af3a: a3                 INC DPTR
CODE:af3b: e0                 MOVX A | @DPTR
CODE:af3c: fd                 MOV R5 | A
CODE:af3d: a3                 INC DPTR
CODE:af3e: e0                 MOVX A | @DPTR
CODE:af3f: fe                 MOV R6 | A
CODE:af40: a3                 INC DPTR
CODE:af41: e0                 MOVX A | @DPTR
CODE:af42: ff                 MOV R7 | A
CODE:af43: 90 8a d1           MOV DPTR | #0x8ad1
CODE:af46: 12 44 4a           LCALL 0x444a

; ===== FUN_CODE_b2af =====
CODE:b2af: 22                 RET 

; ===== <no_function> =====
CODE:eda0: 00                 NOP 
CODE:eda1: 00                 NOP 
CODE:eda2: 00                 NOP 
CODE:eda3: 00                 NOP 
CODE:eda4: 78 d4              MOV R0 | #0xd4
CODE:eda6: 7c 8a              MOV R4 | #0x8a
CODE:eda8: 7d 01              MOV R5 | #0x1
CODE:edaa: 7b ff              MOV R3 | #0xff
CODE:edac: 7a 33              MOV R2 | #0x33
CODE:edae: 79 ed              MOV R1 | #0xed
CODE:edb0: 7e 00              MOV R6 | #0x0
CODE:edb2: 7f 51              MOV R7 | #0x51
CODE:edb4: 12 40 ab           LCALL 0x40ab
CODE:edb7: 78 25              MOV R0 | #0x25
CODE:edb9: 7c 8b              MOV R4 | #0x8b
CODE:edbb: 7d 01              MOV R5 | #0x1
CODE:edbd: 7b ff              MOV R3 | #0xff
CODE:edbf: 7a 34              MOV R2 | #0x34
CODE:edc1: 79 3e              MOV R1 | #0x3e
CODE:edc3: 7e 00              MOV R6 | #0x0
CODE:edc5: 7f 05              MOV R7 | #0x5
CODE:edc7: 12 40 ab           LCALL 0x40ab
CODE:edca: 90 89 f7           MOV DPTR | #0x89f7
CODE:edcd: 74 ff              MOV A | #0xff
CODE:edcf: f0                 MOVX @DPTR | A
CODE:edd0: a3                 INC DPTR
CODE:edd1: 74 33              MOV A | #0x33
CODE:edd3: f0                 MOVX @DPTR | A
CODE:edd4: a3                 INC DPTR
CODE:edd5: 74 a8              MOV A | #0xa8
CODE:edd7: f0                 MOVX @DPTR | A
CODE:edd8: 90 8a d0           MOV DPTR | #0x8ad0
CODE:eddb: e0                 MOVX A | @DPTR
CODE:eddc: fc                 MOV R4 | A
CODE:eddd: a3                 INC DPTR
CODE:edde: e0                 MOVX A | @DPTR
CODE:eddf: fd                 MOV R5 | A
CODE:ede0: a3                 INC DPTR
CODE:ede1: e0                 MOVX A | @DPTR
CODE:ede2: fe                 MOV R6 | A
CODE:ede3: a3                 INC DPTR
CODE:ede4: e0                 MOVX A | @DPTR
CODE:ede5: ff                 MOV R7 | A
CODE:ede6: 90 89 fa           MOV DPTR | #0x89fa
CODE:ede9: 12 44 4a           LCALL 0x444a
