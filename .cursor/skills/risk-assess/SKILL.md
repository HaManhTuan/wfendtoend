---
name: risk-assess
description: >-
  While drafting or refining a plan, identify dependencies, breaking changes, performance and
  security impacts. Use during write-plan or before implement-spec.
---

# Risk assess

## Steps

1. Read SPEC + draft PLAN.
2. Fill a **Risks** section (or `artifacts/plans/<slug>-risks.md`):

| Risk | Likelihood | Impact | Mitigation | Owner |
|------|------------|--------|------------|-------|
| | L/M/H | L/M/H | | |

3. Cover at least: data migrations, authz, backwards compatibility, perf hotspots, third-party outages, rollback.
4. Feed mitigations back into plan steps / tickets (don’t leave risks orphaned).

## Gate

Blocky risks (H/H) need an explicit plan step or an accepted waiver from the user.
