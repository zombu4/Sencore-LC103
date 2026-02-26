from __future__ import annotations

from dataclasses import dataclass
import json
from pathlib import Path
from typing import Dict, List, Optional, Sequence

from .caldata import CalPair, CalibrationRange
from .legacy_plan import build_legacy_plan
from .parity import replay_legacy_workflow


@dataclass(frozen=True)
class GoldenScenario:
    id: str
    description: str
    selected_stage_ids: List[str]
    rx_lines: List[str]
    expect_start_gate_passed: bool = True
    expect_done_contains: List[str] = None  # type: ignore[assignment]
    expect_failed_contains: List[str] = None  # type: ignore[assignment]
    expect_final_step_id: Optional[str] = None
    auto_sync: bool = True
    auto_advance: bool = True

    def __post_init__(self) -> None:
        object.__setattr__(self, "expect_done_contains", list(self.expect_done_contains or []))
        object.__setattr__(self, "expect_failed_contains", list(self.expect_failed_contains or []))


def _bundled_corpus_path() -> Path:
    return Path(__file__).resolve().parent / "profiles" / "LC103" / "golden_parity_corpus.json"


def load_golden_parity_corpus(path: Optional[Path] = None) -> List[GoldenScenario]:
    p = path or _bundled_corpus_path()
    obj = json.loads(p.read_text(encoding="utf-8"))
    items = obj.get("scenarios", [])
    out: List[GoldenScenario] = []
    for it in items:
        out.append(
            GoldenScenario(
                id=str(it["id"]),
                description=str(it.get("description", "")),
                selected_stage_ids=[str(v) for v in it.get("selected_stage_ids", [])],
                rx_lines=[str(v) for v in it.get("rx_lines", [])],
                expect_start_gate_passed=bool(it.get("expect_start_gate_passed", True)),
                expect_done_contains=[str(v) for v in it.get("expect_done_contains", [])],
                expect_failed_contains=[str(v) for v in it.get("expect_failed_contains", [])],
                expect_final_step_id=str(it["expect_final_step_id"]) if it.get("expect_final_step_id") else None,
                auto_sync=bool(it.get("auto_sync", True)),
                auto_advance=bool(it.get("auto_advance", True)),
            )
        )
    return out


def _default_ranges() -> List[CalibrationRange]:
    return [
        CalibrationRange("C", 0, "200pF", 200e-12, "1700pF", 1700e-12),
        CalibrationRange("C", 1, "0.004uF", 0.004e-6, "0.018uF", 0.018e-6),
        CalibrationRange("L", 0, "2.0uH", 2e-6, "10uH", 10e-6),
    ]


def _pairs_from_ranges(ranges: Sequence[CalibrationRange], family: str) -> List[CalPair]:
    out: List[CalPair] = []
    for r in ranges:
        if r.family != family:
            continue
        out.append(CalPair(index=r.index, high=r.high_actual, low=r.low_actual))
    return out


def run_golden_parity_corpus(scenarios: Sequence[GoldenScenario]) -> Dict[str, object]:
    ranges = _default_ranges()
    c_pairs = _pairs_from_ranges(ranges, "C")
    l_pairs = _pairs_from_ranges(ranges, "L")

    scenario_results: List[Dict[str, object]] = []
    pass_count = 0

    for sc in scenarios:
        plan = build_legacy_plan(sc.selected_stage_ids, ranges, c_pairs, l_pairs)
        replay = replay_legacy_workflow(
            plan,
            sc.rx_lines,
            auto_sync=sc.auto_sync,
            auto_advance=sc.auto_advance,
        )
        final_step_id = plan[replay.final_index].id if plan else None

        errors: List[str] = []
        if sc.expect_start_gate_passed and not replay.start_gate_passed:
            errors.append("start_gate_not_passed")
        for sid in sc.expect_done_contains:
            if sid not in replay.completed_step_ids:
                errors.append(f"missing_done:{sid}")
        for sid in sc.expect_failed_contains:
            if sid not in replay.failed_step_ids:
                errors.append(f"missing_failed:{sid}")
        if sc.expect_final_step_id and final_step_id != sc.expect_final_step_id:
            errors.append(f"final_step_mismatch:{final_step_id}!= {sc.expect_final_step_id}")

        ok = not errors
        if ok:
            pass_count += 1

        scenario_results.append(
            {
                "id": sc.id,
                "description": sc.description,
                "ok": ok,
                "errors": errors,
                "expectations": {
                    "expect_start_gate_passed": sc.expect_start_gate_passed,
                    "expect_done_contains": sc.expect_done_contains,
                    "expect_failed_contains": sc.expect_failed_contains,
                    "expect_final_step_id": sc.expect_final_step_id,
                },
                "actual": replay.to_dict(),
                "actual_final_step_id": final_step_id,
            }
        )

    total = len(scenarios)
    return {
        "schema_version": 1,
        "scenario_count": total,
        "pass_count": pass_count,
        "fail_count": total - pass_count,
        "pass_ratio": (pass_count / total) if total else 0.0,
        "scenarios": scenario_results,
    }
