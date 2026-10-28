#!/usr/bin/env bash
# check-kit.sh — fail if delivery-gate phrases drift out of the harness.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
fail=0

need() {
  local file="$1"
  local needle="$2"
  if ! grep -qF -- "$needle" "$ROOT/$file"; then
    echo "MISSING in $file: $needle" >&2
    fail=1
  fi
}

need AGENTS.md "| \`release\` |"
need AGENTS.md "Ship is git. Release is the audience."
need GLOSSARY.md "| **Release** |"
need GLOSSARY.md "| **Ship** |"
need GLOSSARY.md "| **Acceptance evidence** |"
need GLOSSARY.md "| **Sensitive surface** |"
need GLOSSARY.md "| **Integration verify** |"
need .cursor/skills/verify/SKILL.md "Acceptance evidence"
need .cursor/skills/verify/SKILL.md "Sensitive surface"
need .cursor/skills/ship/SKILL.md "Ship does not release."
need .cursor/skills/release/SKILL.md "rollback"
need .cursor/skills/to-tickets/SKILL.md "observability"
need .cursor/skills/parallel-worktrees/SKILL.md "integration verify"
need .cursor/skills/retro/SKILL.md "success"
need .cursor/commands/greenfield.md "wayfinder"
need .cursor/commands/release.md "/release"
need templates/VERIFY.md "Acceptance evidence"
need templates/RELEASE.md "Rollback"
need templates/TICKETS.md "**Kind:**"
need templates/SPEC.md "Sensitive surface"

if [[ "$fail" -ne 0 ]]; then
  exit 1
fi

echo "check-kit: ok"
