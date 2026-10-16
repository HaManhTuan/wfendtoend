---
name: diagnose
description: >-
  Systematic root-cause loop for bugs and regressions — no fix before Phase 1 evidence.
  Use at the start of any non-trivial debugging session.
---

# Diagnose

**Iron law: no fixes without root-cause investigation first.**

## Phase 1 — Investigate

1. Read errors/stack traces fully.
2. Reproduce reliably; document steps.
3. Check recent changes (`git log`, `git diff`, deps, config).
4. At each component boundary, gather evidence (logs/inputs/outputs) before guessing.
5. Trace bad values **up** to the source.

## Phase 2 — Pattern

- Seen before? Same class of bug? Environmental?

## Phase 3 — Hypotheses

- List 2–3 ranked hypotheses.
- Design the smallest check that falsifies each.

## Phase 4 — Fix

- Only after a hypothesis is confirmed.
- Prefer `tdd`: failing regression → fix → stay green.
- Add monitoring/logging only if needed to confirm.

## Output

Append findings to `artifacts/research/<slug>-bug.md` (repro, root cause, fix, verification).
