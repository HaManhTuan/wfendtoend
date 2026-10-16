# AGENTS.md — cursor-workflow router

Read this first. Prefer a **Cursor slash** (`/feature`, `/greenfield`, `/bug`, `/ask`) as the human-visible entry, then follow **one** skill. Log phases with `run-log`.

## Quick router

| Situation | Invoke |
|-----------|--------|
| Unsure which skill | `/ask` → `ask-workflow` |
| First time in a repo | `setup-project` (then `/feature` or `/greenfield`) |
| New feature / behavior change | **`/feature`** → discover → … → implement |
| Greenfield product | **`/greenfield`** |
| Bug / regression | **`/bug`** → `diagnose` → `tdd` → `verify` |
| Vague idea / need interview only | `grill-me` or `discover` |
| Conversation already enough → formal SPEC | `to-spec` |
| Full SPEC, many tickets | `implement-spec` |
| Design uncertainty (UI/logic) | `prototype` then back to discover/scope |
| Epic / multi-session unknowns | `/wayfinder` → `wayfinder` |
| Inbox of issues | `/triage` → `triage` |
| Domain jargon drifting | `domain-modeling` |
| Docs/RFC/library question | `research` |
| Authorized app/binary/web investigation | `evidence-research` |
| Architecture deepening survey | `/architecture` → `improve-architecture` |
| Split / race agents | `parallel-worktrees` |
| Diff ready for critique | `dual-review` |
| Human-only infra/credentials steps | `wizard` |
| Confused by last message | `wait-what` |
| Need stakeholder answers async | `to-questionnaire` |
| Teaching (not shipping) | `/teach` → `teach` |
| Context ending / switch agent | `/handoff` → `handoff` |
| About to say done | `verify` → `ship` (uses `pr`) |
| Authoring skills/rules | `writing-for-agents` |
| Session ended; improve harness | `retro` |
| Audit trail row | `run-log` |

## Iron laws

1. **No production code before discover/grill + lock-scope** — unless user types `skip grill: …` (written waiver) or it is a one-line typo fix.
2. **No silent assumptions** — research needs a **Q&A log** or **Waiver** section.
3. **No “fixed/done” without verify evidence** (commands run, exit codes shown).
4. **One vertical slice at a time**; tidy only when green (`tidy-refactor`).
5. **Update `GLOSSARY.md`** when a domain term is coined or challenged (`domain-modeling`).
6. **Artifacts under `artifacts/`** — commit `*.md` there; hand off with `handoff`.
7. **Log the slash + skill** in `artifacts/reviews/<slug>-run-log.md` (`run-log`).
8. **Parallel agents only in isolated worktrees**.
9. **Authorized targets only** for `evidence-research`.

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
| Run log | `artifacts/reviews/<slug>-run-log.md` |
| Verify | `artifacts/reviews/<slug>-verify.md` |
| Handoff | `artifacts/handoffs/<slug>.md` |
| Questionnaire | `artifacts/research/<slug>-questionnaire.md` |
| Teach | `artifacts/teach/<topic-slug>/` |
| ADR | `docs/adr/NNNN-title.md` |

`<slug>` = short kebab-case task name (e.g. `shop-mvp`).

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
| `run-log` | Append slash/skill audit rows |
| `grilling` | Interview primitive |
| `domain-modeling` | Glossary + ADRs |
| `codebase-design` | Deep module vocabulary |
| `risk-assess` | Plan risks |
| `tdd` | Red-green-refactor (or build/smoke for static FE) |
| `tidy-refactor` | Cleanup while green |
| `diagnose` | Root-cause before fix |
| `research` | Cited primary-source research |
| `dual-review` | Standards ‖ Spec |
| `verify` | Run checks + evidence |
| `pr` | PR body shape |

**Invocation rule:** User-invoked may call model-invoked. User-invoked must **not** call other user-invoked unless this router says so (e.g. `implement-spec` → `implement` / `parallel-worktrees`; `discover` → `grilling` / `domain-modeling` / `run-log`; `ship` → `pr`).

## Default feature pipeline

```text
/feature or /greenfield
 → discover (grill + run-log) → lock-scope → write-plan → risk-assess → to-tickets
 → implement | implement-spec   (+ tdd, tidy-refactor)
 → dual-review → verify → ship → retro
```

## Parallel agents (Orca-lite)

Use `parallel-worktrees` when tickets are independent or you want a race. Human merges the winner.

## REA / reverse engineering

Only via `evidence-research`, authorized targets only. Output → `discover` / SPEC → normal build path.
