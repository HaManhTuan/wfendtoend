---
name: dual-review
description: >-
  Two-axis review of the diff: Standards (smells/conventions) and Spec (faithful to tickets).
  Use after implement slices and before ship; prefer parallel sub-agents.
---

# Dual review

Review the diff since a fixed point (ticket start commit, branch base, or `main`).

## Axis A — Standards

- Repo conventions, naming, error handling, security hygiene
- Fowler-style smells: long method, feature envy, shotgun surgery, etc.
- No secrets in diff

## Axis B — Spec

- Read originating `artifacts/specs/<slug>.md` + tickets
- Every Done-when covered?
- Out-of-scope creep?
- Missing tests for claimed behavior?

## Method

1. Prefer **two parallel sub-agents** (or two passes) so neither pollutes the other.
2. Merge results into `artifacts/reviews/<slug>.md` from `templates/REVIEW.md`.
3. Severity: blocker / should-fix / nit.
4. Fix blockers before `ship`.

## Do not

- Rubber-stamp “LGTM” without reading the Spec.
- Expand into unrelated refactors during review fixes unless user asks.
- Treat the security-hygiene bullet as an audit. Sensitive surfaces are gated in `verify` and `release`.
