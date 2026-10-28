# Tickets: Delivery gates

- **Slug:** `delivery-gates`
- **Plan:** `artifacts/plans/delivery-gates.md`

## Graph overview

```text
T1 → T2 → T3 → T4
```

## Ready frontier

- none — T1–T4 done

---

### T1 — Name the gates

- **Kind:** contract
- **Goal:** Glossary and SPEC template use Ship, Release, Acceptance evidence, Sensitive surface, Integration verify.
- **Done when:** those rows exist in `GLOSSARY.md`.
- **Files:** `GLOSSARY.md`, `templates/SPEC.md`
- **Blocked by:** —
- **Blocks:** T2
- **Parallel?** no
- **Status:** done

### T2 — Verify and release skills

- **Kind:** behavior
- **Goal:** Agents must write acceptance evidence and a release record.
- **Done when:** verify and release skills plus templates exist, and ship says it does not release.
- **Files:** `.cursor/skills/verify`, `.cursor/skills/release`, `.cursor/skills/ship`, `templates/VERIFY.md`, `templates/RELEASE.md`, `.cursor/commands/release.md`
- **Blocked by:** T1
- **Blocks:** T3
- **Parallel?** no
- **Status:** done

### T3 — Downstream skills and router

- **Kind:** behavior
- **Goal:** Tickets, worktrees, greenfield, retro, and the router follow the same gates.
- **Done when:** `AGENTS.md` lists `release` and the pipeline ends in ship then release.
- **Files:** tickets, risk, parallel, commands, rules, README, ask, setup, implement
- **Blocked by:** T2
- **Blocks:** T4
- **Parallel?** no
- **Status:** done

### T4 — Kit check

- **Kind:** observability
- **Goal:** One command proves the phrases stayed in place.
- **Done when:** `bash scripts/check-kit.sh` exits 0.
- **Files:** `scripts/check-kit.sh`
- **Blocked by:** T3
- **Blocks:** —
- **Parallel?** no
- **Status:** done
