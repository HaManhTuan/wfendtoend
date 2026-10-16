# AGENTS.md — cursor-workflow router

Read this first. Pick **one** user-invoked skill, then follow it. Do not invent a parallel process.

## Quick router

| Situation | Invoke |
|-----------|--------|
| Unsure which skill | `ask-workflow` |
| First time in a repo | `setup-project` |
| Vague idea / need interview | `grill-me` or `discover` |
| Conversation already enough → formal SPEC | `to-spec` |
| New feature / behavior change | `discover` → `lock-scope` → `write-plan` (+ `risk-assess`) → `to-tickets` → `implement` |
| Full SPEC, many tickets | `implement-spec` |
| Greenfield product | slash `/greenfield` |
| Design uncertainty (UI/logic) | `prototype` then back to discover/scope |
| Epic / multi-session unknowns | `wayfinder` |
| Bug / regression | `diagnose` → `tdd` → `verify` |
| Inbox of issues | `triage` |
| Domain jargon drifting | `domain-modeling` |
| Docs/RFC/library question | `research` |
| Authorized app/binary/web investigation | `evidence-research` |
| Architecture deepening survey | `improve-architecture` |
| Split / race agents | `parallel-worktrees` |
| Diff ready for critique | `dual-review` |
| Human-only infra/credentials steps | `wizard` |
| Confused by last message | `wait-what` |
| Need stakeholder answers async | `to-questionnaire` |
| Teaching (not shipping) | `teach` |
| Context ending / switch agent | `handoff` |
| About to say done | `verify` → `ship` (uses `pr`) |
| Authoring skills/rules | `writing-for-agents` |
| Session ended; improve harness | `retro` |

## Iron laws

1. **No production code before discover/grill + lock-scope** (unless user says “skip grill” or it is a one-line typo fix).
2. **No “fixed/done” without verify evidence** (commands run, exit codes shown).
3. **One vertical slice at a time**; tidy only when green (`tidy-refactor`).
4. **Update `GLOSSARY.md`** when a domain term is coined or challenged (`domain-modeling`).
5. **Artifacts live under `artifacts/`** — never only in chat; hand off with `handoff`.
6. **Parallel agents only in isolated worktrees**.
7. **Authorized targets only** for `evidence-research`.

## Artifact map

| Phase | Write |
|-------|--------|
| Research / grill | `artifacts/research/<slug>.md` |
| Spec | `artifacts/specs/<slug>.md` |
| Scope | `artifacts/specs/<slug>-scope.md` or SPEC section |
| Plan | `artifacts/plans/<slug>.md` |
| Risks | plan section or `artifacts/plans/<slug>-risks.md` |
| Wayfinder | `artifacts/plans/<slug>-wayfinder.md` |
| Tickets | `artifacts/tickets/<slug>.md` |
| Review | `artifacts/reviews/<slug>.md` |
| Handoff | `artifacts/handoffs/<slug>.md` |
| Questionnaire | `artifacts/research/<slug>-questionnaire.md` |
| Teach | `artifacts/teach/<topic-slug>/` |
| ADR | `docs/adr/NNNN-title.md` |

`<slug>` = short kebab-case task name (e.g. `auth-refresh`).

## Skill catalog

### User-invoked (orchestrators)

| Skill | Role |
|-------|------|
| `ask-workflow` | Router |
| `setup-project` | Install kit into a repo |
| `grill-me` | Interview until decisions resolve |
| `discover` | Grill + research → SPEC |
| `to-spec` | Synthesize chat → SPEC (no new interview) |
| `lock-scope` | In/out + assumptions |
| `write-plan` | Implementation plan |
| `to-tickets` | Ticket graph |
| `implement` | Build one/few tickets |
| `implement-spec` | Whole SPEC via frontier |
| `parallel-worktrees` | Orca-lite isolation |
| `prototype` | Throwaway design probe |
| `wayfinder` | Multi-session decision map |
| `triage` | Issue inbox state machine |
| `improve-architecture` | Deepening survey |
| `evidence-research` | Authorized REA-style investigate |
| `to-questionnaire` | Async stakeholder questions |
| `wizard` | Human-only step script |
| `teach` | Multi-session teaching |
| `wait-what` | Re-pitch confusion |
| `handoff` | Compact for next agent |
| `ship` | Commit/PR after verify |
| `retro` | Improve harness |
| `writing-for-agents` | Author skills/rules well |

### Model-invoked (primitives)

| Skill | Role |
|-------|------|
| `grilling` | Interview primitive |
| `domain-modeling` | Glossary + ADRs |
| `codebase-design` | Deep module vocabulary |
| `risk-assess` | Plan risks |
| `tdd` | Red-green-refactor |
| `tidy-refactor` | Cleanup while green |
| `diagnose` | Root-cause before fix |
| `research` | Cited primary-source research |
| `dual-review` | Standards ‖ Spec |
| `verify` | Run checks + evidence |
| `pr` | PR body shape |

**Invocation rule:** User-invoked may call model-invoked. User-invoked must **not** call other user-invoked unless this router says so (e.g. `implement-spec` → `implement` / `parallel-worktrees`; `discover` → `grilling` / `domain-modeling`; `ship` → `pr`).

## Default feature pipeline

```text
discover (or grill-me → to-spec)
  → lock-scope → write-plan → risk-assess → to-tickets
  → implement | implement-spec   (+ tdd, tidy-refactor)
  → dual-review → verify → ship → retro
```

## Parallel agents (Orca-lite)

Use `parallel-worktrees` when tickets are independent or you want a race. Human merges the winner.

## REA / reverse engineering

Only via `evidence-research`, authorized targets only. Output → `discover` / SPEC → normal build path.
