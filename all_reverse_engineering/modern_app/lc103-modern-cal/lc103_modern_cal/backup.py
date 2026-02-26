from __future__ import annotations

from dataclasses import dataclass
from datetime import datetime, timezone
import re
from typing import Dict, Iterable, List, Mapping, Optional, Sequence

from .autoselect import parse_device_identity

BACKUP_QUERY_COMMANDS: List[str] = [
    "SER#?",
    "VER#?",
    "CALDATE?",
    "CALCHK",
    "CALF?",
]

FLOAT_TOKEN_RE = re.compile(r"[-+]?\d+(?:\.\d+)?(?:[Ee][-+]?\d+)?")
INDEX_VALUE_RE = re.compile(
    r"(?:R(?:ANGE)?\s*)?(\d+)\s*[:=, ]\s*([-+]?\d+(?:\.\d+)?(?:[Ee][-+]?\d+)?)",
    re.IGNORECASE,
)
SERIAL_RE = re.compile(r"SER#?\s*[:=, ]\s*([A-Za-z0-9._\-/]+)", re.IGNORECASE)
DATE_RE_ISO = re.compile(r"\b(\d{4}-\d{2}-\d{2})\b")
DATE_RE_US = re.compile(r"\b(\d{1,2})/(\d{1,2})/(\d{4})\b")


@dataclass(frozen=True)
class BackupSnapshot:
    created_at_utc: str
    device_model: Optional[str]
    firmware_revision: Optional[str]
    serial_number: Optional[str]
    calibration_date: Optional[str]
    query_commands: List[str]
    responses: Dict[str, List[str]]
    parsed_calf_factors: Dict[str, float]
    restore_commands: List[str]
    transcript: List[str]


def _to_iso_utc_now() -> str:
    return datetime.now(timezone.utc).replace(microsecond=0).isoformat()


def _normalize_date(text: str) -> Optional[str]:
    m_iso = DATE_RE_ISO.search(text)
    if m_iso:
        return m_iso.group(1)

    m_us = DATE_RE_US.search(text)
    if m_us:
        month = int(m_us.group(1))
        day = int(m_us.group(2))
        year = int(m_us.group(3))
        if 1 <= month <= 12 and 1 <= day <= 31:
            return f"{year:04d}-{month:02d}-{day:02d}"

    return None


def _extract_serial(text: str) -> Optional[str]:
    m = SERIAL_RE.search(text)
    if m:
        return m.group(1)
    return None


def parse_calf_factors(text: str) -> Dict[int, float]:
    out: Dict[int, float] = {}
    for m in INDEX_VALUE_RE.finditer(text):
        idx = int(m.group(1))
        val = float(m.group(2))
        out[idx] = val
    return out


def _fmt_calf_factor(v: float) -> str:
    # Legacy artifacts indicate scientific notation like x.xxxxExx.
    return f"{v:.4E}"


def build_restore_commands(
    calf_factors: Mapping[int, float], calibration_date: Optional[str] = None
) -> List[str]:
    if not calf_factors:
        return []

    cmds: List[str] = ["CALON"]
    for idx in sorted(calf_factors.keys()):
        cmds.append(f"CALF {idx:02d} {_fmt_calf_factor(calf_factors[idx])}")
    if calibration_date:
        cmds.append(f"CALDATE {calibration_date}")
    cmds.extend(["CALCHK", "CALOFF"])
    return cmds


def build_snapshot(
    responses: Mapping[str, Sequence[str]],
    transcript: Iterable[str],
    query_commands: Optional[Sequence[str]] = None,
) -> BackupSnapshot:
    normalized_responses: Dict[str, List[str]] = {
        cmd: list(lines) for cmd, lines in responses.items()
    }
    transcript_list = list(transcript)

    all_text_parts: List[str] = []
    for cmd in normalized_responses:
        all_text_parts.extend(normalized_responses[cmd])
    all_text_parts.extend(transcript_list)
    all_text = "\n".join(all_text_parts)

    ident = parse_device_identity(all_text)
    serial = _extract_serial(all_text)
    date = _normalize_date("\n".join(normalized_responses.get("CALDATE?", [])) or all_text)

    calf_text = "\n".join(normalized_responses.get("CALF?", []))
    factors = parse_calf_factors(calf_text)
    restore = build_restore_commands(factors, calibration_date=date)

    factor_json = {str(k): float(v) for k, v in sorted(factors.items())}
    cmds = list(query_commands) if query_commands is not None else list(BACKUP_QUERY_COMMANDS)

    return BackupSnapshot(
        created_at_utc=_to_iso_utc_now(),
        device_model=ident.model,
        firmware_revision=ident.version,
        serial_number=serial,
        calibration_date=date,
        query_commands=cmds,
        responses=normalized_responses,
        parsed_calf_factors=factor_json,
        restore_commands=restore,
        transcript=transcript_list,
    )


def snapshot_to_dict(snapshot: BackupSnapshot) -> Dict[str, object]:
    return {
        "schema_version": 1,
        "created_at_utc": snapshot.created_at_utc,
        "device_model": snapshot.device_model,
        "firmware_revision": snapshot.firmware_revision,
        "serial_number": snapshot.serial_number,
        "calibration_date": snapshot.calibration_date,
        "query_commands": snapshot.query_commands,
        "responses": snapshot.responses,
        "parsed_calf_factors": snapshot.parsed_calf_factors,
        "restore_commands": snapshot.restore_commands,
        "transcript": snapshot.transcript,
    }


def restore_commands_from_backup_doc(doc: Mapping[str, object]) -> List[str]:
    value = doc.get("restore_commands")
    if isinstance(value, list):
        out = [str(v).strip() for v in value if str(v).strip()]
        if out:
            return out

    factors_obj = doc.get("parsed_calf_factors")
    factors: Dict[int, float] = {}
    if isinstance(factors_obj, dict):
        for k, v in factors_obj.items():
            try:
                idx = int(str(k))
                val = float(v)
            except Exception:
                continue
            factors[idx] = val

    cal_date = None
    raw_cal_date = doc.get("calibration_date")
    if isinstance(raw_cal_date, str):
        cal_date = _normalize_date(raw_cal_date)

    return build_restore_commands(factors, calibration_date=cal_date)
