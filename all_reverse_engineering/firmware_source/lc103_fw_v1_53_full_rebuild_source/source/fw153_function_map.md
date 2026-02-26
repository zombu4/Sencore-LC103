# LC103 FW v1.53 Function Map (Human-Commented)

Generated from full disassembly with heuristic role inference and explicit confidence levels.
Unknown/uncertain semantics are marked by lower confidence.

Total mapped function starts: 258

## High-Value Named Routines

- `bank0_boot_state_machine` @ `0x00000` (`0x005FD`): Top-level startup + mode dispatcher; contains early jump-table dispatch and readiness/error routing. [high]
- `bank0_reset_init` @ `0x037F9` (`0x038BB`): Reset/vector init: clears internal RAM, initializes stack, enters firmware init sequence. [high]
- `bank0_text_ptr_wrapper_a` @ `0x038C6` (`0x038CA`): Text/resource pointer wrapper feeding shared print/format routine. [high]
- `bank0_text_ptr_wrapper_b` @ `0x038CB` (`0x038CF`): Text/resource pointer wrapper feeding shared print/format routine. [high]
- `bank1_core_service_strobe` @ `0x11F64` (`0x11F79`): Core service strobe toggling control bits via XDATA 0x8035/0x7B00; called across measurement/calibration flows. [high]
- `bank1_measurement_wait_loop` @ `0x11F97` (`0x11FD0`): Stores parameters, invokes measurement compare path, loops until comparator/condition clears. [high]
- `bank1_text_ptr_wrapper_a` @ `0x138C6` (`0x138CA`): Bank-1 text/resource wrapper for shared print/format routine. [high]
- `bank1_text_ptr_wrapper_b` @ `0x138CB` (`0x138CF`): Bank-1 text/resource wrapper for shared print/format routine. [high]
- `bank1_math_core_op_a` @ `0x13B04` (`0x13C0C`): Core multi-byte arithmetic/normalization primitive used by numeric engine. [medium]
- `bank1_math_core_compare` @ `0x13CA6` (`0x13D12`): Multi-byte compare/normalize routine used heavily in numeric pipeline. [medium]
- `bank1_numeric_dispatch_a` @ `0x140AB` (`0x140D3`): Jump-table-driven numeric operation dispatcher (fixed/multi-byte math helpers). [medium]
- `bank1_mem_write_helper` @ `0x1413C` (`0x1414D`): Generic write helper for internal/XDATA addressing modes. [medium]
- `bank1_multibyte_add_helper` @ `0x1420F` (`0x14224`): Carry-aware multi-byte add helper on XDATA operands. [medium]
- `bank1_multibyte_cmp_helper` @ `0x143E8` (`0x143FD`): Signed/unsigned multi-byte compare helper used across math/calibration logic. [medium]
- `bank1_store_u32_xdata` @ `0x1444A` (`0x14455`): Stores r4..r7 32-bit value to XDATA at DPTR. [high]
- `bank1_xdata_table_loader` @ `0x14456` (`0x1446C`): Indirect table loader/copy helper (MOVC/MOVX) used broadly by calibration/math paths. [high]
- `bank1_numeric_dispatch_b` @ `0x1476B` (`0x14787`): Second jump-table numeric dispatcher with table at XDATA/ROM selector addresses. [medium]
- `bank1_calibration_accumulator` @ `0x150F8` (`0x15162`): Calibration/state accumulator using 0x8B39..0x8B3F and math helpers. [medium]
- `bank1_cal_capture_regs` @ `0x1A1E0` (`0x1A52B`): Captures and stages calibration registers from 0x865x into 0x8A8x working area. [high]
- `bank1_cal_compute_stage` @ `0x1AA31` (`0x1ACD3`): Calibration compute stage seeded from 0x8A86..0x8A8E with service/memory helpers. [medium]
- `bank1_afe_sequence_a` @ `0x1EF5C` (`0x1EFDE`): Analog front-end control sequence via 0x8054/0x7D02/0x7E01; used in measurement setup. [high]
- `bank1_afe_sequence_b` @ `0x1EFDF` (`0x1EFFD`): Alternate AFE sequence and mode-bit staging around 0x8AE2 + 0x7E01. [high]
- `bank1_afe_clear_and_trigger` @ `0x1EFFE` (`0x1F010`): Clears AFE control bits and starts trigger pulse path. [high]
- `bank1_afe_pulse_trigger` @ `0x1F011` (`0x1F061`): AFE pulse/trigger primitive toggling control bits then waiting for completion. [high]
- `bank1_state_to_control_map` @ `0x1F267` (`0x1F310`): Maps staged state in 0x8AD0..0x8AD3 to control-byte programming. [medium]

## Complete Function Index

| Start | End | Name | Role | Confidence | Tags |
|---|---|---|---|---|---|
| `0x00000` | `0x005FD` | `bank0_boot_state_machine` | Top-level startup + mode dispatcher; contains early jump-table dispatch and readiness/error routing. | high | analog_frontend; calibration_state; jump_table_dispatch; large_state_machine; measurement_regs; service_strobe; xdata_io |
| `0x005FE` | `0x0151C` | `bank0_calibration_state_analog_frontend_005fe` | calibration state/XDATA handler; analog front-end control; measurement register path; numeric helper; large state machine | medium | analog_frontend; calibration_state; large_state_machine; measurement_regs; numeric_engine; service_strobe; xdata_io |
| `0x0151D` | `0x01628` | `bank0_calibration_state_measurement_regs_0151d` | calibration state/XDATA handler; measurement register path | medium | calibration_state; measurement_regs; xdata_io |
| `0x01629` | `0x0182D` | `bank0_analog_frontend_measurement_regs_01629` | analog front-end control; measurement register path; large state machine | medium | analog_frontend; large_state_machine; measurement_regs; service_strobe; xdata_io |
| `0x0182E` | `0x01BEF` | `bank0_calibration_state_measurement_regs_0182e` | calibration state/XDATA handler; measurement register path; numeric helper; large state machine | medium | calibration_state; large_state_machine; measurement_regs; numeric_engine; xdata_io |
| `0x01BF0` | `0x01C93` | `bank0_analog_frontend_measurement_regs_01bf0` | analog front-end control; measurement register path | medium | analog_frontend; measurement_regs; service_strobe; xdata_io |
| `0x01C94` | `0x01F63` | `bank0_calibration_state_measurement_regs_01c94` | calibration state/XDATA handler; measurement register path; large state machine | medium | calibration_state; large_state_machine; measurement_regs; xdata_io |
| `0x01F64` | `0x01F79` | `bank0_measurement_regs_service_strobe_01f64` | measurement register path | medium | measurement_regs; service_strobe; xdata_io |
| `0x01F7A` | `0x01F96` | `bank0_measurement_regs_service_strobe_01f7a` | measurement register path | medium | measurement_regs; service_strobe; xdata_io |
| `0x01F97` | `0x024DC` | `bank0_calibration_state_numeric_engine_01f97` | calibration state/XDATA handler; numeric helper; large state machine | medium | calibration_state; large_state_machine; numeric_engine; shared_helper; xdata_io |
| `0x024DD` | `0x02618` | `bank0_xdata_io_vector_entry_024dd` | Interrupt/reset vector handler entry | medium | vector_entry; xdata_io |
| `0x02619` | `0x026DD` | `bank0_analog_frontend_measurement_regs_02619` | Interrupt/reset vector handler entry; analog front-end control; measurement register path | medium | analog_frontend; measurement_regs; vector_entry; xdata_io |
| `0x026DE` | `0x02BA7` | `bank0_calibration_state_measurement_regs_026de` | Interrupt/reset vector handler entry; calibration state/XDATA handler; measurement register path; numeric helper; large state machine | medium | calibration_state; large_state_machine; measurement_regs; numeric_engine; vector_entry; xdata_io |
| `0x02BA8` | `0x02CEC` | `bank0_calibration_state_analog_frontend_02ba8` | calibration state/XDATA handler; analog front-end control; measurement register path; numeric helper | medium | analog_frontend; calibration_state; measurement_regs; numeric_engine; xdata_io |
| `0x02CED` | `0x037F8` | `bank0_jump_table_dispatch_calibration_state_02ced` | jump-table dispatcher; calibration state/XDATA handler; analog front-end control; measurement register path; numeric helper; large state machine | medium | analog_frontend; calibration_state; jump_table_dispatch; large_state_machine; measurement_regs; numeric_engine; xdata_io |
| `0x037F9` | `0x038BB` | `bank0_reset_init` | Reset/vector init: clears internal RAM, initializes stack, enters firmware init sequence. | high | jump_table_dispatch; vector_entry; xdata_io |
| `0x038BC` | `0x038C0` | `bank0_fn_038bc` | general helper / control-flow block | low |  |
| `0x038C1` | `0x038C5` | `bank0_fn_038c1` | general helper / control-flow block | low |  |
| `0x038C6` | `0x038CA` | `bank0_text_ptr_wrapper_a` | Text/resource pointer wrapper feeding shared print/format routine. | high | shared_helper |
| `0x038CB` | `0x038CF` | `bank0_text_ptr_wrapper_b` | Text/resource pointer wrapper feeding shared print/format routine. | high | shared_helper |
| `0x038D0` | `0x038D4` | `bank0_fn_038d0` | general helper / control-flow block | low |  |
| `0x038D5` | `0x038D9` | `bank0_fn_038d5` | general helper / control-flow block | low |  |
| `0x038DA` | `0x038DE` | `bank0_fn_038da` | general helper / control-flow block | low |  |
| `0x038DF` | `0x038E3` | `bank0_fn_038df` | general helper / control-flow block | low |  |
| `0x038E4` | `0x038E8` | `bank0_fn_038e4` | general helper / control-flow block | low |  |
| `0x038E9` | `0x038ED` | `bank0_fn_038e9` | general helper / control-flow block | low |  |
| `0x038EE` | `0x038F2` | `bank0_fn_038ee` | general helper / control-flow block | low |  |
| `0x038F3` | `0x038F7` | `bank0_fn_038f3` | general helper / control-flow block | low |  |
| `0x038F8` | `0x038FC` | `bank0_fn_038f8` | general helper / control-flow block | low |  |
| `0x038FD` | `0x03901` | `bank0_fn_038fd` | general helper / control-flow block | low |  |
| `0x03902` | `0x03906` | `bank0_fn_03902` | general helper / control-flow block | low |  |
| `0x03907` | `0x0390B` | `bank0_fn_03907` | general helper / control-flow block | low |  |
| `0x0390C` | `0x03910` | `bank0_fn_0390c` | general helper / control-flow block | low |  |
| `0x03911` | `0x03915` | `bank0_calibration_state_03911` | calibration state/XDATA handler | low | calibration_state |
| `0x03916` | `0x0391A` | `bank0_fn_03916` | general helper / control-flow block | low |  |
| `0x0391B` | `0x0391F` | `bank0_fn_0391b` | general helper / control-flow block | low |  |
| `0x03920` | `0x03924` | `bank0_fn_03920` | general helper / control-flow block | low |  |
| `0x03925` | `0x03929` | `bank0_fn_03925` | general helper / control-flow block | low |  |
| `0x0392A` | `0x0392E` | `bank0_fn_0392a` | general helper / control-flow block | low |  |
| `0x0392F` | `0x03933` | `bank0_fn_0392f` | general helper / control-flow block | low |  |
| `0x03934` | `0x03938` | `bank0_fn_03934` | general helper / control-flow block | low |  |
| `0x03939` | `0x0393D` | `bank0_fn_03939` | general helper / control-flow block | low |  |
| `0x0393E` | `0x039AA` | `bank0_calibration_state_0393e` | calibration state/XDATA handler | low | calibration_state |
| `0x039AB` | `0x03A0E` | `bank0_fn_039ab` | general helper / control-flow block | low |  |
| `0x03A0F` | `0x03A12` | `bank0_fn_03a0f` | general helper / control-flow block | low |  |
| `0x03A13` | `0x03B03` | `bank0_numeric_engine_03a13` | numeric helper | low | numeric_engine |
| `0x03B04` | `0x03C0C` | `bank0_numeric_engine_03b04` | numeric helper | low | numeric_engine |
| `0x03C0D` | `0x03CA5` | `bank0_fn_03c0d` | general helper / control-flow block | low |  |
| `0x03CA6` | `0x03D12` | `bank0_fn_03ca6` | general helper / control-flow block | low |  |
| `0x03D13` | `0x03D17` | `bank0_fn_03d13` | general helper / control-flow block | low |  |
| `0x03D18` | `0x03D50` | `bank0_fn_03d18` | general helper / control-flow block | low |  |
| `0x03D51` | `0x040AA` | `bank0_numeric_engine_xdata_io_03d51` | numeric helper; large state machine | medium | large_state_machine; numeric_engine; xdata_io |
| `0x040AB` | `0x0413B` | `bank0_jump_table_dispatch_xdata_io_040ab` | jump-table dispatcher | medium | jump_table_dispatch; xdata_io |
| `0x0413C` | `0x0414D` | `bank0_xdata_io_shared_helper_0413c` | general helper / control-flow block | low | shared_helper; xdata_io |
| `0x0414E` | `0x0416F` | `bank0_xdata_io_0414e` | general helper / control-flow block | low | xdata_io |
| `0x04170` | `0x04183` | `bank0_fn_04170` | general helper / control-flow block | low |  |
| `0x04184` | `0x041D8` | `bank0_fn_04184` | general helper / control-flow block | low |  |
| `0x041D9` | `0x0420E` | `bank0_fn_041d9` | general helper / control-flow block | low |  |
| `0x0420F` | `0x0423A` | `bank0_xdata_io_0420f` | general helper / control-flow block | low | xdata_io |
| `0x0423B` | `0x0429D` | `bank0_xdata_io_0423b` | general helper / control-flow block | low | xdata_io |
| `0x0429E` | `0x043E7` | `bank0_numeric_engine_xdata_io_0429e` | numeric helper; large state machine | medium | large_state_machine; numeric_engine; xdata_io |
| `0x043E8` | `0x043FD` | `bank0_fn_043e8` | general helper / control-flow block | low |  |
| `0x043FE` | `0x04449` | `bank0_xdata_io_043fe` | general helper / control-flow block | low | xdata_io |
| `0x0444A` | `0x04455` | `bank0_xdata_io_shared_helper_0444a` | general helper / control-flow block | low | shared_helper; xdata_io |
| `0x04456` | `0x044CC` | `bank0_jump_table_dispatch_xdata_io_04456` | jump-table dispatcher | medium | jump_table_dispatch; shared_helper; xdata_io |
| `0x044CD` | `0x04681` | `bank0_jump_table_dispatch_xdata_io_044cd` | jump-table dispatcher; large state machine | medium | jump_table_dispatch; large_state_machine; xdata_io |
| `0x04682` | `0x0476A` | `bank0_jump_table_dispatch_xdata_io_04682` | jump-table dispatcher | medium | jump_table_dispatch; xdata_io |
| `0x0476B` | `0x050F7` | `bank0_jump_table_dispatch_calibration_state_0476b` | jump-table dispatcher; calibration state/XDATA handler; numeric helper; large state machine | medium | calibration_state; jump_table_dispatch; large_state_machine; numeric_engine; xdata_io |
| `0x050F8` | `0x052F7` | `bank0_calibration_state_xdata_io_050f8` | calibration state/XDATA handler; large state machine | medium | calibration_state; large_state_machine; xdata_io |
| `0x052F8` | `0x0FFFF` | `bank0_jump_table_dispatch_calibration_state_052f8` | jump-table dispatcher; calibration state/XDATA handler; analog front-end control; measurement register path; numeric helper; large state machine | medium | analog_frontend; calibration_state; jump_table_dispatch; large_state_machine; measurement_regs; numeric_engine; service_strobe; xdata_io |
| `0x10016` | `0x105FD` | `bank1_jump_table_dispatch_calibration_state_10016` | jump-table dispatcher; calibration state/XDATA handler; analog front-end control; measurement register path; large state machine | medium | analog_frontend; calibration_state; jump_table_dispatch; large_state_machine; measurement_regs; service_strobe; xdata_io |
| `0x105FE` | `0x10907` | `bank1_calibration_state_analog_frontend_105fe` | calibration state/XDATA handler; analog front-end control; measurement register path; large state machine | medium | analog_frontend; calibration_state; large_state_machine; measurement_regs; service_strobe; xdata_io |
| `0x10908` | `0x10CB4` | `bank1_calibration_state_numeric_engine_10908` | calibration state/XDATA handler; numeric helper; large state machine | medium | calibration_state; large_state_machine; numeric_engine; shared_helper; xdata_io |
| `0x10CB5` | `0x114FF` | `bank1_calibration_state_numeric_engine_10cb5` | calibration state/XDATA handler; numeric helper; large state machine | medium | calibration_state; large_state_machine; numeric_engine; xdata_io |
| `0x11500` | `0x1151C` | `bank1_measurement_regs_xdata_io_11500` | measurement register path | low | measurement_regs; xdata_io |
| `0x1151D` | `0x11628` | `bank1_calibration_state_measurement_regs_1151d` | calibration state/XDATA handler; measurement register path | medium | calibration_state; measurement_regs; shared_helper; xdata_io |
| `0x11629` | `0x1182D` | `bank1_analog_frontend_measurement_regs_11629` | analog front-end control; measurement register path; large state machine | medium | analog_frontend; large_state_machine; measurement_regs; service_strobe; xdata_io |
| `0x1182E` | `0x11929` | `bank1_xdata_io_1182e` | general helper / control-flow block | low | xdata_io |
| `0x1192A` | `0x119BC` | `bank1_calibration_state_xdata_io_1192a` | calibration state/XDATA handler | low | calibration_state; xdata_io |
| `0x119BD` | `0x119E9` | `bank1_fn_119bd` | general helper / control-flow block | low |  |
| `0x119EA` | `0x11A16` | `bank1_fn_119ea` | general helper / control-flow block | low |  |
| `0x11A17` | `0x11BEF` | `bank1_calibration_state_measurement_regs_11a17` | calibration state/XDATA handler; measurement register path; numeric helper; large state machine | medium | calibration_state; large_state_machine; measurement_regs; numeric_engine; xdata_io |
| `0x11BF0` | `0x11C93` | `bank1_analog_frontend_measurement_regs_11bf0` | analog front-end control; measurement register path | medium | analog_frontend; measurement_regs; service_strobe; xdata_io |
| `0x11C94` | `0x11CD5` | `bank1_calibration_state_xdata_io_11c94` | calibration state/XDATA handler | low | calibration_state; xdata_io |
| `0x11CD6` | `0x11F45` | `bank1_calibration_state_measurement_regs_11cd6` | calibration state/XDATA handler; measurement register path; large state machine | medium | calibration_state; large_state_machine; measurement_regs; xdata_io |
| `0x11F46` | `0x11F63` | `bank1_fn_11f46` | general helper / control-flow block | low |  |
| `0x11F64` | `0x11F79` | `bank1_core_service_strobe` | Core service strobe toggling control bits via XDATA 0x8035/0x7B00; called across measurement/calibration flows. | high | high_fan_in_core; measurement_regs; service_strobe; xdata_io |
| `0x11F7A` | `0x11F96` | `bank1_measurement_regs_service_strobe_11f7a` | measurement register path | medium | measurement_regs; service_strobe; xdata_io |
| `0x11F97` | `0x11FD0` | `bank1_measurement_wait_loop` | Stores parameters, invokes measurement compare path, loops until comparator/condition clears. | high | calibration_state; shared_helper; xdata_io |
| `0x11FD1` | `0x12254` | `bank1_calibration_state_xdata_io_11fd1` | calibration state/XDATA handler; large state machine | medium | calibration_state; large_state_machine; xdata_io |
| `0x12255` | `0x128FF` | `bank1_analog_frontend_measurement_regs_12255` | analog front-end control; measurement register path; numeric helper; large state machine | medium | analog_frontend; large_state_machine; measurement_regs; numeric_engine; xdata_io |
| `0x12900` | `0x12A09` | `bank1_xdata_io_12900` | general helper / control-flow block | low | xdata_io |
| `0x12A0A` | `0x12AAE` | `bank1_calibration_state_measurement_regs_12a0a` | calibration state/XDATA handler; measurement register path | medium | calibration_state; measurement_regs; xdata_io |
| `0x12AAF` | `0x12B8C` | `bank1_calibration_state_measurement_regs_12aaf` | calibration state/XDATA handler; measurement register path | medium | calibration_state; measurement_regs; xdata_io |
| `0x12B8D` | `0x12BA7` | `bank1_measurement_regs_xdata_io_12b8d` | measurement register path | low | measurement_regs; xdata_io |
| `0x12BA8` | `0x12CEC` | `bank1_calibration_state_analog_frontend_12ba8` | calibration state/XDATA handler; analog front-end control; measurement register path; numeric helper | medium | analog_frontend; calibration_state; measurement_regs; numeric_engine; xdata_io |
| `0x12CED` | `0x13039` | `bank1_jump_table_dispatch_calibration_state_12ced` | jump-table dispatcher; calibration state/XDATA handler; analog front-end control; measurement register path; numeric helper; large state machine | medium | analog_frontend; calibration_state; jump_table_dispatch; large_state_machine; measurement_regs; numeric_engine; xdata_io |
| `0x1303A` | `0x130FF` | `bank1_command_tables_region_1303a` | general helper / control-flow block | low | command_tables_region |
| `0x13100` | `0x1312D` | `bank1_jump_table_dispatch_command_tables_region_13100` | jump-table dispatcher | medium | command_tables_region; jump_table_dispatch |
| `0x1312E` | `0x1312F` | `bank1_command_tables_region_1312e` | general helper / control-flow block | low | command_tables_region |
| `0x13130` | `0x13165` | `bank1_command_tables_region_13130` | general helper / control-flow block | low | command_tables_region |
| `0x13166` | `0x138BB` | `bank1_jump_table_dispatch_numeric_engine_13166` | jump-table dispatcher; numeric helper; large state machine | medium | command_tables_region; jump_table_dispatch; large_state_machine; numeric_engine; xdata_io |
| `0x138BC` | `0x138C0` | `bank1_fn_138bc` | general helper / control-flow block | low |  |
| `0x138C1` | `0x138C5` | `bank1_fn_138c1` | general helper / control-flow block | low |  |
| `0x138C6` | `0x138CA` | `bank1_text_ptr_wrapper_a` | Bank-1 text/resource wrapper for shared print/format routine. | high | shared_helper |
| `0x138CB` | `0x138CF` | `bank1_text_ptr_wrapper_b` | Bank-1 text/resource wrapper for shared print/format routine. | high | shared_helper |
| `0x138D0` | `0x138D4` | `bank1_fn_138d0` | general helper / control-flow block | low |  |
| `0x138D5` | `0x138D9` | `bank1_fn_138d5` | general helper / control-flow block | low |  |
| `0x138DA` | `0x138DE` | `bank1_fn_138da` | general helper / control-flow block | low |  |
| `0x138DF` | `0x138E3` | `bank1_fn_138df` | general helper / control-flow block | low |  |
| `0x138E4` | `0x138E8` | `bank1_fn_138e4` | general helper / control-flow block | low |  |
| `0x138E9` | `0x138ED` | `bank1_fn_138e9` | general helper / control-flow block | low |  |
| `0x138EE` | `0x138F2` | `bank1_fn_138ee` | general helper / control-flow block | low |  |
| `0x138F3` | `0x138F7` | `bank1_fn_138f3` | general helper / control-flow block | low |  |
| `0x138F8` | `0x138FC` | `bank1_fn_138f8` | general helper / control-flow block | low |  |
| `0x138FD` | `0x13901` | `bank1_fn_138fd` | general helper / control-flow block | low |  |
| `0x13902` | `0x13906` | `bank1_fn_13902` | general helper / control-flow block | low |  |
| `0x13907` | `0x1390B` | `bank1_fn_13907` | general helper / control-flow block | low |  |
| `0x1390C` | `0x13910` | `bank1_fn_1390c` | general helper / control-flow block | low |  |
| `0x13911` | `0x13915` | `bank1_calibration_state_13911` | calibration state/XDATA handler | low | calibration_state |
| `0x13916` | `0x1391A` | `bank1_fn_13916` | general helper / control-flow block | low |  |
| `0x1391B` | `0x1391F` | `bank1_fn_1391b` | general helper / control-flow block | low |  |
| `0x13920` | `0x13924` | `bank1_fn_13920` | general helper / control-flow block | low |  |
| `0x13925` | `0x13929` | `bank1_fn_13925` | general helper / control-flow block | low |  |
| `0x1392A` | `0x1392E` | `bank1_fn_1392a` | general helper / control-flow block | low |  |
| `0x1392F` | `0x13933` | `bank1_fn_1392f` | general helper / control-flow block | low |  |
| `0x13934` | `0x13938` | `bank1_fn_13934` | general helper / control-flow block | low |  |
| `0x13939` | `0x1393D` | `bank1_fn_13939` | general helper / control-flow block | low |  |
| `0x1393E` | `0x13942` | `bank1_calibration_state_1393e` | calibration state/XDATA handler | low | calibration_state |
| `0x13943` | `0x13947` | `bank1_fn_13943` | general helper / control-flow block | low |  |
| `0x13948` | `0x1394C` | `bank1_shared_helper_13948` | general helper / control-flow block | low | shared_helper |
| `0x1394D` | `0x1395B` | `bank1_fn_1394d` | general helper / control-flow block | low |  |
| `0x1395C` | `0x13961` | `bank1_fn_1395c` | general helper / control-flow block | low |  |
| `0x13962` | `0x1399D` | `bank1_calibration_state_13962` | calibration state/XDATA handler | low | calibration_state |
| `0x1399E` | `0x139AA` | `bank1_calibration_state_1399e` | calibration state/XDATA handler | low | calibration_state |
| `0x139AB` | `0x139E0` | `bank1_fn_139ab` | general helper / control-flow block | low |  |
| `0x139E1` | `0x139EE` | `bank1_fn_139e1` | general helper / control-flow block | low |  |
| `0x139EF` | `0x13A0E` | `bank1_fn_139ef` | general helper / control-flow block | low |  |
| `0x13A0F` | `0x13A12` | `bank1_fn_13a0f` | general helper / control-flow block | low |  |
| `0x13A13` | `0x13B03` | `bank1_numeric_engine_shared_helper_13a13` | numeric helper | low | numeric_engine; shared_helper |
| `0x13B04` | `0x13C0C` | `bank1_math_core_op_a` | Core multi-byte arithmetic/normalization primitive used by numeric engine. | medium | high_fan_in_core; numeric_engine |
| `0x13C0D` | `0x13CA5` | `bank1_shared_helper_13c0d` | general helper / control-flow block | low | shared_helper |
| `0x13CA6` | `0x13D12` | `bank1_math_core_compare` | Multi-byte compare/normalize routine used heavily in numeric pipeline. | medium | high_fan_in_core |
| `0x13D13` | `0x13D17` | `bank1_fn_13d13` | general helper / control-flow block | low |  |
| `0x13D18` | `0x13D1C` | `bank1_shared_helper_13d18` | general helper / control-flow block | low | shared_helper |
| `0x13D1D` | `0x13D50` | `bank1_fn_13d1d` | general helper / control-flow block | low |  |
| `0x13D51` | `0x13D87` | `bank1_shared_helper_13d51` | general helper / control-flow block | low | shared_helper |
| `0x13D88` | `0x13DD0` | `bank1_fn_13d88` | general helper / control-flow block | low |  |
| `0x13DD1` | `0x13DE1` | `bank1_fn_13dd1` | general helper / control-flow block | low |  |
| `0x13DE2` | `0x13F53` | `bank1_numeric_engine_xdata_io_13de2` | numeric helper | low | numeric_engine; xdata_io |
| `0x13F54` | `0x13F6D` | `bank1_fn_13f54` | general helper / control-flow block | low |  |
| `0x13F6E` | `0x13F7C` | `bank1_fn_13f6e` | general helper / control-flow block | low |  |
| `0x13F7D` | `0x13F81` | `bank1_fn_13f7d` | general helper / control-flow block | low |  |
| `0x13F82` | `0x13F93` | `bank1_fn_13f82` | general helper / control-flow block | low |  |
| `0x13F94` | `0x13FA2` | `bank1_fn_13f94` | general helper / control-flow block | low |  |
| `0x13FA3` | `0x140AA` | `bank1_xdata_io_13fa3` | general helper / control-flow block | low | xdata_io |
| `0x140AB` | `0x140D3` | `bank1_numeric_dispatch_a` | Jump-table-driven numeric operation dispatcher (fixed/multi-byte math helpers). | medium | jump_table_dispatch |
| `0x140D4` | `0x140F5` | `bank1_fn_140d4` | general helper / control-flow block | low |  |
| `0x140F6` | `0x1410E` | `bank1_xdata_io_shared_helper_140f6` | general helper / control-flow block | low | shared_helper; xdata_io |
| `0x1410F` | `0x1413B` | `bank1_xdata_io_shared_helper_1410f` | general helper / control-flow block | low | shared_helper; xdata_io |
| `0x1413C` | `0x1414D` | `bank1_mem_write_helper` | Generic write helper for internal/XDATA addressing modes. | medium | shared_helper; xdata_io |
| `0x1414E` | `0x1416F` | `bank1_xdata_io_1414e` | general helper / control-flow block | low | xdata_io |
| `0x14170` | `0x14183` | `bank1_fn_14170` | general helper / control-flow block | low |  |
| `0x14184` | `0x141D8` | `bank1_fn_14184` | general helper / control-flow block | low |  |
| `0x141D9` | `0x1420E` | `bank1_fn_141d9` | general helper / control-flow block | low |  |
| `0x1420F` | `0x14224` | `bank1_multibyte_add_helper` | Carry-aware multi-byte add helper on XDATA operands. | medium | shared_helper; xdata_io |
| `0x14225` | `0x1423A` | `bank1_xdata_io_14225` | general helper / control-flow block | low | xdata_io |
| `0x1423B` | `0x1429D` | `bank1_xdata_io_1423b` | general helper / control-flow block | low | xdata_io |
| `0x1429E` | `0x14347` | `bank1_numeric_engine_xdata_io_1429e` | numeric helper | low | numeric_engine; xdata_io |
| `0x14348` | `0x143D9` | `bank1_numeric_engine_14348` | numeric helper | low | numeric_engine |
| `0x143DA` | `0x143E7` | `bank1_fn_143da` | general helper / control-flow block | low |  |
| `0x143E8` | `0x143FD` | `bank1_multibyte_cmp_helper` | Signed/unsigned multi-byte compare helper used across math/calibration logic. | medium | shared_helper |
| `0x143FE` | `0x14411` | `bank1_fn_143fe` | general helper / control-flow block | low |  |
| `0x14412` | `0x1441D` | `bank1_xdata_io_14412` | general helper / control-flow block | low | xdata_io |
| `0x1441E` | `0x1442D` | `bank1_fn_1441e` | general helper / control-flow block | low |  |
| `0x1442E` | `0x14439` | `bank1_xdata_io_1442e` | general helper / control-flow block | low | xdata_io |
| `0x1443A` | `0x14449` | `bank1_fn_1443a` | general helper / control-flow block | low |  |
| `0x1444A` | `0x14455` | `bank1_store_u32_xdata` | Stores r4..r7 32-bit value to XDATA at DPTR. | high | high_fan_in_core; xdata_io |
| `0x14456` | `0x1446C` | `bank1_xdata_table_loader` | Indirect table loader/copy helper (MOVC/MOVX) used broadly by calibration/math paths. | high | high_fan_in_core; jump_table_dispatch |
| `0x1446D` | `0x14486` | `bank1_xdata_io_1446d` | general helper / control-flow block | low | xdata_io |
| `0x14487` | `0x1449D` | `bank1_xdata_io_14487` | general helper / control-flow block | low | xdata_io |
| `0x1449E` | `0x144A6` | `bank1_xdata_io_1449e` | general helper / control-flow block | low | xdata_io |
| `0x144A7` | `0x144CC` | `bank1_jump_table_dispatch_144a7` | jump-table dispatcher | low | jump_table_dispatch |
| `0x144CD` | `0x14681` | `bank1_jump_table_dispatch_xdata_io_144cd` | jump-table dispatcher; large state machine | medium | jump_table_dispatch; large_state_machine; xdata_io |
| `0x14682` | `0x1476A` | `bank1_jump_table_dispatch_xdata_io_14682` | jump-table dispatcher | medium | jump_table_dispatch; xdata_io |
| `0x1476B` | `0x14787` | `bank1_numeric_dispatch_b` | Second jump-table numeric dispatcher with table at XDATA/ROM selector addresses. | medium | jump_table_dispatch; shared_helper |
| `0x14788` | `0x14796` | `bank1_xdata_io_14788` | general helper / control-flow block | low | xdata_io |
| `0x14797` | `0x147A9` | `bank1_fn_14797` | general helper / control-flow block | low |  |
| `0x147AA` | `0x147B2` | `bank1_fn_147aa` | general helper / control-flow block | low |  |
| `0x147B3` | `0x147B3` | `bank1_fn_147b3` | general helper / control-flow block | low |  |
| `0x147B4` | `0x147BB` | `bank1_fn_147b4` | general helper / control-flow block | low |  |
| `0x147BC` | `0x147BC` | `bank1_fn_147bc` | general helper / control-flow block | low |  |
| `0x147BD` | `0x147CA` | `bank1_fn_147bd` | general helper / control-flow block | low |  |
| `0x147CB` | `0x147DB` | `bank1_fn_147cb` | general helper / control-flow block | low |  |
| `0x147DC` | `0x147EC` | `bank1_fn_147dc` | general helper / control-flow block | low |  |
| `0x147ED` | `0x14971` | `bank1_calibration_state_xdata_io_147ed` | calibration state/XDATA handler | low | calibration_state; xdata_io |
| `0x14972` | `0x14B04` | `bank1_calibration_state_xdata_io_14972` | calibration state/XDATA handler | low | calibration_state; xdata_io |
| `0x14B05` | `0x14B20` | `bank1_calibration_state_14b05` | calibration state/XDATA handler | low | calibration_state |
| `0x14B21` | `0x14B22` | `bank1_fn_14b21` | general helper / control-flow block | low |  |
| `0x14B23` | `0x14B77` | `bank1_fn_14b23` | general helper / control-flow block | low |  |
| `0x14B78` | `0x14BA8` | `bank1_fn_14b78` | general helper / control-flow block | low |  |
| `0x14BA9` | `0x14C01` | `bank1_xdata_io_14ba9` | general helper / control-flow block | low | xdata_io |
| `0x14C02` | `0x14C3D` | `bank1_calibration_state_shared_helper_14c02` | calibration state/XDATA handler | low | calibration_state; shared_helper |
| `0x14C3E` | `0x14CA9` | `bank1_calibration_state_14c3e` | calibration state/XDATA handler | low | calibration_state |
| `0x14CAA` | `0x14D71` | `bank1_calibration_state_xdata_io_14caa` | calibration state/XDATA handler | low | calibration_state; xdata_io |
| `0x14D72` | `0x14DF3` | `bank1_calibration_state_xdata_io_14d72` | calibration state/XDATA handler | low | calibration_state; xdata_io |
| `0x14DF4` | `0x14EFE` | `bank1_numeric_engine_14df4` | numeric helper | low | numeric_engine |
| `0x14EFF` | `0x14F94` | `bank1_numeric_engine_xdata_io_14eff` | numeric helper | low | numeric_engine; xdata_io |
| `0x14F95` | `0x1509C` | `bank1_calibration_state_14f95` | calibration state/XDATA handler | low | calibration_state |
| `0x1509D` | `0x150B8` | `bank1_fn_1509d` | general helper / control-flow block | low |  |
| `0x150B9` | `0x150CD` | `bank1_fn_150b9` | general helper / control-flow block | low |  |
| `0x150CE` | `0x150F7` | `bank1_fn_150ce` | general helper / control-flow block | low |  |
| `0x150F8` | `0x15162` | `bank1_calibration_accumulator` | Calibration/state accumulator using 0x8B39..0x8B3F and math helpers. | medium | calibration_state; shared_helper; xdata_io |
| `0x15163` | `0x1528F` | `bank1_calibration_state_xdata_io_15163` | calibration state/XDATA handler | low | calibration_state; xdata_io |
| `0x15290` | `0x152F7` | `bank1_calibration_state_xdata_io_15290` | calibration state/XDATA handler | low | calibration_state; xdata_io |
| `0x152F8` | `0x1530C` | `bank1_shared_helper_152f8` | general helper / control-flow block | low | shared_helper |
| `0x1530D` | `0x15600` | `bank1_calibration_state_measurement_regs_1530d` | calibration state/XDATA handler; measurement register path; large state machine | medium | calibration_state; large_state_machine; measurement_regs; xdata_io |
| `0x15601` | `0x157E7` | `bank1_measurement_regs_xdata_io_15601` | measurement register path; large state machine | medium | large_state_machine; measurement_regs; xdata_io |
| `0x157E8` | `0x15B8A` | `bank1_calibration_state_measurement_regs_157e8` | calibration state/XDATA handler; measurement register path; numeric helper; large state machine | medium | calibration_state; large_state_machine; measurement_regs; numeric_engine; service_strobe; xdata_io |
| `0x15B8B` | `0x16DB9` | `bank1_calibration_state_measurement_regs_15b8b` | calibration state/XDATA handler; measurement register path; numeric helper; large state machine | medium | calibration_state; large_state_machine; measurement_regs; numeric_engine; xdata_io |
| `0x16DBA` | `0x16E8D` | `bank1_measurement_regs_xdata_io_16dba` | measurement register path | low | measurement_regs; xdata_io |
| `0x16E8E` | `0x17AFF` | `bank1_calibration_state_numeric_engine_16e8e` | calibration state/XDATA handler; numeric helper; large state machine | medium | calibration_state; high_fan_in_core; large_state_machine; numeric_engine; xdata_io |
| `0x17B00` | `0x1880B` | `bank1_calibration_state_analog_frontend_17b00` | calibration state/XDATA handler; analog front-end control; measurement register path; numeric helper; large state machine | medium | analog_frontend; calibration_state; large_state_machine; measurement_regs; numeric_engine; service_strobe; xdata_io |
| `0x1880C` | `0x18930` | `bank1_calibration_state_measurement_regs_1880c` | calibration state/XDATA handler; measurement register path | medium | calibration_state; measurement_regs; xdata_io |
| `0x18931` | `0x189CB` | `bank1_calibration_state_analog_frontend_18931` | calibration state/XDATA handler; analog front-end control; measurement register path | medium | analog_frontend; calibration_state; measurement_regs; xdata_io |
| `0x189CC` | `0x18A61` | `bank1_calibration_state_xdata_io_189cc` | calibration state/XDATA handler | low | calibration_state; xdata_io |
| `0x18A62` | `0x18A97` | `bank1_calibration_state_xdata_io_18a62` | calibration state/XDATA handler | low | calibration_state; xdata_io |
| `0x18A98` | `0x18B22` | `bank1_calibration_state_analog_frontend_18a98` | calibration state/XDATA handler; analog front-end control; measurement register path | medium | analog_frontend; calibration_state; measurement_regs; xdata_io |
| `0x18B23` | `0x18CF0` | `bank1_calibration_state_xdata_io_18b23` | calibration state/XDATA handler; large state machine | medium | calibration_state; large_state_machine; xdata_io |
| `0x18CF1` | `0x18DD9` | `bank1_calibration_state_analog_frontend_18cf1` | calibration state/XDATA handler; analog front-end control; measurement register path | medium | analog_frontend; calibration_state; measurement_regs; xdata_io |
| `0x18DDA` | `0x19BFA` | `bank1_calibration_state_measurement_regs_18dda` | calibration state/XDATA handler; measurement register path; numeric helper; large state machine | medium | calibration_state; large_state_machine; measurement_regs; numeric_engine; service_strobe; xdata_io |
| `0x19BFB` | `0x19FB0` | `bank1_calibration_state_measurement_regs_19bfb` | calibration state/XDATA handler; measurement register path; large state machine | medium | calibration_state; large_state_machine; measurement_regs; xdata_io |
| `0x19FB1` | `0x1A1DF` | `bank1_calibration_state_xdata_io_19fb1` | calibration state/XDATA handler; large state machine | medium | calibration_state; large_state_machine; xdata_io |
| `0x1A1E0` | `0x1A52B` | `bank1_cal_capture_regs` | Captures and stages calibration registers from 0x865x into 0x8A8x working area. | high | calibration_state; large_state_machine; measurement_regs; shared_helper; xdata_io |
| `0x1A52C` | `0x1AA30` | `bank1_calibration_state_numeric_engine_1a52c` | calibration state/XDATA handler; numeric helper; large state machine | medium | calibration_state; large_state_machine; numeric_engine; xdata_io |
| `0x1AA31` | `0x1ACD3` | `bank1_cal_compute_stage` | Calibration compute stage seeded from 0x8A86..0x8A8E with service/memory helpers. | medium | analog_frontend; calibration_state; large_state_machine; measurement_regs; shared_helper; xdata_io |
| `0x1ACD4` | `0x1AFAF` | `bank1_calibration_state_analog_frontend_1acd4` | calibration state/XDATA handler; analog front-end control; measurement register path; large state machine | medium | analog_frontend; calibration_state; large_state_machine; measurement_regs; service_strobe; xdata_io |
| `0x1AFB0` | `0x1B0E7` | `bank1_calibration_state_xdata_io_1afb0` | calibration state/XDATA handler | low | calibration_state; xdata_io |
| `0x1B0E8` | `0x1B0F7` | `bank1_xdata_io_1b0e8` | general helper / control-flow block | low | xdata_io |
| `0x1B0F8` | `0x1B310` | `bank1_calibration_state_numeric_engine_1b0f8` | calibration state/XDATA handler; numeric helper; large state machine | medium | calibration_state; large_state_machine; numeric_engine; xdata_io |
| `0x1B311` | `0x1B520` | `bank1_calibration_state_measurement_regs_1b311` | calibration state/XDATA handler; measurement register path; large state machine | medium | calibration_state; large_state_machine; measurement_regs; service_strobe; xdata_io |
| `0x1B521` | `0x1BBF6` | `bank1_calibration_state_xdata_io_1b521` | calibration state/XDATA handler; large state machine | medium | calibration_state; large_state_machine; xdata_io |
| `0x1BBF7` | `0x1CA14` | `bank1_calibration_state_measurement_regs_1bbf7` | calibration state/XDATA handler; measurement register path; large state machine | medium | calibration_state; large_state_machine; measurement_regs; xdata_io |
| `0x1CA15` | `0x1D18F` | `bank1_calibration_state_analog_frontend_1ca15` | calibration state/XDATA handler; analog front-end control; measurement register path; numeric helper; large state machine | medium | analog_frontend; calibration_state; large_state_machine; measurement_regs; numeric_engine; service_strobe; xdata_io |
| `0x1D190` | `0x1D6E2` | `bank1_calibration_state_analog_frontend_1d190` | calibration state/XDATA handler; analog front-end control; measurement register path; numeric helper; large state machine | medium | analog_frontend; calibration_state; large_state_machine; measurement_regs; numeric_engine; xdata_io |
| `0x1D6E3` | `0x1E77A` | `bank1_calibration_state_measurement_regs_1d6e3` | calibration state/XDATA handler; measurement register path; numeric helper; large state machine | medium | calibration_state; large_state_machine; measurement_regs; numeric_engine; xdata_io |
| `0x1E77B` | `0x1EF5B` | `bank1_jump_table_dispatch_calibration_state_1e77b` | jump-table dispatcher; calibration state/XDATA handler; measurement register path; large state machine | medium | calibration_state; jump_table_dispatch; large_state_machine; measurement_regs; xdata_io |
| `0x1EF5C` | `0x1EFDE` | `bank1_afe_sequence_a` | Analog front-end control sequence via 0x8054/0x7D02/0x7E01; used in measurement setup. | high | analog_frontend; calibration_state; measurement_regs; shared_helper; xdata_io |
| `0x1EFDF` | `0x1EFFD` | `bank1_afe_sequence_b` | Alternate AFE sequence and mode-bit staging around 0x8AE2 + 0x7E01. | high | analog_frontend; calibration_state; shared_helper; xdata_io |
| `0x1EFFE` | `0x1F010` | `bank1_afe_clear_and_trigger` | Clears AFE control bits and starts trigger pulse path. | high | analog_frontend; measurement_regs; xdata_io |
| `0x1F011` | `0x1F061` | `bank1_afe_pulse_trigger` | AFE pulse/trigger primitive toggling control bits then waiting for completion. | high | analog_frontend; measurement_regs; xdata_io |
| `0x1F062` | `0x1F0B6` | `bank1_calibration_state_analog_frontend_1f062` | calibration state/XDATA handler; analog front-end control; measurement register path | medium | analog_frontend; calibration_state; measurement_regs; xdata_io |
| `0x1F0B7` | `0x1F0D5` | `bank1_calibration_state_analog_frontend_1f0b7` | calibration state/XDATA handler; analog front-end control; measurement register path | medium | analog_frontend; calibration_state; measurement_regs; xdata_io |
| `0x1F0D6` | `0x1F12E` | `bank1_analog_frontend_measurement_regs_1f0d6` | analog front-end control; measurement register path | medium | analog_frontend; measurement_regs; xdata_io |
| `0x1F12F` | `0x1F266` | `bank1_jump_table_dispatch_calibration_state_1f12f` | jump-table dispatcher; calibration state/XDATA handler; analog front-end control | medium | analog_frontend; calibration_state; jump_table_dispatch; xdata_io |
| `0x1F267` | `0x1F310` | `bank1_state_to_control_map` | Maps staged state in 0x8AD0..0x8AD3 to control-byte programming. | medium | calibration_state; shared_helper; xdata_io |
| `0x1F311` | `0x1FC9A` | `bank1_calibration_state_analog_frontend_1f311` | calibration state/XDATA handler; analog front-end control; measurement register path; numeric helper; large state machine | medium | analog_frontend; calibration_state; large_state_machine; measurement_regs; numeric_engine; service_strobe; xdata_io |
| `0x1FC9B` | `0x1FFFF` | `bank1_large_state_machine_1fc9b` | large state machine | low | large_state_machine |
