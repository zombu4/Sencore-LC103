; LC103 FW v1.53 inferred symbol map
BANK0_BOOT_STATE_MACHINE EQU 0x00000 ; Top-level startup + mode dispatcher; contains early jump-table dispatch and readiness/error routing. [high]
BANK0_CALIBRATION_STATE_ANALOG_FRONTEND_005FE EQU 0x005FE ; calibration state/XDATA handler; analog front-end control; measurement register path; numeric helper; large state machine [medium]
BANK0_CALIBRATION_STATE_MEASUREMENT_REGS_0151D EQU 0x0151D ; calibration state/XDATA handler; measurement register path [medium]
BANK0_ANALOG_FRONTEND_MEASUREMENT_REGS_01629 EQU 0x01629 ; analog front-end control; measurement register path; large state machine [medium]
BANK0_CALIBRATION_STATE_MEASUREMENT_REGS_0182E EQU 0x0182E ; calibration state/XDATA handler; measurement register path; numeric helper; large state machine [medium]
BANK0_ANALOG_FRONTEND_MEASUREMENT_REGS_01BF0 EQU 0x01BF0 ; analog front-end control; measurement register path [medium]
BANK0_CALIBRATION_STATE_MEASUREMENT_REGS_01C94 EQU 0x01C94 ; calibration state/XDATA handler; measurement register path; large state machine [medium]
BANK0_MEASUREMENT_REGS_SERVICE_STROBE_01F64 EQU 0x01F64 ; measurement register path [medium]
BANK0_MEASUREMENT_REGS_SERVICE_STROBE_01F7A EQU 0x01F7A ; measurement register path [medium]
BANK0_CALIBRATION_STATE_NUMERIC_ENGINE_01F97 EQU 0x01F97 ; calibration state/XDATA handler; numeric helper; large state machine [medium]
BANK0_XDATA_IO_VECTOR_ENTRY_024DD EQU 0x024DD ; Interrupt/reset vector handler entry [medium]
BANK0_ANALOG_FRONTEND_MEASUREMENT_REGS_02619 EQU 0x02619 ; Interrupt/reset vector handler entry; analog front-end control; measurement register path [medium]
BANK0_CALIBRATION_STATE_MEASUREMENT_REGS_026DE EQU 0x026DE ; Interrupt/reset vector handler entry; calibration state/XDATA handler; measurement register path; numeric helper; large state machine [medium]
BANK0_CALIBRATION_STATE_ANALOG_FRONTEND_02BA8 EQU 0x02BA8 ; calibration state/XDATA handler; analog front-end control; measurement register path; numeric helper [medium]
BANK0_JUMP_TABLE_DISPATCH_CALIBRATION_STATE_02CED EQU 0x02CED ; jump-table dispatcher; calibration state/XDATA handler; analog front-end control; measurement register path; numeric helper; large state machine [medium]
BANK0_RESET_INIT EQU 0x037F9 ; Reset/vector init: clears internal RAM, initializes stack, enters firmware init sequence. [high]
BANK0_FN_038BC EQU 0x038BC ; general helper / control-flow block [low]
BANK0_FN_038C1 EQU 0x038C1 ; general helper / control-flow block [low]
BANK0_TEXT_PTR_WRAPPER_A EQU 0x038C6 ; Text/resource pointer wrapper feeding shared print/format routine. [high]
BANK0_TEXT_PTR_WRAPPER_B EQU 0x038CB ; Text/resource pointer wrapper feeding shared print/format routine. [high]
BANK0_FN_038D0 EQU 0x038D0 ; general helper / control-flow block [low]
BANK0_FN_038D5 EQU 0x038D5 ; general helper / control-flow block [low]
BANK0_FN_038DA EQU 0x038DA ; general helper / control-flow block [low]
BANK0_FN_038DF EQU 0x038DF ; general helper / control-flow block [low]
BANK0_FN_038E4 EQU 0x038E4 ; general helper / control-flow block [low]
BANK0_FN_038E9 EQU 0x038E9 ; general helper / control-flow block [low]
BANK0_FN_038EE EQU 0x038EE ; general helper / control-flow block [low]
BANK0_FN_038F3 EQU 0x038F3 ; general helper / control-flow block [low]
BANK0_FN_038F8 EQU 0x038F8 ; general helper / control-flow block [low]
BANK0_FN_038FD EQU 0x038FD ; general helper / control-flow block [low]
BANK0_FN_03902 EQU 0x03902 ; general helper / control-flow block [low]
BANK0_FN_03907 EQU 0x03907 ; general helper / control-flow block [low]
BANK0_FN_0390C EQU 0x0390C ; general helper / control-flow block [low]
BANK0_CALIBRATION_STATE_03911 EQU 0x03911 ; calibration state/XDATA handler [low]
BANK0_FN_03916 EQU 0x03916 ; general helper / control-flow block [low]
BANK0_FN_0391B EQU 0x0391B ; general helper / control-flow block [low]
BANK0_FN_03920 EQU 0x03920 ; general helper / control-flow block [low]
BANK0_FN_03925 EQU 0x03925 ; general helper / control-flow block [low]
BANK0_FN_0392A EQU 0x0392A ; general helper / control-flow block [low]
BANK0_FN_0392F EQU 0x0392F ; general helper / control-flow block [low]
BANK0_FN_03934 EQU 0x03934 ; general helper / control-flow block [low]
BANK0_FN_03939 EQU 0x03939 ; general helper / control-flow block [low]
BANK0_CALIBRATION_STATE_0393E EQU 0x0393E ; calibration state/XDATA handler [low]
BANK0_FN_039AB EQU 0x039AB ; general helper / control-flow block [low]
BANK0_FN_03A0F EQU 0x03A0F ; general helper / control-flow block [low]
BANK0_NUMERIC_ENGINE_03A13 EQU 0x03A13 ; numeric helper [low]
BANK0_NUMERIC_ENGINE_03B04 EQU 0x03B04 ; numeric helper [low]
BANK0_FN_03C0D EQU 0x03C0D ; general helper / control-flow block [low]
BANK0_FN_03CA6 EQU 0x03CA6 ; general helper / control-flow block [low]
BANK0_FN_03D13 EQU 0x03D13 ; general helper / control-flow block [low]
BANK0_FN_03D18 EQU 0x03D18 ; general helper / control-flow block [low]
BANK0_NUMERIC_ENGINE_XDATA_IO_03D51 EQU 0x03D51 ; numeric helper; large state machine [medium]
BANK0_JUMP_TABLE_DISPATCH_XDATA_IO_040AB EQU 0x040AB ; jump-table dispatcher [medium]
BANK0_XDATA_IO_SHARED_HELPER_0413C EQU 0x0413C ; general helper / control-flow block [low]
BANK0_XDATA_IO_0414E EQU 0x0414E ; general helper / control-flow block [low]
BANK0_FN_04170 EQU 0x04170 ; general helper / control-flow block [low]
BANK0_FN_04184 EQU 0x04184 ; general helper / control-flow block [low]
BANK0_FN_041D9 EQU 0x041D9 ; general helper / control-flow block [low]
BANK0_XDATA_IO_0420F EQU 0x0420F ; general helper / control-flow block [low]
BANK0_XDATA_IO_0423B EQU 0x0423B ; general helper / control-flow block [low]
BANK0_NUMERIC_ENGINE_XDATA_IO_0429E EQU 0x0429E ; numeric helper; large state machine [medium]
BANK0_FN_043E8 EQU 0x043E8 ; general helper / control-flow block [low]
BANK0_XDATA_IO_043FE EQU 0x043FE ; general helper / control-flow block [low]
BANK0_XDATA_IO_SHARED_HELPER_0444A EQU 0x0444A ; general helper / control-flow block [low]
BANK0_JUMP_TABLE_DISPATCH_XDATA_IO_04456 EQU 0x04456 ; jump-table dispatcher [medium]
BANK0_JUMP_TABLE_DISPATCH_XDATA_IO_044CD EQU 0x044CD ; jump-table dispatcher; large state machine [medium]
BANK0_JUMP_TABLE_DISPATCH_XDATA_IO_04682 EQU 0x04682 ; jump-table dispatcher [medium]
BANK0_JUMP_TABLE_DISPATCH_CALIBRATION_STATE_0476B EQU 0x0476B ; jump-table dispatcher; calibration state/XDATA handler; numeric helper; large state machine [medium]
BANK0_CALIBRATION_STATE_XDATA_IO_050F8 EQU 0x050F8 ; calibration state/XDATA handler; large state machine [medium]
BANK0_JUMP_TABLE_DISPATCH_CALIBRATION_STATE_052F8 EQU 0x052F8 ; jump-table dispatcher; calibration state/XDATA handler; analog front-end control; measurement register path; numeric helper; large state machine [medium]
BANK1_JUMP_TABLE_DISPATCH_CALIBRATION_STATE_10016 EQU 0x10016 ; jump-table dispatcher; calibration state/XDATA handler; analog front-end control; measurement register path; large state machine [medium]
BANK1_CALIBRATION_STATE_ANALOG_FRONTEND_105FE EQU 0x105FE ; calibration state/XDATA handler; analog front-end control; measurement register path; large state machine [medium]
BANK1_CALIBRATION_STATE_NUMERIC_ENGINE_10908 EQU 0x10908 ; calibration state/XDATA handler; numeric helper; large state machine [medium]
BANK1_CALIBRATION_STATE_NUMERIC_ENGINE_10CB5 EQU 0x10CB5 ; calibration state/XDATA handler; numeric helper; large state machine [medium]
BANK1_MEASUREMENT_REGS_XDATA_IO_11500 EQU 0x11500 ; measurement register path [low]
BANK1_CALIBRATION_STATE_MEASUREMENT_REGS_1151D EQU 0x1151D ; calibration state/XDATA handler; measurement register path [medium]
BANK1_ANALOG_FRONTEND_MEASUREMENT_REGS_11629 EQU 0x11629 ; analog front-end control; measurement register path; large state machine [medium]
BANK1_XDATA_IO_1182E EQU 0x1182E ; general helper / control-flow block [low]
BANK1_CALIBRATION_STATE_XDATA_IO_1192A EQU 0x1192A ; calibration state/XDATA handler [low]
BANK1_FN_119BD EQU 0x119BD ; general helper / control-flow block [low]
BANK1_FN_119EA EQU 0x119EA ; general helper / control-flow block [low]
BANK1_CALIBRATION_STATE_MEASUREMENT_REGS_11A17 EQU 0x11A17 ; calibration state/XDATA handler; measurement register path; numeric helper; large state machine [medium]
BANK1_ANALOG_FRONTEND_MEASUREMENT_REGS_11BF0 EQU 0x11BF0 ; analog front-end control; measurement register path [medium]
BANK1_CALIBRATION_STATE_XDATA_IO_11C94 EQU 0x11C94 ; calibration state/XDATA handler [low]
BANK1_CALIBRATION_STATE_MEASUREMENT_REGS_11CD6 EQU 0x11CD6 ; calibration state/XDATA handler; measurement register path; large state machine [medium]
BANK1_FN_11F46 EQU 0x11F46 ; general helper / control-flow block [low]
BANK1_CORE_SERVICE_STROBE EQU 0x11F64 ; Core service strobe toggling control bits via XDATA 0x8035/0x7B00; called across measurement/calibration flows. [high]
BANK1_MEASUREMENT_REGS_SERVICE_STROBE_11F7A EQU 0x11F7A ; measurement register path [medium]
BANK1_MEASUREMENT_WAIT_LOOP EQU 0x11F97 ; Stores parameters, invokes measurement compare path, loops until comparator/condition clears. [high]
BANK1_CALIBRATION_STATE_XDATA_IO_11FD1 EQU 0x11FD1 ; calibration state/XDATA handler; large state machine [medium]
BANK1_ANALOG_FRONTEND_MEASUREMENT_REGS_12255 EQU 0x12255 ; analog front-end control; measurement register path; numeric helper; large state machine [medium]
BANK1_XDATA_IO_12900 EQU 0x12900 ; general helper / control-flow block [low]
BANK1_CALIBRATION_STATE_MEASUREMENT_REGS_12A0A EQU 0x12A0A ; calibration state/XDATA handler; measurement register path [medium]
BANK1_CALIBRATION_STATE_MEASUREMENT_REGS_12AAF EQU 0x12AAF ; calibration state/XDATA handler; measurement register path [medium]
BANK1_MEASUREMENT_REGS_XDATA_IO_12B8D EQU 0x12B8D ; measurement register path [low]
BANK1_CALIBRATION_STATE_ANALOG_FRONTEND_12BA8 EQU 0x12BA8 ; calibration state/XDATA handler; analog front-end control; measurement register path; numeric helper [medium]
BANK1_JUMP_TABLE_DISPATCH_CALIBRATION_STATE_12CED EQU 0x12CED ; jump-table dispatcher; calibration state/XDATA handler; analog front-end control; measurement register path; numeric helper; large state machine [medium]
BANK1_COMMAND_TABLES_REGION_1303A EQU 0x1303A ; general helper / control-flow block [low]
BANK1_JUMP_TABLE_DISPATCH_COMMAND_TABLES_REGION_13100 EQU 0x13100 ; jump-table dispatcher [medium]
BANK1_COMMAND_TABLES_REGION_1312E EQU 0x1312E ; general helper / control-flow block [low]
BANK1_COMMAND_TABLES_REGION_13130 EQU 0x13130 ; general helper / control-flow block [low]
BANK1_JUMP_TABLE_DISPATCH_NUMERIC_ENGINE_13166 EQU 0x13166 ; jump-table dispatcher; numeric helper; large state machine [medium]
BANK1_FN_138BC EQU 0x138BC ; general helper / control-flow block [low]
BANK1_FN_138C1 EQU 0x138C1 ; general helper / control-flow block [low]
BANK1_TEXT_PTR_WRAPPER_A EQU 0x138C6 ; Bank-1 text/resource wrapper for shared print/format routine. [high]
BANK1_TEXT_PTR_WRAPPER_B EQU 0x138CB ; Bank-1 text/resource wrapper for shared print/format routine. [high]
BANK1_FN_138D0 EQU 0x138D0 ; general helper / control-flow block [low]
BANK1_FN_138D5 EQU 0x138D5 ; general helper / control-flow block [low]
BANK1_FN_138DA EQU 0x138DA ; general helper / control-flow block [low]
BANK1_FN_138DF EQU 0x138DF ; general helper / control-flow block [low]
BANK1_FN_138E4 EQU 0x138E4 ; general helper / control-flow block [low]
BANK1_FN_138E9 EQU 0x138E9 ; general helper / control-flow block [low]
BANK1_FN_138EE EQU 0x138EE ; general helper / control-flow block [low]
BANK1_FN_138F3 EQU 0x138F3 ; general helper / control-flow block [low]
BANK1_FN_138F8 EQU 0x138F8 ; general helper / control-flow block [low]
BANK1_FN_138FD EQU 0x138FD ; general helper / control-flow block [low]
BANK1_FN_13902 EQU 0x13902 ; general helper / control-flow block [low]
BANK1_FN_13907 EQU 0x13907 ; general helper / control-flow block [low]
BANK1_FN_1390C EQU 0x1390C ; general helper / control-flow block [low]
BANK1_CALIBRATION_STATE_13911 EQU 0x13911 ; calibration state/XDATA handler [low]
BANK1_FN_13916 EQU 0x13916 ; general helper / control-flow block [low]
BANK1_FN_1391B EQU 0x1391B ; general helper / control-flow block [low]
BANK1_FN_13920 EQU 0x13920 ; general helper / control-flow block [low]
BANK1_FN_13925 EQU 0x13925 ; general helper / control-flow block [low]
BANK1_FN_1392A EQU 0x1392A ; general helper / control-flow block [low]
BANK1_FN_1392F EQU 0x1392F ; general helper / control-flow block [low]
BANK1_FN_13934 EQU 0x13934 ; general helper / control-flow block [low]
BANK1_FN_13939 EQU 0x13939 ; general helper / control-flow block [low]
BANK1_CALIBRATION_STATE_1393E EQU 0x1393E ; calibration state/XDATA handler [low]
BANK1_FN_13943 EQU 0x13943 ; general helper / control-flow block [low]
BANK1_SHARED_HELPER_13948 EQU 0x13948 ; general helper / control-flow block [low]
BANK1_FN_1394D EQU 0x1394D ; general helper / control-flow block [low]
BANK1_FN_1395C EQU 0x1395C ; general helper / control-flow block [low]
BANK1_CALIBRATION_STATE_13962 EQU 0x13962 ; calibration state/XDATA handler [low]
BANK1_CALIBRATION_STATE_1399E EQU 0x1399E ; calibration state/XDATA handler [low]
BANK1_FN_139AB EQU 0x139AB ; general helper / control-flow block [low]
BANK1_FN_139E1 EQU 0x139E1 ; general helper / control-flow block [low]
BANK1_FN_139EF EQU 0x139EF ; general helper / control-flow block [low]
BANK1_FN_13A0F EQU 0x13A0F ; general helper / control-flow block [low]
BANK1_NUMERIC_ENGINE_SHARED_HELPER_13A13 EQU 0x13A13 ; numeric helper [low]
BANK1_MATH_CORE_OP_A EQU 0x13B04 ; Core multi-byte arithmetic/normalization primitive used by numeric engine. [medium]
BANK1_SHARED_HELPER_13C0D EQU 0x13C0D ; general helper / control-flow block [low]
BANK1_MATH_CORE_COMPARE EQU 0x13CA6 ; Multi-byte compare/normalize routine used heavily in numeric pipeline. [medium]
BANK1_FN_13D13 EQU 0x13D13 ; general helper / control-flow block [low]
BANK1_SHARED_HELPER_13D18 EQU 0x13D18 ; general helper / control-flow block [low]
BANK1_FN_13D1D EQU 0x13D1D ; general helper / control-flow block [low]
BANK1_SHARED_HELPER_13D51 EQU 0x13D51 ; general helper / control-flow block [low]
BANK1_FN_13D88 EQU 0x13D88 ; general helper / control-flow block [low]
BANK1_FN_13DD1 EQU 0x13DD1 ; general helper / control-flow block [low]
BANK1_NUMERIC_ENGINE_XDATA_IO_13DE2 EQU 0x13DE2 ; numeric helper [low]
BANK1_FN_13F54 EQU 0x13F54 ; general helper / control-flow block [low]
BANK1_FN_13F6E EQU 0x13F6E ; general helper / control-flow block [low]
BANK1_FN_13F7D EQU 0x13F7D ; general helper / control-flow block [low]
BANK1_FN_13F82 EQU 0x13F82 ; general helper / control-flow block [low]
BANK1_FN_13F94 EQU 0x13F94 ; general helper / control-flow block [low]
BANK1_XDATA_IO_13FA3 EQU 0x13FA3 ; general helper / control-flow block [low]
BANK1_NUMERIC_DISPATCH_A EQU 0x140AB ; Jump-table-driven numeric operation dispatcher (fixed/multi-byte math helpers). [medium]
BANK1_FN_140D4 EQU 0x140D4 ; general helper / control-flow block [low]
BANK1_XDATA_IO_SHARED_HELPER_140F6 EQU 0x140F6 ; general helper / control-flow block [low]
BANK1_XDATA_IO_SHARED_HELPER_1410F EQU 0x1410F ; general helper / control-flow block [low]
BANK1_MEM_WRITE_HELPER EQU 0x1413C ; Generic write helper for internal/XDATA addressing modes. [medium]
BANK1_XDATA_IO_1414E EQU 0x1414E ; general helper / control-flow block [low]
BANK1_FN_14170 EQU 0x14170 ; general helper / control-flow block [low]
BANK1_FN_14184 EQU 0x14184 ; general helper / control-flow block [low]
BANK1_FN_141D9 EQU 0x141D9 ; general helper / control-flow block [low]
BANK1_MULTIBYTE_ADD_HELPER EQU 0x1420F ; Carry-aware multi-byte add helper on XDATA operands. [medium]
BANK1_XDATA_IO_14225 EQU 0x14225 ; general helper / control-flow block [low]
BANK1_XDATA_IO_1423B EQU 0x1423B ; general helper / control-flow block [low]
BANK1_NUMERIC_ENGINE_XDATA_IO_1429E EQU 0x1429E ; numeric helper [low]
BANK1_NUMERIC_ENGINE_14348 EQU 0x14348 ; numeric helper [low]
BANK1_FN_143DA EQU 0x143DA ; general helper / control-flow block [low]
BANK1_MULTIBYTE_CMP_HELPER EQU 0x143E8 ; Signed/unsigned multi-byte compare helper used across math/calibration logic. [medium]
BANK1_FN_143FE EQU 0x143FE ; general helper / control-flow block [low]
BANK1_XDATA_IO_14412 EQU 0x14412 ; general helper / control-flow block [low]
BANK1_FN_1441E EQU 0x1441E ; general helper / control-flow block [low]
BANK1_XDATA_IO_1442E EQU 0x1442E ; general helper / control-flow block [low]
BANK1_FN_1443A EQU 0x1443A ; general helper / control-flow block [low]
BANK1_STORE_U32_XDATA EQU 0x1444A ; Stores r4..r7 32-bit value to XDATA at DPTR. [high]
BANK1_XDATA_TABLE_LOADER EQU 0x14456 ; Indirect table loader/copy helper (MOVC/MOVX) used broadly by calibration/math paths. [high]
BANK1_XDATA_IO_1446D EQU 0x1446D ; general helper / control-flow block [low]
BANK1_XDATA_IO_14487 EQU 0x14487 ; general helper / control-flow block [low]
BANK1_XDATA_IO_1449E EQU 0x1449E ; general helper / control-flow block [low]
BANK1_JUMP_TABLE_DISPATCH_144A7 EQU 0x144A7 ; jump-table dispatcher [low]
BANK1_JUMP_TABLE_DISPATCH_XDATA_IO_144CD EQU 0x144CD ; jump-table dispatcher; large state machine [medium]
BANK1_JUMP_TABLE_DISPATCH_XDATA_IO_14682 EQU 0x14682 ; jump-table dispatcher [medium]
BANK1_NUMERIC_DISPATCH_B EQU 0x1476B ; Second jump-table numeric dispatcher with table at XDATA/ROM selector addresses. [medium]
BANK1_XDATA_IO_14788 EQU 0x14788 ; general helper / control-flow block [low]
BANK1_FN_14797 EQU 0x14797 ; general helper / control-flow block [low]
BANK1_FN_147AA EQU 0x147AA ; general helper / control-flow block [low]
BANK1_FN_147B3 EQU 0x147B3 ; general helper / control-flow block [low]
BANK1_FN_147B4 EQU 0x147B4 ; general helper / control-flow block [low]
BANK1_FN_147BC EQU 0x147BC ; general helper / control-flow block [low]
BANK1_FN_147BD EQU 0x147BD ; general helper / control-flow block [low]
BANK1_FN_147CB EQU 0x147CB ; general helper / control-flow block [low]
BANK1_FN_147DC EQU 0x147DC ; general helper / control-flow block [low]
BANK1_CALIBRATION_STATE_XDATA_IO_147ED EQU 0x147ED ; calibration state/XDATA handler [low]
BANK1_CALIBRATION_STATE_XDATA_IO_14972 EQU 0x14972 ; calibration state/XDATA handler [low]
BANK1_CALIBRATION_STATE_14B05 EQU 0x14B05 ; calibration state/XDATA handler [low]
BANK1_FN_14B21 EQU 0x14B21 ; general helper / control-flow block [low]
BANK1_FN_14B23 EQU 0x14B23 ; general helper / control-flow block [low]
BANK1_FN_14B78 EQU 0x14B78 ; general helper / control-flow block [low]
BANK1_XDATA_IO_14BA9 EQU 0x14BA9 ; general helper / control-flow block [low]
BANK1_CALIBRATION_STATE_SHARED_HELPER_14C02 EQU 0x14C02 ; calibration state/XDATA handler [low]
BANK1_CALIBRATION_STATE_14C3E EQU 0x14C3E ; calibration state/XDATA handler [low]
BANK1_CALIBRATION_STATE_XDATA_IO_14CAA EQU 0x14CAA ; calibration state/XDATA handler [low]
BANK1_CALIBRATION_STATE_XDATA_IO_14D72 EQU 0x14D72 ; calibration state/XDATA handler [low]
BANK1_NUMERIC_ENGINE_14DF4 EQU 0x14DF4 ; numeric helper [low]
BANK1_NUMERIC_ENGINE_XDATA_IO_14EFF EQU 0x14EFF ; numeric helper [low]
BANK1_CALIBRATION_STATE_14F95 EQU 0x14F95 ; calibration state/XDATA handler [low]
BANK1_FN_1509D EQU 0x1509D ; general helper / control-flow block [low]
BANK1_FN_150B9 EQU 0x150B9 ; general helper / control-flow block [low]
BANK1_FN_150CE EQU 0x150CE ; general helper / control-flow block [low]
BANK1_CALIBRATION_ACCUMULATOR EQU 0x150F8 ; Calibration/state accumulator using 0x8B39..0x8B3F and math helpers. [medium]
BANK1_CALIBRATION_STATE_XDATA_IO_15163 EQU 0x15163 ; calibration state/XDATA handler [low]
BANK1_CALIBRATION_STATE_XDATA_IO_15290 EQU 0x15290 ; calibration state/XDATA handler [low]
BANK1_SHARED_HELPER_152F8 EQU 0x152F8 ; general helper / control-flow block [low]
BANK1_CALIBRATION_STATE_MEASUREMENT_REGS_1530D EQU 0x1530D ; calibration state/XDATA handler; measurement register path; large state machine [medium]
BANK1_MEASUREMENT_REGS_XDATA_IO_15601 EQU 0x15601 ; measurement register path; large state machine [medium]
BANK1_CALIBRATION_STATE_MEASUREMENT_REGS_157E8 EQU 0x157E8 ; calibration state/XDATA handler; measurement register path; numeric helper; large state machine [medium]
BANK1_CALIBRATION_STATE_MEASUREMENT_REGS_15B8B EQU 0x15B8B ; calibration state/XDATA handler; measurement register path; numeric helper; large state machine [medium]
BANK1_MEASUREMENT_REGS_XDATA_IO_16DBA EQU 0x16DBA ; measurement register path [low]
BANK1_CALIBRATION_STATE_NUMERIC_ENGINE_16E8E EQU 0x16E8E ; calibration state/XDATA handler; numeric helper; large state machine [medium]
BANK1_CALIBRATION_STATE_ANALOG_FRONTEND_17B00 EQU 0x17B00 ; calibration state/XDATA handler; analog front-end control; measurement register path; numeric helper; large state machine [medium]
BANK1_CALIBRATION_STATE_MEASUREMENT_REGS_1880C EQU 0x1880C ; calibration state/XDATA handler; measurement register path [medium]
BANK1_CALIBRATION_STATE_ANALOG_FRONTEND_18931 EQU 0x18931 ; calibration state/XDATA handler; analog front-end control; measurement register path [medium]
BANK1_CALIBRATION_STATE_XDATA_IO_189CC EQU 0x189CC ; calibration state/XDATA handler [low]
BANK1_CALIBRATION_STATE_XDATA_IO_18A62 EQU 0x18A62 ; calibration state/XDATA handler [low]
BANK1_CALIBRATION_STATE_ANALOG_FRONTEND_18A98 EQU 0x18A98 ; calibration state/XDATA handler; analog front-end control; measurement register path [medium]
BANK1_CALIBRATION_STATE_XDATA_IO_18B23 EQU 0x18B23 ; calibration state/XDATA handler; large state machine [medium]
BANK1_CALIBRATION_STATE_ANALOG_FRONTEND_18CF1 EQU 0x18CF1 ; calibration state/XDATA handler; analog front-end control; measurement register path [medium]
BANK1_CALIBRATION_STATE_MEASUREMENT_REGS_18DDA EQU 0x18DDA ; calibration state/XDATA handler; measurement register path; numeric helper; large state machine [medium]
BANK1_CALIBRATION_STATE_MEASUREMENT_REGS_19BFB EQU 0x19BFB ; calibration state/XDATA handler; measurement register path; large state machine [medium]
BANK1_CALIBRATION_STATE_XDATA_IO_19FB1 EQU 0x19FB1 ; calibration state/XDATA handler; large state machine [medium]
BANK1_CAL_CAPTURE_REGS EQU 0x1A1E0 ; Captures and stages calibration registers from 0x865x into 0x8A8x working area. [high]
BANK1_CALIBRATION_STATE_NUMERIC_ENGINE_1A52C EQU 0x1A52C ; calibration state/XDATA handler; numeric helper; large state machine [medium]
BANK1_CAL_COMPUTE_STAGE EQU 0x1AA31 ; Calibration compute stage seeded from 0x8A86..0x8A8E with service/memory helpers. [medium]
BANK1_CALIBRATION_STATE_ANALOG_FRONTEND_1ACD4 EQU 0x1ACD4 ; calibration state/XDATA handler; analog front-end control; measurement register path; large state machine [medium]
BANK1_CALIBRATION_STATE_XDATA_IO_1AFB0 EQU 0x1AFB0 ; calibration state/XDATA handler [low]
BANK1_XDATA_IO_1B0E8 EQU 0x1B0E8 ; general helper / control-flow block [low]
BANK1_CALIBRATION_STATE_NUMERIC_ENGINE_1B0F8 EQU 0x1B0F8 ; calibration state/XDATA handler; numeric helper; large state machine [medium]
BANK1_CALIBRATION_STATE_MEASUREMENT_REGS_1B311 EQU 0x1B311 ; calibration state/XDATA handler; measurement register path; large state machine [medium]
BANK1_CALIBRATION_STATE_XDATA_IO_1B521 EQU 0x1B521 ; calibration state/XDATA handler; large state machine [medium]
BANK1_CALIBRATION_STATE_MEASUREMENT_REGS_1BBF7 EQU 0x1BBF7 ; calibration state/XDATA handler; measurement register path; large state machine [medium]
BANK1_CALIBRATION_STATE_ANALOG_FRONTEND_1CA15 EQU 0x1CA15 ; calibration state/XDATA handler; analog front-end control; measurement register path; numeric helper; large state machine [medium]
BANK1_CALIBRATION_STATE_ANALOG_FRONTEND_1D190 EQU 0x1D190 ; calibration state/XDATA handler; analog front-end control; measurement register path; numeric helper; large state machine [medium]
BANK1_CALIBRATION_STATE_MEASUREMENT_REGS_1D6E3 EQU 0x1D6E3 ; calibration state/XDATA handler; measurement register path; numeric helper; large state machine [medium]
BANK1_JUMP_TABLE_DISPATCH_CALIBRATION_STATE_1E77B EQU 0x1E77B ; jump-table dispatcher; calibration state/XDATA handler; measurement register path; large state machine [medium]
BANK1_AFE_SEQUENCE_A EQU 0x1EF5C ; Analog front-end control sequence via 0x8054/0x7D02/0x7E01; used in measurement setup. [high]
BANK1_AFE_SEQUENCE_B EQU 0x1EFDF ; Alternate AFE sequence and mode-bit staging around 0x8AE2 + 0x7E01. [high]
BANK1_AFE_CLEAR_AND_TRIGGER EQU 0x1EFFE ; Clears AFE control bits and starts trigger pulse path. [high]
BANK1_AFE_PULSE_TRIGGER EQU 0x1F011 ; AFE pulse/trigger primitive toggling control bits then waiting for completion. [high]
BANK1_CALIBRATION_STATE_ANALOG_FRONTEND_1F062 EQU 0x1F062 ; calibration state/XDATA handler; analog front-end control; measurement register path [medium]
BANK1_CALIBRATION_STATE_ANALOG_FRONTEND_1F0B7 EQU 0x1F0B7 ; calibration state/XDATA handler; analog front-end control; measurement register path [medium]
BANK1_ANALOG_FRONTEND_MEASUREMENT_REGS_1F0D6 EQU 0x1F0D6 ; analog front-end control; measurement register path [medium]
BANK1_JUMP_TABLE_DISPATCH_CALIBRATION_STATE_1F12F EQU 0x1F12F ; jump-table dispatcher; calibration state/XDATA handler; analog front-end control [medium]
BANK1_STATE_TO_CONTROL_MAP EQU 0x1F267 ; Maps staged state in 0x8AD0..0x8AD3 to control-byte programming. [medium]
BANK1_CALIBRATION_STATE_ANALOG_FRONTEND_1F311 EQU 0x1F311 ; calibration state/XDATA handler; analog front-end control; measurement register path; numeric helper; large state machine [medium]
BANK1_LARGE_STATE_MACHINE_1FC9B EQU 0x1FC9B ; large state machine [low]

; Protocol/string anchors
STR_CALIBRATED EQU 0x02191 ; "CALIBRATED"
STR_CALIBRATION EQU 0x021AE ; "CALIBRATION!"
STR_ERROR_4 EQU 0x0229B ; "ERROR 4"
STR_ERROR EQU 0x02E4D ; "Error"
STR_CALON EQU 0x03026 ; "CALON"
STR_CALOFF EQU 0x0302C ; "CALOFF"
STR_CALIBRATED EQU 0x03033 ; "CALIBRATED"
STR_UNIT_IS_CALIBRATED EQU 0x0303E ; "UNIT IS CALIBRATED"
STR_UNIT_IS_NOT_CALIBRATED EQU 0x03051 ; "UNIT IS NOT CALIBRATED"
STR_CALSET EQU 0x03068 ; "CALSET"
STR_CALCLR EQU 0x0306F ; "CALCLR"
STR_CALF EQU 0x03076 ; "CALF..."
STR_ISRC_1UA EQU 0x0307E ; "ISRC 1uA"
STR_ISRC_10UA EQU 0x03087 ; "ISRC 10uA"
STR_ISRC_33UA EQU 0x03091 ; "ISRC 33uA"
STR_ISRC_100UA EQU 0x0309B ; "ISRC 100uA"
STR_ISRC_1MA EQU 0x030A6 ; "ISRC 1mA"
STR_ISRC_10MA EQU 0x030AF ; "ISRC 10mA"
STR_ISRC_100MA EQU 0x030B9 ; "ISRC 100mA"
STR_ISRC_OFF EQU 0x030C4 ; "ISRC OFF"
STR_GAIN_D_6_4F EQU 0x030CD ; "GAIN%d %6.4f"
STR_ERROR_6_4F EQU 0x030DA ; "ERROR %6.4f"
STR_CLRPAR EQU 0x030E6 ; "CLRPAR"
STR_BEEP EQU 0x031B1 ; "BEEP"
STR_GAIN EQU 0x031BF ; "GAIN"
STR_ISRC EQU 0x031C4 ; "ISRC"
STR_CALF EQU 0x031CD ; "CALF"
STR_CALCHK EQU 0x031D8 ; "CALCHK"
STR_SER EQU 0x031DF ; "SER#"
STR_SER EQU 0x031E4 ; "SER#?"
STR_CALF EQU 0x03220 ; "CALF?"
STR_CALDATE EQU 0x03226 ; "CALDATE"
STR_CALDATE EQU 0x0322E ; "CALDATE?"
STR_SELECTION_ERROR EQU 0x03249 ; "SELECTION ERROR"
STR_ERROR_1 EQU 0x0325B ; "ERROR 1"
STR_ERROR_2 EQU 0x03287 ; "ERROR 2"
STR_ERROR_3 EQU 0x032A1 ; "ERROR 3"
STR_ERROR_4 EQU 0x032CD ; "ERROR 4"
STR_ERROR_5 EQU 0x032F7 ; "ERROR 5"
STR_ERROR_6 EQU 0x03321 ; "ERROR 6"
STR_ERROR_7 EQU 0x0334B ; "ERROR 7"
STR_ERROR_8 EQU 0x03353 ; "ERROR 8"
STR_ERROR_8 EQU 0x03377 ; "ERROR 8"
STR_CALIBRATED EQU 0x12191 ; "CALIBRATED"
STR_CALIBRATION EQU 0x121AE ; "CALIBRATION!"
STR_ERROR_4 EQU 0x1229B ; "ERROR 4"
STR_ERROR EQU 0x12E4D ; "Error"
STR_CALON EQU 0x13026 ; "CALON"
STR_CALOFF EQU 0x1302C ; "CALOFF"
STR_CALIBRATED EQU 0x13033 ; "CALIBRATED"
STR_UNIT_IS_CALIBRATED EQU 0x1303E ; "UNIT IS CALIBRATED"
STR_UNIT_IS_NOT_CALIBRATED EQU 0x13051 ; "UNIT IS NOT CALIBRATED"
STR_CALSET EQU 0x13068 ; "CALSET"
STR_CALCLR EQU 0x1306F ; "CALCLR"
STR_CALF EQU 0x13076 ; "CALF..."
STR_ISRC_1UA EQU 0x1307E ; "ISRC 1uA"
STR_ISRC_10UA EQU 0x13087 ; "ISRC 10uA"
STR_ISRC_33UA EQU 0x13091 ; "ISRC 33uA"
STR_ISRC_100UA EQU 0x1309B ; "ISRC 100uA"
STR_ISRC_1MA EQU 0x130A6 ; "ISRC 1mA"
STR_ISRC_10MA EQU 0x130AF ; "ISRC 10mA"
STR_ISRC_100MA EQU 0x130B9 ; "ISRC 100mA"
STR_ISRC_OFF EQU 0x130C4 ; "ISRC OFF"
STR_GAIN_D_6_4F EQU 0x130CD ; "GAIN%d %6.4f"
STR_ERROR_6_4F EQU 0x130DA ; "ERROR %6.4f"
STR_CLRPAR EQU 0x130E6 ; "CLRPAR"
STR_BEEP EQU 0x131B1 ; "BEEP"
STR_GAIN EQU 0x131BF ; "GAIN"
STR_ISRC EQU 0x131C4 ; "ISRC"
STR_CALF EQU 0x131CD ; "CALF"
STR_CALCHK EQU 0x131D8 ; "CALCHK"
STR_SER EQU 0x131DF ; "SER#"
STR_SER EQU 0x131E4 ; "SER#?"
STR_CALF EQU 0x13220 ; "CALF?"
STR_CALDATE EQU 0x13226 ; "CALDATE"
STR_CALDATE EQU 0x1322E ; "CALDATE?"
STR_SELECTION_ERROR EQU 0x13249 ; "SELECTION ERROR"
STR_ERROR_1 EQU 0x1325B ; "ERROR 1"
STR_ERROR_2 EQU 0x13287 ; "ERROR 2"
STR_ERROR_3 EQU 0x132A1 ; "ERROR 3"
STR_ERROR_4 EQU 0x132CD ; "ERROR 4"
STR_ERROR_5 EQU 0x132F7 ; "ERROR 5"
STR_ERROR_6 EQU 0x13321 ; "ERROR 6"
STR_ERROR_7 EQU 0x1334B ; "ERROR 7"
STR_ERROR_8 EQU 0x13353 ; "ERROR 8"
STR_ERROR_8 EQU 0x13377 ; "ERROR 8"
