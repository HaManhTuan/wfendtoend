---
name: write-plan
description: >-
  Turn a locked SPEC/scope into a bite-sized implementation PLAN with verification steps.
  Use after lock-scope, before tickets or implement.
disable-model-invocation: true
---

# Write plan

Read SPEC + scope (+ research). Write `artifacts/plans/<slug>.md` from `templates/PLAN.md`. Fill every section, including the Risks table. Delete the EXAMPLE step.

## Required sections

1. **Task / scope** — slug + one-line goal
2. **Requirements traceability** — AC → plan steps
3. **Plan steps** — checkboxes, repo-relative files, no empty TBD
4. **Verification** — for each important step: **Run:** / **Expected:**
5. **Won't do / Later**
6. **Risks & open questions**

## Quality bar

A skilled developer with **zero** prior chat context could execute the plan.

## Risks

Run `risk-assess` before approval when the change touches data, auth, migrations, or public APIs.

## Gate

User approves plan → next: `to-tickets` (preferred) or `implement` for tiny work. Epics with unresolved decisions → `wayfinder` first.
