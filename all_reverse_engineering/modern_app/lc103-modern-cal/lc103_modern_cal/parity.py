from __future__ import annotations

from dataclasses import dataclass
import re
from typing import Dict, List, Sequence, Set

from .workflow import (
    WorkflowStep,
    is_do_next_after_pass_marker,
    is_next_range_marker,
    is_start_prompt_marker,
    match_future_step_marker,
    match_global_fail_marker,
    match_global_pass_marker,
    match_step_fail_marker,
    match_step_marker,
    match_step_pass_marker,
    match_step_ready_marker,
)

RX_PREFIX_RE = re.compile(r"^\s*(?:\[[^\]]+\]\s*)?RX:\s*(.*)\s*$", re.IGNORECASE)


@dataclass(frozen=True)
class ParityReplayResult:
    rx_line_count: int
    total_steps: int
    final_index: int
    start_gate_passed: bool
    completed_step_ids: List[str]
    verified_step_ids: List[str]
    ready_step_ids: List[str]
    passed_step_ids: List[str]
    failed_step_ids: List[str]
    workflow_evidence: Dict[str, List[str]]
    transitions: List[str]

    def to_dict(self) -> Dict[str, object]:
        verified_count = len(self.verified_step_ids)
        done_count = len(self.completed_step_ids)
        total = max(1, self.total_steps)
        return {
            "rx_line_count": self.rx_line_count,
            "total_steps": self.total_steps,
            "final_index": self.final_index,
            "start_gate_passed": self.start_gate_passed,
            "completed_step_ids": self.completed_step_ids,
            "verified_step_ids": self.verified_step_ids,
            "ready_step_ids": self.ready_step_ids,
            "passed_step_ids": self.passed_step_ids,
            "failed_step_ids": self.failed_step_ids,
            "workflow_evidence": self.workflow_evidence,
            "transitions": self.transitions,
            "coverage": {
                "verified_steps": verified_count,
                "done_steps": done_count,
                "verified_ratio": verified_count / total,
                "done_ratio": done_count / total,
            },
        }


def extract_rx_lines_from_text(text: str) -> List[str]:
    out: List[str] = []
    for raw in text.splitlines():
        line = raw.strip()
        if not line:
            continue
        m = RX_PREFIX_RE.match(line)
        if m:
            payload = m.group(1).strip()
            if payload:
                out.append(payload)
            continue
        out.append(line)
    return out


def replay_legacy_workflow(
    steps: Sequence[WorkflowStep],
    rx_lines: Sequence[str],
    auto_sync: bool = True,
    auto_advance: bool = True,
) -> ParityReplayResult:
    if not steps:
        return ParityReplayResult(
            rx_line_count=len(rx_lines),
            total_steps=0,
            final_index=0,
            start_gate_passed=False,
            completed_step_ids=[],
            verified_step_ids=[],
            ready_step_ids=[],
            passed_step_ids=[],
            failed_step_ids=[],
            workflow_evidence={},
            transitions=[],
        )

    idx = 0
    start_gate_passed = False
    done: Set[str] = set()
    verified: Set[str] = set()
    ready: Set[str] = set()
    passed: Set[str] = set()
    failed: Set[str] = set()
    evidence: Dict[str, List[str]] = {}
    transitions: List[str] = []

    def current_step() -> WorkflowStep:
        return steps[idx]

    def can_advance(step: WorkflowStep) -> bool:
        if step.id == "startup_select" and not start_gate_passed:
            return False
        if step.id != "startup_select" and step.ready_markers and step.id not in ready:
            return False
        if step.pass_markers and step.id not in passed:
            return False
        return True

    def advance(reason: str) -> bool:
        nonlocal idx
        step = current_step()
        done.add(step.id)
        if idx < len(steps) - 1:
            idx += 1
            transitions.append(f"{reason}: {step.id} -> {steps[idx].id}")
            return True
        transitions.append(f"{reason}: {step.id} -> END")
        return False

    def maybe_advance_on_next_range() -> bool:
        nonlocal idx
        step = current_step()
        if not step.range_family or step.range_kind != "high":
            return False
        for i in range(idx + 1, len(steps)):
            nxt = steps[i]
            if (
                nxt.range_family == step.range_family
                and nxt.range_kind == "low"
                and nxt.range_index is not None
                and step.range_index is not None
                and nxt.range_index > step.range_index
            ):
                done.add(step.id)
                idx = i
                transitions.append(f"next-range: {step.id} -> {nxt.id}")
                return True
        return False

    def sync_to_future(future_index: int, reason: str) -> bool:
        nonlocal idx
        if future_index <= idx or future_index >= len(steps):
            return False
        step = current_step()
        done.add(step.id)
        idx = future_index
        transitions.append(f"{reason}: {step.id} -> {steps[idx].id}")
        return True

    for text in rx_lines:
        step = current_step()

        r = match_step_ready_marker(step, text)
        if r:
            ready.add(step.id)
            transitions.append(f"ready[{step.id}]={r}")

        p = match_step_pass_marker(step, text)
        if p:
            passed.add(step.id)
            failed.discard(step.id)
            transitions.append(f"pass[{step.id}]={p}")
        else:
            gp = match_global_pass_marker(text)
            if gp:
                passed.add(step.id)
                failed.discard(step.id)
                transitions.append(f"pass-global[{step.id}]={gp}")

        f = match_step_fail_marker(step, text)
        if f and step.id not in passed:
            failed.add(step.id)
            transitions.append(f"fail[{step.id}]={f}")
        elif step.id not in passed:
            gf = match_global_fail_marker(text)
            if gf:
                failed.add(step.id)
                transitions.append(f"fail-global[{step.id}]={gf}")

        m = match_step_marker(step, text)
        if m:
            verified.add(step.id)
            evidence.setdefault(step.id, [])
            if m not in evidence[step.id]:
                evidence[step.id].append(m)
            transitions.append(f"verify[{step.id}]={m}")
            if step.id == "startup_select":
                start_gate_passed = True
                transitions.append("start-gate=pass")
                if auto_advance and can_advance(step):
                    advance("auto-start-gate")
                    continue
        elif step.id == "startup_select" and is_start_prompt_marker(text):
            start_gate_passed = True
            transitions.append("start-gate=prompt")
            if auto_advance and can_advance(step):
                advance("auto-start-prompt")
                continue

        if auto_sync:
            future = match_future_step_marker(steps, idx, text)
            if future:
                future_idx, marker = future
                if sync_to_future(future_idx, f"future-sync({marker})"):
                    continue

        if is_next_range_marker(text):
            if maybe_advance_on_next_range():
                continue

        if auto_advance and is_do_next_after_pass_marker(text) and can_advance(step):
            if advance("auto-do-next"):
                continue

    return ParityReplayResult(
        rx_line_count=len(rx_lines),
        total_steps=len(steps),
        final_index=idx,
        start_gate_passed=start_gate_passed,
        completed_step_ids=sorted(done),
        verified_step_ids=sorted(verified),
        ready_step_ids=sorted(ready),
        passed_step_ids=sorted(passed),
        failed_step_ids=sorted(failed),
        workflow_evidence={k: list(v) for k, v in evidence.items()},
        transitions=transitions,
    )
