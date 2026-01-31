#!/usr/bin/env bash
set -euo pipefail

echo "🔍 DriftLock Preflight Checks"
echo "----------------------------"

# Ensure we're at repo root by checking for key files
if [[ ! -f "requirements.txt" ]]; then
  echo "❌ requirements.txt not found. Run this script from the repo root."
  exit 1
fi

echo "✅ Repo root confirmed (requirements.txt found)."

# Check Python
if ! command -v python3 >/dev/null 2>&1; then
  echo "❌ python3 not found."
  exit 1
fi

PY_VERSION="$(python3 --version 2>&1)"
echo "✅ Python detected: ${PY_VERSION}"

# Check pip
if ! command -v pip >/dev/null 2>&1; then
  echo "❌ pip not found."
  exit 1
fi

PIP_VERSION="$(pip --version 2>&1)"
echo "✅ pip detected: ${PIP_VERSION}"

echo ""
echo "📦 Checking required Python packages..."
echo "-------------------------------------"

# List of packages DriftLock Labs expects (matches requirements.txt intent)
python3 - <<'PY'
import sys

checks = [
    ("pyyaml", "yaml"),
    ("ruamel.yaml", "ruamel.yaml"),
    ("jsonschema", "jsonschema"),
    ("rich", "rich"),
    ("pathspec", "pathspec"),
    ("jmespath", "jmespath"),
    ("kubernetes", "kubernetes"),
]

failed = []

for display, module in checks:
    try:
        __import__(module)
        print(f"✅ {display} is installed")
    except Exception as e:
        print(f"❌ {display} is NOT available: {e}")
        failed.append(display)

if failed:
    print("\nFix:")
    print("  pip install -r requirements.txt\n")
    sys.exit(1)

print("\n✅ All DriftLock Labs dependencies are available.")
PY

echo ""
echo "🎯 Preflight complete. Environment looks healthy."
