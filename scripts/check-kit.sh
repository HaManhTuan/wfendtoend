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
need templates/SPEC.md "Failure modes"
need templates/PLAN.md "Likelihood"
need templates/HANDOFF.md "Not done"
need templates/RUN-LOG.md "append-only"
need templates/REVIEW.md "Out of scope creep"
need templates/VERIFY.md "Browser smoke"
need templates/RELEASE.md "Deploy"
need templates/WAYFINDER.md "Door"
need templates/RESEARCH.md "Q&A log"
need templates/ADR.md "Revisit when"
need templates/QUESTIONNAIRE.md "Fold-back"
need AGENTS.md "publish-tickets"
need .cursor/skills/publish-tickets/SKILL.md "Do not re-run the whole batch."
need .cursor/skills/to-tickets/SKILL.md "publish-tickets"
need .cursor/skills/lock-scope/SKILL.md "do not write a second file"
need .cursor/skills/discover/SKILL.md "one-seam"
need .cursor/skills/verify/SKILL.md "regression check"
need .cursor/skills/implement/SKILL.md "Amendments"
need templates/SPEC.md "Amendments"
need templates/SPEC.md "one-seam"
need CLAUDE.md "@AGENTS.md"
need CLAUDE.md "@.cursor/rules/00-workflow.mdc"

if [[ ! -L "$ROOT/.claude/skills/discover" ]]; then
  echo "MISSING symlink .claude/skills/discover" >&2
  fail=1
fi
if [[ ! -L "$ROOT/.claude/commands/feature.md" ]]; then
  echo "MISSING symlink .claude/commands/feature.md" >&2
  fail=1
fi
if [[ -e "$ROOT/.claude/commands/release.md" ]]; then
  echo "UNEXPECTED .claude/commands/release.md (skill owns /release)" >&2
  fail=1
fi

if [[ "$fail" -ne 0 ]]; then
  exit 1
fi

echo "check-kit: ok"
