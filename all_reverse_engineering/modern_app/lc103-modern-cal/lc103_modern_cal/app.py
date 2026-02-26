from __future__ import annotations

from datetime import datetime
import json
from pathlib import Path
from typing import Dict, List, Optional

from PySide6.QtCore import QTimer
from PySide6.QtSerialPort import QSerialPort, QSerialPortInfo
from PySide6.QtWidgets import (
    QApplication,
    QCheckBox,
    QComboBox,
    QFileDialog,
    QGridLayout,
    QGroupBox,
    QHBoxLayout,
    QInputDialog,
    QLabel,
    QMainWindow,
    QMessageBox,
    QPushButton,
    QPlainTextEdit,
    QScrollArea,
    QStatusBar,
    QVBoxLayout,
    QWidget,
)

from .autoselect import (
    choose_best_ini_candidate,
    discover_cap_ind_cal_files,
    discover_ini_candidates,
    parse_device_identity,
)
from .backup import (
    BACKUP_QUERY_COMMANDS,
    build_snapshot,
    restore_commands_from_backup_doc,
    snapshot_to_dict,
)
from .caldata import CalPair, CalibrationRange, load_cal_data_ini, load_cal_file_pairs
from .legacy_plan import LEGACY_STAGE_OPTIONS, build_legacy_plan, default_stage_selection, human_readable_wizard_rundown
from .parity import extract_rx_lines_from_text, replay_legacy_workflow
from .parity_corpus import load_golden_parity_corpus, run_golden_parity_corpus
from .protocol import assess
from .workflow import (
    WorkflowStep,
    is_do_next_after_pass_marker,
    is_next_range_marker,
    is_start_prompt_marker,
    is_wait_for_start_click_marker,
    match_comms_fault_marker,
    match_global_fail_marker,
    match_global_pass_marker,
    match_future_step_marker,
    match_softrev_path_action_marker,
    match_softrev_path_error_marker,
    match_step_fail_marker,
    match_step_marker,
    match_step_pass_marker,
    match_step_ready_marker,
)

ERROR_MARKERS = (
    "INVALID",
    "ERROR",
    "FAIL",
    "OUT OF RANGE",
    "NOT CALIBRATED",
)


class MainWindow(QMainWindow):
    def __init__(self) -> None:
        super().__init__()
        self.setWindowTitle("LC103 Legacy-Compatible Calibration Wizard")
        self.resize(1120, 860)

        self.serial = QSerialPort(self)
        self.serial.readyRead.connect(self.on_ready_read)
        self.serial.errorOccurred.connect(self.on_serial_error)

        self.transcript: List[str] = []

        self.ranges: List[CalibrationRange] = []
        self.c_pairs: List[CalPair] = []
        self.l_pairs: List[CalPair] = []

        self.workflow_steps: List[WorkflowStep] = []
        self.workflow_index = 0
        self.workflow_started = False
        self.workflow_done = set()
        self.workflow_verified = set()
        self.workflow_ready = set()
        self.workflow_passed = set()
        self.workflow_failed = set()
        self.workflow_evidence: Dict[str, List[str]] = {}
        self.start_gate_passed = False

        self.last_detected_model: Optional[str] = None
        self.last_detected_fw_version: Optional[str] = None
        self.awaiting_fw_probe = False

        self.write_session_armed = False
        self.last_parity_replay: Optional[Dict[str, object]] = None
        self.last_golden_corpus_report: Optional[Dict[str, object]] = None

        self.sequence_timer = QTimer(self)
        self.sequence_timer.setSingleShot(True)
        self.sequence_timer.timeout.connect(self.send_next_restore_command)
        self.restore_running = False
        self.restore_commands: List[str] = []
        self.restore_index = 0

        self.backup_timer = QTimer(self)
        self.backup_timer.setSingleShot(True)
        self.backup_timer.timeout.connect(self.send_next_backup_query)
        self.backup_running = False
        self.backup_queries: List[str] = []
        self.backup_index = 0
        self.backup_responses: Dict[str, List[str]] = {}
        self.backup_active_command: Optional[str] = None
        self.backup_path: Optional[Path] = None
        self.backup_transcript_start = 0

        self.stage_checkboxes: Dict[str, QCheckBox] = {}

        self.build_ui()
        self.refresh_ports()
        self.apply_stage_preset_non_ringer()
        self.rebuild_workflow_plan()
        self.refresh_wizard_view()

    def build_ui(self) -> None:
        root = QWidget(self)
        self.setCentralWidget(root)
        outer = QVBoxLayout(root)

        scroll = QScrollArea()
        scroll.setWidgetResizable(True)
        content = QWidget()
        main = QVBoxLayout(content)

        main.addWidget(self.make_device_group())
        main.addWidget(self.make_stage_group())
        main.addWidget(self.make_actions_group())
        main.addWidget(self.make_wizard_group())
        main.addWidget(self.make_log_group())

        scroll.setWidget(content)
        outer.addWidget(scroll)

        self.status = QStatusBar(self)
        self.setStatusBar(self.status)
        self.status.showMessage("Disconnected")

    def make_device_group(self) -> QGroupBox:
        box = QGroupBox("Device")
        g = QGridLayout(box)

        self.port_combo = QComboBox()
        self.baud_combo = QComboBox()
        for baud in (9600, 19200, 38400, 57600, 115200):
            self.baud_combo.addItem(str(baud), baud)
        self.baud_combo.setCurrentText("9600")

        self.refresh_btn = QPushButton("Refresh Ports")
        self.refresh_btn.clicked.connect(self.refresh_ports)

        self.connect_btn = QPushButton("Detect + Connect")
        self.connect_btn.clicked.connect(self.toggle_connection)

        self.device_identity_label = QLabel("Model: unknown | Firmware: unknown")
        self.profile_label = QLabel("Profile: not loaded")

        g.addWidget(QLabel("Serial Port"), 0, 0)
        g.addWidget(self.port_combo, 0, 1)
        g.addWidget(QLabel("Baud"), 0, 2)
        g.addWidget(self.baud_combo, 0, 3)
        g.addWidget(self.refresh_btn, 0, 4)
        g.addWidget(self.connect_btn, 0, 5)

        g.addWidget(self.device_identity_label, 1, 0, 1, 3)
        g.addWidget(self.profile_label, 1, 3, 1, 3)
        return box

    def make_stage_group(self) -> QGroupBox:
        box = QGroupBox("Legacy Stage Options")
        v = QVBoxLayout(box)

        row = QHBoxLayout()
        all_not_ringer = QPushButton("All (Not Ringer)")
        all_stages = QPushButton("All Stages")
        none_btn = QPushButton("None")
        rebuild_btn = QPushButton("Rebuild Plan")

        all_not_ringer.clicked.connect(self.apply_stage_preset_non_ringer)
        all_stages.clicked.connect(self.apply_stage_preset_all)
        none_btn.clicked.connect(self.apply_stage_preset_none)
        rebuild_btn.clicked.connect(self.rebuild_workflow_plan)

        row.addWidget(all_not_ringer)
        row.addWidget(all_stages)
        row.addWidget(none_btn)
        row.addWidget(rebuild_btn)

        grid = QGridLayout()
        for i, opt in enumerate(LEGACY_STAGE_OPTIONS):
            cb = QCheckBox(opt.label)
            self.stage_checkboxes[opt.id] = cb
            grid.addWidget(cb, i // 3, i % 3)

        v.addLayout(row)
        v.addLayout(grid)
        return box

    def make_actions_group(self) -> QGroupBox:
        box = QGroupBox("Run Controls")
        v = QVBoxLayout(box)

        row = QHBoxLayout()
        self.start_wizard_btn = QPushButton("Start Button")
        self.continue_btn = QPushButton("Continue Button")
        self.send_step_cmds_btn = QPushButton("Send Step Commands")
        self.backup_btn = QPushButton("Backup Calibration Data")
        self.restore_btn = QPushButton("Restore Calibration Data")
        self.parity_btn = QPushButton("Save Wizard Report")
        self.import_legacy_btn = QPushButton("Import Legacy Transcript")
        self.golden_corpus_btn = QPushButton("Run Golden Corpus")
        self.copy_rundown_btn = QPushButton("Copy Wizard Rundown")

        self.start_wizard_btn.clicked.connect(self.start_wizard)
        self.continue_btn.clicked.connect(self.next_wizard_step)
        self.send_step_cmds_btn.clicked.connect(self.send_current_step_commands)
        self.backup_btn.clicked.connect(self.start_backup)
        self.restore_btn.clicked.connect(self.start_restore)
        self.parity_btn.clicked.connect(self.save_parity_report)
        self.import_legacy_btn.clicked.connect(self.import_legacy_transcript)
        self.golden_corpus_btn.clicked.connect(self.run_golden_corpus)
        self.copy_rundown_btn.clicked.connect(self.copy_wizard_rundown)

        self.continue_btn.setEnabled(False)
        self.send_step_cmds_btn.setEnabled(False)

        row.addWidget(self.start_wizard_btn)
        row.addWidget(self.continue_btn)
        row.addWidget(self.send_step_cmds_btn)
        row.addWidget(self.backup_btn)
        row.addWidget(self.restore_btn)
        row.addWidget(self.parity_btn)
        row.addWidget(self.import_legacy_btn)
        row.addWidget(self.golden_corpus_btn)
        row.addWidget(self.copy_rundown_btn)

        safety = QHBoxLayout()
        self.enable_live_writes = QCheckBox("Enable live write commands")
        self.auto_send_safe_cmds = QCheckBox("Auto-send safe step probes")
        self.auto_sync_legacy_prompts = QCheckBox("Auto-sync to legacy prompt markers")
        self.auto_advance_legacy_flow = QCheckBox("Auto-advance on legacy pass/next prompts")
        self.auto_send_safe_cmds.setChecked(True)
        self.auto_sync_legacy_prompts.setChecked(True)
        self.auto_advance_legacy_flow.setChecked(True)

        safety.addWidget(self.enable_live_writes)
        safety.addWidget(self.auto_send_safe_cmds)
        safety.addWidget(self.auto_sync_legacy_prompts)
        safety.addWidget(self.auto_advance_legacy_flow)

        v.addLayout(row)
        v.addLayout(safety)
        return box

    def make_wizard_group(self) -> QGroupBox:
        box = QGroupBox("Interactive Wizard")
        v = QVBoxLayout(box)

        self.workflow_step_label = QLabel()
        self.workflow_step_label.setStyleSheet("font-weight: bold;")

        self.workflow_prompt = QPlainTextEdit()
        self.workflow_prompt.setReadOnly(True)
        self.workflow_prompt.setMinimumHeight(280)

        self.workflow_cmd_preview = QPlainTextEdit()
        self.workflow_cmd_preview.setReadOnly(True)
        self.workflow_cmd_preview.setMaximumHeight(130)

        self.workflow_status = QLabel()

        v.addWidget(self.workflow_step_label)
        v.addWidget(self.workflow_prompt)
        v.addWidget(QLabel("Step command list"))
        v.addWidget(self.workflow_cmd_preview)
        v.addWidget(self.workflow_status)
        return box

    def make_log_group(self) -> QGroupBox:
        box = QGroupBox("Transcript")
        v = QVBoxLayout(box)

        self.log_view = QPlainTextEdit()
        self.log_view.setReadOnly(True)

        row = QHBoxLayout()
        save_btn = QPushButton("Save Log")
        clear_btn = QPushButton("Clear")
        save_btn.clicked.connect(self.save_log)
        clear_btn.clicked.connect(self.clear_log)
        row.addWidget(save_btn)
        row.addWidget(clear_btn)

        v.addWidget(self.log_view)
        v.addLayout(row)
        return box

    def refresh_ports(self) -> None:
        current = self.port_combo.currentData()
        self.port_combo.clear()
        for info in QSerialPortInfo.availablePorts():
            label = f"{info.portName()} - {info.description() or 'Unknown'}"
            self.port_combo.addItem(label, info.portName())
        if current:
            idx = self.port_combo.findData(current)
            if idx >= 0:
                self.port_combo.setCurrentIndex(idx)

    def apply_stage_preset_non_ringer(self) -> None:
        sel = default_stage_selection(include_ringer=False)
        for stage_id, cb in self.stage_checkboxes.items():
            cb.setChecked(sel.get(stage_id, False))
        self.rebuild_workflow_plan()

    def apply_stage_preset_all(self) -> None:
        sel = default_stage_selection(include_ringer=True)
        for stage_id, cb in self.stage_checkboxes.items():
            cb.setChecked(sel.get(stage_id, False))
        self.rebuild_workflow_plan()

    def apply_stage_preset_none(self) -> None:
        for cb in self.stage_checkboxes.values():
            cb.setChecked(False)
        self.rebuild_workflow_plan()

    def selected_stage_ids(self) -> List[str]:
        out: List[str] = []
        for stage_id, cb in self.stage_checkboxes.items():
            if cb.isChecked():
                out.append(stage_id)
        return out

    def rebuild_workflow_plan(self) -> None:
        selected = self.selected_stage_ids()
        self.workflow_steps = build_legacy_plan(
            selected_stage_ids=selected,
            ranges=self.ranges,
            c_pairs=self.c_pairs,
            l_pairs=self.l_pairs,
        )
        self.workflow_index = 0
        self.workflow_started = False
        self.workflow_done.clear()
        self.workflow_verified.clear()
        self.workflow_ready.clear()
        self.workflow_passed.clear()
        self.workflow_failed.clear()
        self.workflow_evidence.clear()
        self.start_gate_passed = False
        self.continue_btn.setEnabled(False)
        self.send_step_cmds_btn.setEnabled(False)
        self.refresh_wizard_view()
        self.log("SYS", f"Rebuilt plan with {len(self.workflow_steps)} steps from {len(selected)} selected stage option(s)")

    def toggle_connection(self) -> None:
        if self.serial.isOpen():
            self.serial.close()
            self.awaiting_fw_probe = False
            self.connect_btn.setText("Detect + Connect")
            self.status.showMessage("Disconnected")
            self.log("SYS", "Disconnected")
            return

        port_name = self.port_combo.currentData()
        if not port_name:
            QMessageBox.warning(self, "No Port", "Select a serial port first.")
            return

        self.serial.setPortName(port_name)
        self.serial.setBaudRate(int(self.baud_combo.currentData()))
        self.serial.setDataBits(QSerialPort.Data8)
        self.serial.setParity(QSerialPort.NoParity)
        self.serial.setStopBits(QSerialPort.OneStop)
        self.serial.setFlowControl(QSerialPort.NoFlowControl)

        if not self.serial.open(QSerialPort.ReadWrite):
            QMessageBox.critical(self, "Open Failed", self.serial.errorString())
            return

        self.connect_btn.setText("Disconnect")
        self.status.showMessage(f"Connected: {port_name}")
        self.log("SYS", f"Connected to {port_name}")
        self.handle_post_connect()

    def handle_post_connect(self) -> None:
        preferred_model = "LC103"
        self.try_auto_select_ini(preferred_version=None, preferred_model=preferred_model, source="connect")
        self.try_auto_select_cal_files(source="connect")
        self.start_fw_probe()

    def start_fw_probe(self) -> None:
        if not self.serial.isOpen():
            return
        self.awaiting_fw_probe = True
        self.send_live_command("VER#?", origin="probe")
        self.send_live_command("SER#?", origin="probe")

    def try_auto_select_ini(
        self, preferred_version: Optional[str], preferred_model: Optional[str], source: str
    ) -> None:
        candidates = discover_ini_candidates()
        if not candidates:
            self.log("SYS", "Auto-select INI: no candidates found")
            return

        chosen, reason = choose_best_ini_candidate(
            candidates,
            preferred_version=preferred_version,
            preferred_model=preferred_model,
            strict_model=True,
        )
        if chosen is None:
            self.log("SYS", f"Auto-select INI failed [{reason}]")
            return

        try:
            self.ranges = load_cal_data_ini(chosen.path)
            self.log("SYS", f"Auto-select INI ({source}): {chosen.path} [reason={reason}]")
            model_txt = chosen.model or "unknown"
            ver_txt = chosen.version or "unknown"
            self.profile_label.setText(f"Profile: {chosen.path.name} | model={model_txt}, ver={ver_txt}")
            self.rebuild_workflow_plan()
        except Exception as exc:
            self.log("SYS", f"INI parse failed: {chosen.path} ({exc})")

    def try_auto_select_cal_files(self, source: str) -> None:
        sel = discover_cap_ind_cal_files(ranges=self.ranges)

        if sel.cap_path:
            try:
                self.c_pairs = load_cal_file_pairs(sel.cap_path)
                self.log("SYS", f"Auto-select CAP ({source}): {sel.cap_path} [{sel.cap_reason}]")
            except Exception as exc:
                self.log("SYS", f"CAP parse failed: {sel.cap_path} ({exc})")

        if sel.ind_path:
            try:
                self.l_pairs = load_cal_file_pairs(sel.ind_path)
                self.log("SYS", f"Auto-select IND ({source}): {sel.ind_path} [{sel.ind_reason}]")
            except Exception as exc:
                self.log("SYS", f"IND parse failed: {sel.ind_path} ({exc})")

        self.rebuild_workflow_plan()

    def refresh_wizard_view(self) -> None:
        if not self.workflow_steps:
            self.workflow_step_label.setText("No steps in current plan")
            self.workflow_prompt.setPlainText("Select at least one stage option and rebuild plan.")
            self.workflow_cmd_preview.setPlainText("")
            self.workflow_status.setText("Plan empty")
            return

        total = len(self.workflow_steps)
        idx = max(0, min(self.workflow_index, total - 1))
        self.workflow_index = idx
        step = self.workflow_steps[idx]

        done_count = len(self.workflow_done)
        verified_count = len(self.workflow_verified)
        ready_count = len(self.workflow_ready)
        passed_count = len(self.workflow_passed)

        prefix = "[DONE]" if step.id in self.workflow_done else "[TODO]"
        if step.id in self.workflow_verified:
            prefix += "[VERIFIED]"
        if step.id in self.workflow_ready:
            prefix += "[READY]"
        if step.id in self.workflow_passed:
            prefix += "[PASS]"
        if step.id in self.workflow_failed and step.id not in self.workflow_passed:
            prefix += "[FAIL]"

        self.workflow_step_label.setText(f"{prefix} Step {idx + 1}/{total}: {step.title}")
        self.workflow_prompt.setPlainText(step.prompt)
        if step.commands:
            self.workflow_cmd_preview.setPlainText("\n".join(step.commands))
        else:
            self.workflow_cmd_preview.setPlainText("(no commands for this step)")

        self.workflow_status.setText(
            "Legacy-compatible Start/Continue flow. "
            f"Completed: {done_count}/{total}, RX-verified: {verified_count}/{total}, "
            f"Ready gates: {ready_count}/{total}, Pass gates: {passed_count}/{total}, "
            f"Start gate: {'OK' if self.start_gate_passed else 'WAIT'}"
        )

    def copy_wizard_rundown(self) -> None:
        if not self.workflow_steps:
            QMessageBox.warning(self, "No Plan", "Select stage options and rebuild plan first.")
            return
        txt = human_readable_wizard_rundown(self.workflow_steps)
        QApplication.clipboard().setText(txt)
        self.log("SYS", f"Copied wizard rundown to clipboard ({len(self.workflow_steps)} steps)")
        self.status.showMessage("Wizard rundown copied to clipboard", 4000)

    def start_wizard(self) -> None:
        if not self.workflow_steps:
            QMessageBox.warning(self, "No Plan", "Select stage options first.")
            return

        self.workflow_started = True
        self.workflow_index = 0
        self.workflow_done.clear()
        self.workflow_verified.clear()
        self.workflow_ready.clear()
        self.workflow_passed.clear()
        self.workflow_failed.clear()
        self.workflow_evidence.clear()
        self.start_gate_passed = False
        self.continue_btn.setEnabled(True)
        self.send_step_cmds_btn.setEnabled(True)
        self.refresh_wizard_view()
        self.log("SYS", "Wizard started (Start Button)")

        if self.auto_send_safe_cmds.isChecked():
            self.send_current_step_commands(safe_only=True)

    def next_wizard_step(self) -> None:
        if not self.workflow_started:
            self.start_wizard()
            return

        if not self.workflow_steps:
            return

        if not self._can_advance_current_step():
            return
        self._advance_to_next_step("Continue Button -> next step")

    def _can_advance_current_step(self) -> bool:
        if not self.workflow_steps:
            return False
        current = self.workflow_steps[self.workflow_index]

        if current.id == "startup_select" and not self.start_gate_passed:
            self.log("SYS", "Continue blocked: waiting for Start gate trigger from RX")
            self.status.showMessage("Waiting for Start gate trigger from LC103 flow", 4000)
            return False

        if current.id != "startup_select" and current.ready_markers and current.id not in self.workflow_ready:
            self.log("SYS", f"Continue blocked: READY/ENTER gate not satisfied for {current.title}")
            self.status.showMessage("Waiting for READY/ENTER confirmation for current step", 4000)
            return False

        if current.pass_markers and current.id not in self.workflow_passed:
            if current.id in self.workflow_failed:
                self.log("SYS", f"Continue blocked: FAIL state for {current.title}")
                self.status.showMessage("Step is in FAIL state; resolve before continuing", 4000)
            else:
                self.log("SYS", f"Continue blocked: PASS marker not observed for {current.title}")
                self.status.showMessage("Waiting for PASS result before continuing", 4000)
            return False
        return True

    def _advance_to_next_step(self, reason: str) -> None:
        if not self.workflow_steps:
            return
        current = self.workflow_steps[self.workflow_index]
        self.workflow_done.add(current.id)

        if self.workflow_index < len(self.workflow_steps) - 1:
            self.workflow_index += 1
            self.refresh_wizard_view()
            self.log("SYS", reason)
            if self.auto_send_safe_cmds.isChecked():
                self.send_current_step_commands(safe_only=True)
            return

        self.refresh_wizard_view()
        self.continue_btn.setEnabled(False)
        self.send_step_cmds_btn.setEnabled(False)
        self.log("SYS", "Wizard complete")

    def ensure_write_session_armed(self) -> bool:
        if self.write_session_armed:
            return True
        text, ok = QInputDialog.getText(
            self,
            "Enable Live Writes",
            "This may alter calibration data. Type I ACCEPT RISK to enable write commands:",
        )
        if not ok or text.strip().upper() != "I ACCEPT RISK":
            return False
        self.write_session_armed = True
        self.log("SYS", "Live write session armed")
        return True

    def send_current_step_commands(self, safe_only: bool = False) -> None:
        if not self.workflow_steps:
            return
        step = self.workflow_steps[self.workflow_index]

        sent = 0
        for raw in step.commands:
            txt = raw.strip()
            if not txt:
                continue

            info = assess(txt)
            is_write = info.is_mutating

            if safe_only and is_write:
                continue

            if is_write and not self.enable_live_writes.isChecked():
                continue

            if is_write and not self.ensure_write_session_armed():
                self.log("SYS", f"Skipped write command (not armed): {txt}")
                continue

            if self.send_live_command(txt, origin=f"step:{step.id}"):
                sent += 1

        self.log("SYS", f"Sent {sent} step command(s) for {step.title}")

    def with_line_ending(self, cmd: str) -> bytes:
        return (cmd + "\r").encode("ascii", errors="replace")

    def send_live_command(self, cmd: str, origin: str) -> bool:
        if not self.serial.isOpen():
            self.log("SYS", f"Cannot send while disconnected: {cmd}")
            return False

        payload = self.with_line_ending(cmd)
        written = self.serial.write(payload)
        self.log("TX", f"[{origin}] {cmd} (bytes={written})")
        return True

    def start_backup(self) -> None:
        if self.backup_running or self.restore_running:
            QMessageBox.warning(self, "Busy", "Another operation is already running.")
            return
        if not self.serial.isOpen():
            QMessageBox.warning(self, "Not Connected", "Connect to LC103 first.")
            return

        default_name = f"lc103_cal_backup_{datetime.now().strftime('%Y%m%d_%H%M%S')}.json"
        path, _ = QFileDialog.getSaveFileName(self, "Save Calibration Backup", default_name, "JSON Files (*.json)")
        if not path:
            return

        self.backup_path = Path(path)
        self.backup_running = True
        self.backup_queries = list(BACKUP_QUERY_COMMANDS)
        self.backup_index = 0
        self.backup_responses = {cmd: [] for cmd in self.backup_queries}
        self.backup_active_command = None
        self.backup_transcript_start = len(self.transcript)

        self.backup_btn.setEnabled(False)
        self.log("SYS", "Backup started")
        self.send_next_backup_query()

    def send_next_backup_query(self) -> None:
        if not self.backup_running:
            return

        if self.backup_index >= len(self.backup_queries):
            self.finish_backup()
            return

        cmd = self.backup_queries[self.backup_index]
        self.backup_index += 1
        self.backup_active_command = cmd
        ok = self.send_live_command(cmd, origin="backup")
        if not ok:
            self.log("SYS", "Backup aborted due to send failure")
            self.stop_backup()
            return

        self.backup_timer.start(900)

    def finish_backup(self) -> None:
        if not self.backup_running:
            return

        assert self.backup_path is not None
        snapshot = build_snapshot(
            responses=self.backup_responses,
            transcript=self.transcript[self.backup_transcript_start :],
            query_commands=self.backup_queries,
        )
        doc = snapshot_to_dict(snapshot)
        self.backup_path.write_text(json.dumps(doc, indent=2), encoding="utf-8")

        self.log("SYS", f"Backup saved: {self.backup_path}")
        self.status.showMessage(f"Backup saved: {self.backup_path}", 5000)
        self.stop_backup()

    def stop_backup(self) -> None:
        self.backup_running = False
        self.backup_timer.stop()
        self.backup_active_command = None
        self.backup_btn.setEnabled(True)

    def start_restore(self) -> None:
        if self.backup_running or self.restore_running:
            QMessageBox.warning(self, "Busy", "Another operation is already running.")
            return
        if not self.serial.isOpen():
            QMessageBox.warning(self, "Not Connected", "Connect to LC103 first.")
            return

        path, _ = QFileDialog.getOpenFileName(self, "Open Calibration Backup", str(Path.home()), "JSON Files (*.json)")
        if not path:
            return

        try:
            doc = json.loads(Path(path).read_text(encoding="utf-8"))
        except Exception as exc:
            QMessageBox.critical(self, "Invalid Backup", f"Failed to load backup file:\n{exc}")
            return

        commands = restore_commands_from_backup_doc(doc)
        if not commands:
            QMessageBox.warning(
                self,
                "Restore Not Available",
                "This backup does not include parseable restore commands.\n"
                "No restore was run.",
            )
            return

        text, ok = QInputDialog.getText(
            self,
            "Confirm Restore",
            "This will send mutating calibration commands to LC103.\n"
            "Type RESTORE to continue:",
        )
        if not ok or text.strip().upper() != "RESTORE":
            self.log("SYS", "Restore canceled (confirmation not accepted)")
            return

        self.restore_commands = commands
        self.restore_index = 0
        self.restore_running = True
        self.restore_btn.setEnabled(False)

        self.log("SYS", f"Restore started from {path} ({len(commands)} commands)")
        self.send_next_restore_command()

    def send_next_restore_command(self) -> None:
        if not self.restore_running:
            return

        if self.restore_index >= len(self.restore_commands):
            self.log("SYS", "Restore complete")
            self.stop_restore()
            return

        cmd = self.restore_commands[self.restore_index]
        self.restore_index += 1

        ok = self.send_live_command(cmd, origin=f"restore#{self.restore_index}")
        if not ok:
            self.log("SYS", "Restore stopped due to send failure")
            self.stop_restore()
            return

        self.sequence_timer.start(650)

    def stop_restore(self) -> None:
        self.restore_running = False
        self.sequence_timer.stop()
        self.restore_btn.setEnabled(True)

    def on_ready_read(self) -> None:
        data = self.serial.readAll().data()
        if not data:
            return

        text = data.decode("ascii", errors="replace")
        line = text.rstrip("\n")
        self.log("RX", line)

        if self.backup_running and self.backup_active_command:
            self.backup_responses.setdefault(self.backup_active_command, []).append(line)

        self.update_workflow_from_rx(text)

        if self.awaiting_fw_probe:
            self.handle_fw_probe_text(text)

        if self.restore_running:
            upper = text.upper()
            comm_fault = match_comms_fault_marker(text)
            if any(marker in upper for marker in ERROR_MARKERS) or comm_fault:
                if comm_fault:
                    self.log("SYS", f"Restore halted due to comms fault marker: {comm_fault}")
                else:
                    self.log("SYS", "Restore halted due to RX error marker")
                self.stop_restore()

    def update_workflow_from_rx(self, text: str) -> None:
        if not self.workflow_steps:
            return

        current = self.workflow_steps[self.workflow_index]
        changed = False
        upper_text = text.upper()

        ready_marker = match_step_ready_marker(current, text)
        if ready_marker:
            if current.id not in self.workflow_ready:
                self.workflow_ready.add(current.id)
                changed = True
            self.log("SYS", f"Wizard READY gate [{current.title}]: {ready_marker}")

        pass_marker = match_step_pass_marker(current, text)
        if pass_marker:
            if current.id not in self.workflow_passed:
                self.workflow_passed.add(current.id)
                changed = True
            if current.id in self.workflow_failed:
                self.workflow_failed.discard(current.id)
                changed = True
            self.log("SYS", f"Wizard PASS marker [{current.title}]: {pass_marker}")
        else:
            gpass = match_global_pass_marker(text)
            if gpass and current.id not in self.workflow_passed:
                self.workflow_passed.add(current.id)
                changed = True
                self.log("SYS", f"Wizard PASS marker [{current.title}] (global): {gpass}")

        fail_marker = match_step_fail_marker(current, text)
        if fail_marker and current.id not in self.workflow_passed:
            if current.id not in self.workflow_failed:
                self.workflow_failed.add(current.id)
                changed = True
            self.log("SYS", f"Wizard FAIL marker [{current.title}]: {fail_marker}")
        elif current.id not in self.workflow_passed and (
            "RS-232 CONNECTION FAILED" in upper_text or match_global_fail_marker(text)
        ):
            if current.id not in self.workflow_failed:
                self.workflow_failed.add(current.id)
                changed = True
            self.log("SYS", f"Wizard FAIL marker [{current.title}]: global fail marker")

        comm_fault = match_comms_fault_marker(text)
        if comm_fault and current.id not in self.workflow_passed:
            if current.id not in self.workflow_failed:
                self.workflow_failed.add(current.id)
                changed = True
            self.log("SYS", f"Wizard COMMS/timeout marker [{current.title}]: {comm_fault}")
            self.status.showMessage(
                "Comms fault detected (timeout/abort/RS-232). Check cable/port and retry current step.",
                6000,
            )

        if current.id in {"software_rev", "cal_data_paths"}:
            path_action = match_softrev_path_action_marker(text)
            if path_action:
                self.log("SYS", f"Wizard path action marker [{current.title}]: {path_action}")
                self.status.showMessage(
                    "Use F1/path selector and confirm CAP/IND .CAL files before continuing.",
                    6000,
                )

            path_error = match_softrev_path_error_marker(text)
            if path_error:
                if current.id not in self.workflow_failed:
                    self.workflow_failed.add(current.id)
                    changed = True
                self.log("SYS", f"Wizard software-rev/path error [{current.title}]: {path_error}")
                self.status.showMessage(
                    "Software-rev/path error detected. Fix path/revision selection, then re-run VER#/SER# probe.",
                    7000,
                )

        marker = match_step_marker(current, text)
        if marker:
            self.workflow_verified.add(current.id)
            changed = True
            self.workflow_evidence.setdefault(current.id, [])
            if marker not in self.workflow_evidence[current.id]:
                self.workflow_evidence[current.id].append(marker)
                self.log("SYS", f"Wizard RX match [{current.title}]: {marker}")
            if current.id == "startup_select" and not self.start_gate_passed:
                self.start_gate_passed = True
                changed = True
            if (
                self.auto_advance_legacy_flow.isChecked()
                and current.id == "startup_select"
                and self.start_gate_passed
                and self._can_advance_current_step()
            ):
                self._advance_to_next_step("Auto-advanced after Start gate trigger")
                return
            if changed:
                self.refresh_wizard_view()
            return

        if current.id == "startup_select":
            if is_wait_for_start_click_marker(text):
                self.log("SYS", "Legacy flow indicates waiting for Start button click")
            if is_start_prompt_marker(text):
                self.start_gate_passed = True
                changed = True
                self.log("SYS", "Legacy Start prompt detected from RX")
                if self.auto_advance_legacy_flow.isChecked() and self._can_advance_current_step():
                    self._advance_to_next_step("Auto-advanced after Start prompt")
                    return

        future = match_future_step_marker(self.workflow_steps, self.workflow_index, text)
        if future:
            idx, future_marker = future
            step = self.workflow_steps[idx]
            self.log("SYS", f"Wizard RX matched future step {idx + 1} ({step.title}): {future_marker}")
            if self.auto_sync_legacy_prompts.isChecked() and self.sync_to_future_step(idx):
                self.log("SYS", f"Auto-synced wizard to future step {idx + 1} due to legacy prompt")
                return

        if is_next_range_marker(text) and self.auto_advance_next_range():
            changed = True

        if (
            self.auto_advance_legacy_flow.isChecked()
            and is_do_next_after_pass_marker(text)
            and current.id in self.workflow_passed
            and self._can_advance_current_step()
        ):
            self._advance_to_next_step("Auto-advanced on 'Do next test if previous test passed'")
            return

        if changed:
            self.refresh_wizard_view()

    def auto_advance_next_range(self) -> bool:
        if not self.workflow_steps:
            return False
        current = self.workflow_steps[self.workflow_index]
        if not current.range_family or current.range_kind != "high":
            return False

        for i in range(self.workflow_index + 1, len(self.workflow_steps)):
            step = self.workflow_steps[i]
            if (
                step.range_family == current.range_family
                and step.range_kind == "low"
                and step.range_index is not None
                and current.range_index is not None
                and step.range_index > current.range_index
            ):
                self.workflow_done.add(current.id)
                self.workflow_index = i
                self.log("SYS", f"Auto-advanced on 'Next Range to cal' -> Step {i + 1}: {step.title}")
                if self.auto_send_safe_cmds.isChecked():
                    self.send_current_step_commands(safe_only=True)
                return True
        return False

    def sync_to_future_step(self, future_index: int) -> bool:
        if not self.workflow_steps:
            return False
        if future_index <= self.workflow_index or future_index >= len(self.workflow_steps):
            return False
        current = self.workflow_steps[self.workflow_index]
        self.workflow_done.add(current.id)
        self.workflow_index = future_index
        self.refresh_wizard_view()
        if self.auto_send_safe_cmds.isChecked():
            self.send_current_step_commands(safe_only=True)
        return True

    def handle_fw_probe_text(self, text: str) -> None:
        ident = parse_device_identity(text)
        upper = text.upper()
        if "LC" not in upper and "VER" not in upper and ident.model is None and ident.version is None:
            return

        self.awaiting_fw_probe = False

        if ident.model:
            self.last_detected_model = ident.model
        if ident.version:
            self.last_detected_fw_version = ident.version

        model_txt = self.last_detected_model or "unknown"
        fw_txt = self.last_detected_fw_version or "unknown"
        self.device_identity_label.setText(f"Model: {model_txt} | Firmware: {fw_txt}")
        self.log("SYS", f"Detected identity: model={model_txt}, firmware={fw_txt}")

        preferred_model = self.last_detected_model or "LC103"
        self.try_auto_select_ini(preferred_version=self.last_detected_fw_version, preferred_model=preferred_model, source="fw-probe")

    def on_serial_error(self, err: QSerialPort.SerialPortError) -> None:
        if err in (QSerialPort.NoError, QSerialPort.TimeoutError):
            return
        self.log("SER", self.serial.errorString())

    def save_parity_report(self) -> None:
        default_name = f"lc103_wizard_report_{datetime.now().strftime('%Y%m%d_%H%M%S')}.json"
        path, _ = QFileDialog.getSaveFileName(self, "Save Wizard Report", default_name, "JSON Files (*.json)")
        if not path:
            return

        report = {
            "generated_at": datetime.now().isoformat(),
            "device_model_detected": self.last_detected_model,
            "firmware_revision_detected": self.last_detected_fw_version,
            "selected_stage_ids": self.selected_stage_ids(),
            "workflow_index": self.workflow_index,
            "workflow_started": self.workflow_started,
            "workflow_done_step_ids": sorted(self.workflow_done),
            "workflow_verified_step_ids": sorted(self.workflow_verified),
            "workflow_ready_step_ids": sorted(self.workflow_ready),
            "workflow_passed_step_ids": sorted(self.workflow_passed),
            "workflow_failed_step_ids": sorted(self.workflow_failed),
            "start_gate_passed": self.start_gate_passed,
            "auto_sync_legacy_prompts": self.auto_sync_legacy_prompts.isChecked(),
            "auto_advance_legacy_flow": self.auto_advance_legacy_flow.isChecked(),
            "last_parity_replay": self.last_parity_replay,
            "last_golden_corpus_report": self.last_golden_corpus_report,
            "workflow_evidence": self.workflow_evidence,
            "workflow_steps": [
                {
                    "id": s.id,
                    "title": s.title,
                    "prompt": s.prompt,
                    "expected_markers": s.expected_markers,
                    "ready_markers": s.ready_markers,
                    "pass_markers": s.pass_markers,
                    "fail_markers": s.fail_markers,
                    "range_family": s.range_family,
                    "range_index": s.range_index,
                    "range_kind": s.range_kind,
                    "commands": s.commands,
                }
                for s in self.workflow_steps
            ],
            "transcript": self.transcript,
        }
        Path(path).write_text(json.dumps(report, indent=2), encoding="utf-8")
        self.status.showMessage(f"Saved wizard report {path}", 5000)
        self.log("SYS", f"Saved wizard report: {path}")

    def run_golden_corpus(self) -> None:
        scenarios = load_golden_parity_corpus()
        report = run_golden_parity_corpus(scenarios)
        self.last_golden_corpus_report = report

        ts = datetime.now().strftime("%Y%m%d_%H%M%S")
        default = Path.home() / f"lc103_golden_corpus_report_{ts}.json"
        default.write_text(json.dumps(report, indent=2), encoding="utf-8")

        pass_count = int(report.get("pass_count", 0))
        scenario_count = int(report.get("scenario_count", 0))
        fail_count = int(report.get("fail_count", 0))
        self.log("SYS", f"Golden corpus run complete: {pass_count}/{scenario_count} passed, {fail_count} failed")
        self.log("SYS", f"Golden corpus report saved: {default}")
        self.status.showMessage(f"Golden corpus: {pass_count}/{scenario_count} passed", 5000)

    def import_legacy_transcript(self) -> None:
        if not self.workflow_steps:
            QMessageBox.warning(self, "No Plan", "Build a workflow plan first.")
            return

        path, _ = QFileDialog.getOpenFileName(
            self,
            "Import Legacy Transcript",
            str(Path.home()),
            "Log/Text Files (*.log *.txt);;All Files (*)",
        )
        if not path:
            return

        src = Path(path)
        text = src.read_text(encoding="utf-8", errors="replace")
        rx_lines = extract_rx_lines_from_text(text)
        if not rx_lines:
            QMessageBox.warning(self, "No RX Data", "Transcript did not contain readable lines.")
            return

        result = replay_legacy_workflow(
            self.workflow_steps,
            rx_lines,
            auto_sync=self.auto_sync_legacy_prompts.isChecked(),
            auto_advance=self.auto_advance_legacy_flow.isChecked(),
        )
        replay = result.to_dict()
        self.last_parity_replay = replay

        self.workflow_started = True
        self.workflow_index = max(0, min(result.final_index, len(self.workflow_steps) - 1))
        self.workflow_done = set(result.completed_step_ids)
        self.workflow_verified = set(result.verified_step_ids)
        self.workflow_ready = set(result.ready_step_ids)
        self.workflow_passed = set(result.passed_step_ids)
        self.workflow_failed = set(result.failed_step_ids)
        self.workflow_evidence = {k: list(v) for k, v in result.workflow_evidence.items()}
        self.start_gate_passed = result.start_gate_passed
        self.continue_btn.setEnabled(True)
        self.send_step_cmds_btn.setEnabled(True)
        self.refresh_wizard_view()

        out_path = src.with_name(f"{src.stem}_parity_replay.json")
        out_path.write_text(json.dumps(replay, indent=2), encoding="utf-8")
        self.log("SYS", f"Imported legacy transcript: {src} ({len(rx_lines)} lines)")
        self.log("SYS", f"Parity replay report saved: {out_path}")
        self.status.showMessage(f"Parity replay loaded from {src.name}", 5000)

    def save_log(self) -> None:
        if not self.transcript:
            QMessageBox.information(self, "No Log", "Transcript is empty.")
            return

        default_name = f"lc103_transcript_{datetime.now().strftime('%Y%m%d_%H%M%S')}.log"
        path, _ = QFileDialog.getSaveFileName(self, "Save Transcript", default_name, "Log Files (*.log *.txt)")
        if not path:
            return

        Path(path).write_text("\n".join(self.transcript) + "\n", encoding="utf-8")
        self.status.showMessage(f"Saved {path}", 5000)

    def clear_log(self) -> None:
        self.transcript.clear()
        self.log_view.clear()

    def log(self, channel: str, message: str) -> None:
        stamp = datetime.now().strftime("%H:%M:%S.%f")[:-3]
        line = f"[{stamp}] {channel}: {message}"
        self.transcript.append(line)
        self.log_view.appendPlainText(line)


def run() -> None:
    app = QApplication([])
    win = MainWindow()
    win.show()
    app.exec()
