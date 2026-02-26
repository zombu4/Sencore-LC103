from __future__ import annotations

from dataclasses import dataclass
import re
from typing import List

SAFE_QUERY_SEQUENCE = [
    "SER#?",
    "VER#?",
    "CALDATE?",
    "CALF?",
    "CALCHK",
]

BEST_GUESS_AUTOCAL_SEQUENCE = [
    "CALON",
    "CALCLR",
    "CALSET",
    "CALCHK",
    "CALF?",
    "CALDATE?",
    "CALOFF",
]

MUTATING_TOKENS = {
    "CALON",
    "CALOFF",
    "CALCLR",
    "CALSET",
    "CALF",
    "CALDATE",
    "SER#",
}

VALUE_WRITE_TOKENS = {
    "CALSET",
    "CALF",
    "CALDATE",
    "SER#",
}


@dataclass(frozen=True)
class CommandAssessment:
    command: str
    token: str
    is_query: bool
    is_mutating: bool
    is_value_write: bool


def normalize_command(command: str) -> str:
    return command.strip()


def command_token(command: str) -> str:
    cmd = normalize_command(command)
    if not cmd:
        return ""
    return re.split(r"[,\s]+", cmd.upper(), maxsplit=1)[0]


def is_query(command: str) -> bool:
    return command_token(command).endswith("?")


def is_mutating(command: str) -> bool:
    token = command_token(command)
    return token in MUTATING_TOKENS


def is_value_write(command: str) -> bool:
    token = command_token(command)
    return token in VALUE_WRITE_TOKENS and not token.endswith("?")


def assess(command: str) -> CommandAssessment:
    token = command_token(command)
    return CommandAssessment(
        command=normalize_command(command),
        token=token,
        is_query=is_query(command),
        is_mutating=is_mutating(command),
        is_value_write=is_value_write(command),
    )


def render_sequence(lines: List[str]) -> str:
    return "\n".join(lines) + "\n"
