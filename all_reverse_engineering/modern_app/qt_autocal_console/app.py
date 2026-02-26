#!/usr/bin/env python3
from __future__ import annotations

from datetime import datetime
from pathlib import Path
from typing import List

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
    QLabel,
    QLineEdit,
    QMainWindow,
    QMessageBox,
    QPushButton,
    QPlainTextEdit,
    QSpinBox,
    QStatusBar,
    QVBoxLayout,
    QWidget,
)

ERROR_MARKERS = (
    "INVALID",
    "ERROR",
    "FAIL",
    "OUT OF RANGE",
    "NOT CALIBRATED",
)

VALUE_WRITE_TOKENS = {"CALSET", "CALF", "CALDATE", "SER#"}

DEFAULT_SEQUENCE = """# Best-guess LC103 service sequence (edit as needed)
# CAUTION: CALSET/CALF likely require arguments and fixture-specific values.
CALON
CALCLR
# CALSET,<fixture_or_slot>,<value>
# CALF,<point>,<value>
CALCHK
CALDATE?
# CALDATE,YYYY-MM-DD
CALOFF
"""


class MainWindow(QMainWindow):
    def __init__(self) -> None:
        super().__init__()
        self.setWindowTitle("LC103 Autocal Explorer (Best Guess)")
        self.resize(1080, 760)

        self.serial = QSerialPort(self)
        self.serial.readyRead.connect(self.on_ready_read)
        self.serial.errorOccurred.connect(self.on_serial_error)

        self.sequence_timer = QTimer(self)
        self.sequence_timer.setSingleShot(True)
        self.sequence_timer.timeout.connect(self.send_next_sequence_command)
        self.sequence_commands: List[str] = []
        self.sequence_index = 0
        self.sequence_running = False

        self.rx_buffer = bytearray()
        self.transcript: List[str] = []

        self.build_ui()
        self.refresh_ports()

    def build_ui(self) -> None:
        root = QWidget(self)
        self.setCentralWidget(root)
        main = QVBoxLayout(root)

        main.addWidget(self.make_serial_group())
        main.addWidget(self.make_safety_group())
        main.addWidget(self.make_commands_group())
        main.addWidget(self.make_sequence_group())
        main.addWidget(self.make_log_group())

        self.status = QStatusBar(self)
        self.setStatusBar(self.status)
        self.status.showMessage("Disconnected")

    def make_serial_group(self) -> QGroupBox:
        box = QGroupBox("Serial")
        g = QGridLayout(box)

        self.port_combo = QComboBox()
        self.refresh_btn = QPushButton("Refresh")
        self.refresh_btn.clicked.connect(self.refresh_ports)

        self.baud_combo = QComboBox()
        for baud in (1200, 2400, 4800, 9600, 19200, 38400, 57600, 115200):
            self.baud_combo.addItem(str(baud), baud)
        self.baud_combo.setCurrentText("9600")

        self.data_bits_combo = QComboBox()
        self.data_bits_combo.addItem("8", QSerialPort.Data8)
        self.data_bits_combo.addItem("7", QSerialPort.Data7)

        self.parity_combo = QComboBox()
        self.parity_combo.addItem("None", QSerialPort.NoParity)
        self.parity_combo.addItem("Even", QSerialPort.EvenParity)
        self.parity_combo.addItem("Odd", QSerialPort.OddParity)

        self.stop_bits_combo = QComboBox()
        self.stop_bits_combo.addItem("1", QSerialPort.OneStop)
        self.stop_bits_combo.addItem("2", QSerialPort.TwoStop)

        self.connect_btn = QPushButton("Connect")
        self.connect_btn.clicked.connect(self.toggle_connection)

        g.addWidget(QLabel("Port"), 0, 0)
        g.addWidget(self.port_combo, 0, 1)
        g.addWidget(self.refresh_btn, 0, 2)

        g.addWidget(QLabel("Baud"), 1, 0)
        g.addWidget(self.baud_combo, 1, 1)
        g.addWidget(QLabel("Data bits"), 1, 2)
        g.addWidget(self.data_bits_combo, 1, 3)
        g.addWidget(QLabel("Parity"), 1, 4)
        g.addWidget(self.parity_combo, 1, 5)
        g.addWidget(QLabel("Stop bits"), 1, 6)
        g.addWidget(self.stop_bits_combo, 1, 7)

        g.addWidget(self.connect_btn, 0, 7)
        return box

    def make_safety_group(self) -> QGroupBox:
        box = QGroupBox("Safety")
        row = QHBoxLayout(box)

        self.risk_ack = QCheckBox("I accept risk before sending mutating CAL commands")
        self.block_value_writes = QCheckBox("Block value writes (recommended)")
        self.block_value_writes.setChecked(True)
        self.dry_run = QCheckBox("Dry run (log only)")
        self.dry_run.setChecked(True)
        self.append_cr = QCheckBox("Append CR")
        self.append_cr.setChecked(True)
        self.append_lf = QCheckBox("Append LF")
        self.stop_on_error = QCheckBox("Stop sequence on error text")
        self.stop_on_error.setChecked(True)

        self.delay_ms = QSpinBox()
        self.delay_ms.setRange(50, 10000)
        self.delay_ms.setValue(500)
        self.delay_ms.setSuffix(" ms")

        row.addWidget(self.risk_ack)
        row.addWidget(self.block_value_writes)
        row.addWidget(self.dry_run)
        row.addWidget(self.append_cr)
        row.addWidget(self.append_lf)
        row.addWidget(self.stop_on_error)
        row.addWidget(QLabel("Sequence delay"))
        row.addWidget(self.delay_ms)
        return box

    def make_commands_group(self) -> QGroupBox:
        box = QGroupBox("Manual Commands")
        v = QVBoxLayout(box)

        quick = QHBoxLayout()
        for cmd in (
            "CALON",
            "CALOFF",
            "CALCLR",
            "CALCHK",
            "CALDATE?",
            "CALF?",
            "SER#?",
            "BEEP",
        ):
            b = QPushButton(cmd)
            b.clicked.connect(lambda _=False, text=cmd: self.send_command(text, origin="quick"))
            quick.addWidget(b)

        self.manual_input = QLineEdit()
        self.manual_input.setPlaceholderText("Enter command, e.g. CALSET,...")
        self.manual_input.returnPressed.connect(self.send_manual)
        self.send_btn = QPushButton("Send")
        self.send_btn.clicked.connect(self.send_manual)

        send_row = QHBoxLayout()
        send_row.addWidget(self.manual_input)
        send_row.addWidget(self.send_btn)

        v.addLayout(quick)
        v.addLayout(send_row)
        return box

    def make_sequence_group(self) -> QGroupBox:
        box = QGroupBox("Sequence Runner")
        v = QVBoxLayout(box)

        self.sequence_editor = QPlainTextEdit()
        self.sequence_editor.setPlainText(DEFAULT_SEQUENCE)

        row = QHBoxLayout()
        self.run_seq_btn = QPushButton("Run Sequence")
        self.stop_seq_btn = QPushButton("Stop")
        self.stop_seq_btn.setEnabled(False)
        self.run_seq_btn.clicked.connect(self.start_sequence)
        self.stop_seq_btn.clicked.connect(self.stop_sequence)

        row.addWidget(self.run_seq_btn)
        row.addWidget(self.stop_seq_btn)

        v.addWidget(self.sequence_editor)
        v.addLayout(row)
        return box

    def make_log_group(self) -> QGroupBox:
        box = QGroupBox("Transcript")
        v = QVBoxLayout(box)

        self.log_view = QPlainTextEdit()
        self.log_view.setReadOnly(True)

        row = QHBoxLayout()
        self.save_log_btn = QPushButton("Save Log")
        self.clear_log_btn = QPushButton("Clear")
        self.save_log_btn.clicked.connect(self.save_log)
        self.clear_log_btn.clicked.connect(self.clear_log)

        row.addWidget(self.save_log_btn)
        row.addWidget(self.clear_log_btn)
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

    def toggle_connection(self) -> None:
        if self.serial.isOpen():
            self.serial.close()
            self.connect_btn.setText("Connect")
            self.status.showMessage("Disconnected")
            self.log("SYS", "Disconnected")
            return

        port_name = self.port_combo.currentData()
        if not port_name:
            QMessageBox.warning(self, "No Port", "Select a serial port first.")
            return

        self.serial.setPortName(port_name)
        self.serial.setBaudRate(int(self.baud_combo.currentData()))
        self.serial.setDataBits(self.data_bits_combo.currentData())
        self.serial.setParity(self.parity_combo.currentData())
        self.serial.setStopBits(self.stop_bits_combo.currentData())
        self.serial.setFlowControl(QSerialPort.NoFlowControl)

        if not self.serial.open(QSerialPort.ReadWrite):
            QMessageBox.critical(self, "Open Failed", self.serial.errorString())
            return

        self.connect_btn.setText("Disconnect")
        self.status.showMessage(f"Connected: {port_name}")
        self.log("SYS", f"Connected to {port_name}")

    def send_manual(self) -> None:
        text = self.manual_input.text().strip()
        if not text:
            return
        self.send_command(text, origin="manual")

    def is_mutating_cal_command(self, cmd: str) -> bool:
        token = cmd.strip().upper().split(",", 1)[0]
        return token in {"CALON", "CALOFF", "CALCLR", "CALSET", "CALF", "CALDATE"}

    def is_query_form(self, cmd: str) -> bool:
        token = cmd.strip().upper().split(",", 1)[0]
        return token.endswith("?")

    def is_value_write_command(self, cmd: str) -> bool:
        token = cmd.strip().upper().split(",", 1)[0]
        return token in VALUE_WRITE_TOKENS and not self.is_query_form(cmd)

    def ensure_send_allowed(self, cmd: str) -> bool:
        if self.dry_run.isChecked():
            return True
        if self.block_value_writes.isChecked() and self.is_value_write_command(cmd):
            QMessageBox.warning(
                self,
                "Write Blocked",
                "Value-write command blocked by safety lock.\n"
                "Disable 'Block value writes' only when you have validated payload syntax.",
            )
            return False
        if self.is_mutating_cal_command(cmd) and not self.risk_ack.isChecked():
            QMessageBox.warning(
                self,
                "Risk Confirmation Needed",
                "Enable risk acknowledgment before sending mutating CAL commands.",
            )
            return False
        if not self.serial.isOpen():
            QMessageBox.warning(self, "Not Connected", "Open serial port first or use Dry run.")
            return False
        return True

    def with_line_ending(self, cmd: str) -> bytes:
        payload = cmd
        if self.append_cr.isChecked():
            payload += "\r"
        if self.append_lf.isChecked():
            payload += "\n"
        return payload.encode("ascii", errors="replace")

    def send_command(self, cmd: str, origin: str = "manual") -> None:
        cmd = cmd.strip()
        if not cmd:
            return
        if not self.ensure_send_allowed(cmd):
            return

        if self.dry_run.isChecked():
            self.log("TX", f"[DRY:{origin}] {cmd}")
            return

        payload = self.with_line_ending(cmd)
        written = self.serial.write(payload)
        self.log("TX", f"[{origin}] {cmd} (bytes={written})")

    def start_sequence(self) -> None:
        lines = self.sequence_editor.toPlainText().splitlines()
        cmds = []
        for line in lines:
            stripped = line.strip()
            if not stripped or stripped.startswith("#"):
                continue
            cmds.append(stripped)

        if not cmds:
            QMessageBox.information(self, "No Commands", "Sequence is empty.")
            return

        if not self.dry_run.isChecked() and not self.risk_ack.isChecked():
            QMessageBox.warning(
                self,
                "Risk Confirmation Needed",
                "Enable risk acknowledgment before running a live sequence.",
            )
            return

        self.sequence_commands = cmds
        self.sequence_index = 0
        self.sequence_running = True
        self.run_seq_btn.setEnabled(False)
        self.stop_seq_btn.setEnabled(True)
        self.log("SYS", f"Sequence start ({len(cmds)} commands)")
        self.send_next_sequence_command()

    def send_next_sequence_command(self) -> None:
        if not self.sequence_running:
            return

        if self.sequence_index >= len(self.sequence_commands):
            self.log("SYS", "Sequence complete")
            self.stop_sequence(reset_message=False)
            return

        cmd = self.sequence_commands[self.sequence_index]
        self.sequence_index += 1

        if not self.ensure_send_allowed(cmd):
            self.log("SYS", f"Sequence stopped: blocked command: {cmd}")
            self.stop_sequence(reset_message=False)
            return

        self.send_command(cmd, origin=f"seq#{self.sequence_index}")

        if self.sequence_running:
            self.sequence_timer.start(self.delay_ms.value())

    def stop_sequence(self, reset_message: bool = True) -> None:
        self.sequence_running = False
        self.sequence_timer.stop()
        self.run_seq_btn.setEnabled(True)
        self.stop_seq_btn.setEnabled(False)
        if reset_message:
            self.log("SYS", "Sequence stopped")

    def on_ready_read(self) -> None:
        data = self.serial.readAll().data()
        if not data:
            return
        try:
            text = data.decode("ascii", errors="replace")
        except Exception:
            text = repr(bytes(data))
        self.log("RX", text.rstrip("\n"))

        upper = text.upper()
        if self.sequence_running and self.stop_on_error.isChecked():
            if any(marker in upper for marker in ERROR_MARKERS):
                self.log("SYS", "Sequence halted on error marker in RX text")
                self.stop_sequence(reset_message=False)

    def on_serial_error(self, err: QSerialPort.SerialPortError) -> None:
        if err in (QSerialPort.NoError, QSerialPort.TimeoutError):
            return
        self.log("SER", self.serial.errorString())

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


if __name__ == "__main__":
    app = QApplication([])
    win = MainWindow()
    win.show()
    app.exec()
