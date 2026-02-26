#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

mkdir -p wheelhouse
python3 -m pip download -d wheelhouse -r requirements.lock

echo "Wheelhouse built in: $ROOT/wheelhouse"
