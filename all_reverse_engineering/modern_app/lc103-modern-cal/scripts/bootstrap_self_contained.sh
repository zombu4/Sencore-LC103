#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

python3 -m venv .venv
. .venv/bin/activate
python -m pip install --upgrade pip

if [ -n "$(find wheelhouse -maxdepth 1 -type f -name '*.whl' 2>/dev/null)" ]; then
  python -m pip install --no-index --find-links wheelhouse -r requirements.lock
else
  python -m pip install -r requirements.lock
fi

python -m pip install -e .
python scripts/verify_self_contained.py

echo "Self-contained bootstrap complete."
echo "Run: . .venv/bin/activate && lc103-modern-cal"
