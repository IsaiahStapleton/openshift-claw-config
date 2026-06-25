#!/bin/sh
set -eu
cd "${WORKSPACE_DIR:-$HOME/.openclaw/workspace}"
git add -A
if git diff --cached --quiet; then
  echo "NO_REPLY"; exit 0
fi
git commit -m "memory snapshot $(date -u +%Y-%m-%dT%H:%M:%SZ)" >/dev/null
if git remote get-url origin >/dev/null 2>&1; then
  git push origin HEAD >/dev/null 2>&1 || echo "push failed (committed locally)"
fi
echo "NO_REPLY"
