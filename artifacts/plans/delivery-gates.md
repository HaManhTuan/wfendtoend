# PLAN: Delivery gates

- **Slug:** `delivery-gates`
- **SPEC:** `artifacts/specs/delivery-gates.md`
- **Status:** approved

## Task / scope

Teach the kit that git delivery and audience delivery are different gates, and that verify must show acceptance evidence.

## Requirements traceability

| Requirement / AC | Plan step |
|------------------|-----------|
| Glossary terms | S1 |
| Verify + template | S2 |
| Release skill, template, command | S3 |
| Ship wording | S4 |
| Ticket kinds | S5 |
| Integration verify, wayfinder, retro | S6 |
| Router, rules, README | S7 |
| check-kit.sh exits 0 | S8 |

## Plan steps

- [x] **S1** — Glossary terms  
  - Files: `GLOSSARY.md`  
  - **Run:** `grep -n "Release" GLOSSARY.md`  
  - **Expected:** Ship and Release are separate rows

- [x] **S2** — Verify acceptance map  
  - Files: `.cursor/skills/verify/SKILL.md`, `templates/VERIFY.md`, `templates/SPEC.md`  
  - **Run:** `scripts/check-kit.sh`  
  - **Expected:** acceptance phrases present

- [x] **S3** — Release gate  
  - Files: `.cursor/skills/release/SKILL.md`, `.cursor/commands/release.md`, `templates/RELEASE.md`  
  - **Run:** `test -f .cursor/commands/release.md`  
  - **Expected:** exit 0

- [x] **S4** — Ship does not release  
  - Files: `.cursor/skills/ship/SKILL.md`, `.cursor/skills/implement/SKILL.md`, `.cursor/skills/implement-spec/SKILL.md`  
  - **Expected:** ship text says it does not release

- [x] **S5** — Ticket kinds  
  - Files: `templates/TICKETS.md`, `.cursor/skills/to-tickets/SKILL.md`, `.cursor/skills/risk-assess/SKILL.md`  
  - **Expected:** Kind field documented

- [x] **S6** — Integration, greenfield, retro, dual-review note  
  - Files: parallel-worktrees, greenfield, retro, dual-review, feature, bug  
  - **Expected:** integration verify and wayfinder trigger named

- [x] **S7** — Router and README  
  - Files: `AGENTS.md`, rules `00`, `10`, `20`, `README.md`, `ask-workflow`, `setup-project`  
  - **Expected:** pipeline shows release after ship

- [x] **S8** — Kit check  
  - Files: `scripts/check-kit.sh`  
  - **Run:** `bash scripts/check-kit.sh`  
  - **Expected:** exit 0

## Won't do / Later

- Universal deploy automation.
- Estimating and incident management.

## Risks & open questions

| Risk | Likelihood | Impact | Mitigation | Owner |
|------|------------|--------|------------|-------|
| Old installs miss new files | M | M | README says reinstall | kit |
| Agents still say “shipped to prod” | M | H | Iron line in always-on rule | kit |

Sensitive surface: none. Rollback: revert the commit; no data migration.
