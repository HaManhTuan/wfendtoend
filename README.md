# cursor-workflow

Independent A→Z software workflow for **Cursor** (and other coding agents).

Inspired by [mattpocock/skills](https://github.com/mattpocock/skills), [stablyai/orca](https://github.com/stablyai/orca), and [morluto/rea](https://github.com/morluto/rea) — rewritten as a self-contained kit with **no Kaopiz DevKit / `.vibe` dependency**.

## What you get

| Layer | Path | Role |
|-------|------|------|
| Router | `AGENTS.md` | Which skill to use when |
| Rules | `.cursor/rules/` | Always-on discipline |
| Skills | `.cursor/skills/` | Full catalog (see `AGENTS.md`) |
| Commands | `.cursor/commands/` | Slash entry points |
| Artifacts | `artifacts/` | Spec / plan / tickets / evidence |
| Domain | `GLOSSARY.md` + `docs/adr/` | Shared language |

## Pipeline

```
setup → discover/grill → lock-scope → write-plan → risk-assess → to-tickets
  → implement | implement-spec  (+ tdd, tidy-refactor)
  → dual-review → verify → ship (pr) → retro
```

Side paths: `prototype`, `wayfinder`, `triage`, `improve-architecture`, `research`, `evidence-research`, `parallel-worktrees`, `handoff`, `wizard`, `teach`, …

---

## Setup guide (do this in order)

### 1. Install this kit into your app repo

The installer is **merge-safe by default**: it never overwrites your files. Conflicts are skipped and listed; use `--force` only when you intend to replace (automatic backup first).

```bash
# From this kit (or a clone of HaManhTuan/wfendtoend)
./scripts/install-to-project.sh /path/to/your-app

# Preview first
./scripts/install-to-project.sh /path/to/your-app --dry-run

# Minimal footprint — only .cursor/{rules,skills,commands}
./scripts/install-to-project.sh /path/to/your-app --cursor-only

# Replace conflicts (backs up to .wfendtoend-backup/<timestamp>/)
./scripts/install-to-project.sh /path/to/your-app --force

# Live-link new skills/rules/commands into the kit (power users)
./scripts/install-to-project.sh /path/to/your-app --symlink
```

| What gets installed | `--full` (default) | `--cursor-only` |
|---------------------|--------------------|-----------------|
| `.cursor/rules`, `skills`, `commands` | yes | yes |
| `AGENTS.md` | yes if missing; if yours exists → kit saved as `docs/agents/AGENTS.wfendtoend.md` | same tip if `AGENTS.md` exists |
| `GLOSSARY.md`, `artifacts/`, `templates/`, `docs/agents/` | yes | no (except agents tip/note) |
| Manifest | `.cursor/wfendtoend-manifest.json` | same |

**Conflict policy**

- Same path, different content → **skip** (keep yours) unless `--force`
- Identical content → no-op (`identical` in summary)
- `--force` → copy yours into `.wfendtoend-backup/…`, then overwrite
- Add `.wfendtoend-backup/` to the app `.gitignore`

Open **your-app** in Cursor afterwards. Check `docs/agents/cursor-workflow-install.md` for the install report.

### 2. Add `find-skills` (recommended — once per machine)

This is a **meta-skill** from Vercel: when you ask “is there a skill for X?”, the agent can search [skills.sh](https://www.skills.sh/) and suggest installs.

Install at **user / global** level (all projects), **not** into this kit’s core:

```bash
npx skills add https://github.com/vercel-labs/skills --skill find-skills
```

If the CLI offers a global / user scope flag, prefer that (e.g. `-g`) so every repo can use it.

**How to use**

- In Cursor chat: *“find a skill for React performance”* or *“is there a skill for PR reviews?”*
- Or yourself in a terminal:

```bash
npx skills find react performance
npx skills find pr review
```

Browse the leaderboard first: [https://www.skills.sh/](https://www.skills.sh/). Prefer high install counts and known owners (`vercel-labs`, `anthropics`, `mattpocock`, …).

**Rule of thumb:** anything you install this way is **stack / tool layer** for that machine or that app. Do **not** copy random skills into `cursor-workflow` core.

### 3. Optional — browser automation (web / UI projects only)

For click/fill/screenshot/QA in a real browser, add [agent-browser](https://www.skills.sh/vercel-labs/agent-browser/agent-browser) **on the app repo** (or user-global if you always do UI work):

```bash
npm i -g agent-browser && agent-browser install
npx skills add https://github.com/vercel-labs/agent-browser --skill agent-browser
```

Before browser work, the agent should load:

```bash
agent-browser skills get core
# or full reference:
agent-browser skills get core --full
```

Use it from `prototype`, `verify` (UI smoke), or `diagnose` (repro in the browser). Skip this step for pure API/backend repos.

### 4. Optional — frontend design skills (FE / UI apps only)

These are **stack-layer** skills. Install on the **app repo** (or user-global if every project is UI). Do **not** copy them into `cursor-workflow` core.

They plug into existing phases: `prototype` → design direction → `/feature` implement → `verify` / `agent-browser` for visual check.

#### Pick by goal

| Goal | Install | Notes |
|------|---------|--------|
| Most popular (skills.sh installs) | [anthropics/skills@frontend-design](https://www.skills.sh/anthropics/skills/frontend-design) | ~993K installs; repo [anthropics/skills](https://github.com/anthropics/skills) ~181K★ — aesthetic direction, avoid generic AI UI |
| Strong “taste” + browser check | [leonxlnx/taste-skill@design-taste-frontend](https://www.skills.sh/leonxlnx/taste-skill/design-taste-frontend) | ~619K installs; repo ~98K★ |
| High stars, multi-platform UX | [nextlevelbuilder/ui-ux-pro-max-skill](https://www.skills.sh/nextlevelbuilder/ui-ux-pro-max-skill/ui-ux-pro-max) | ~398K installs; repo ~136K★ |
| Vercel web guidelines | [vercel-labs/agent-skills@web-design-guidelines](https://www.skills.sh/vercel-labs/agent-skills/web-design-guidelines) | ~742K installs |
| Wireframe → you pick → build (designer flow) | [evondev/evondevKit](https://github.com/evondev/evondevKit) (`ui-ux`) | Fewer installs/★; brief + 2–3 wireframes + uses your components |
| Design language for agents | [pbakaus/impeccable@frontend-design](https://www.skills.sh/pbakaus/impeccable/frontend-design) | ~53K installs; repo ~82K★ |

`prototype` in this kit already covers throwaway UI probes — you do **not** need Matt’s separate `prototype` skill.

#### Commands (run in the app repo)

```bash
# Default recommendation — most installed FE design skill
npx skills add anthropics/skills --skill frontend-design

# Taste / non-generic AI look
npx skills add leonxlnx/taste-skill --skill design-taste-frontend

# Broader UI/UX intelligence
npx skills add nextlevelbuilder/ui-ux-pro-max-skill --skill ui-ux-pro-max

# Vercel guidelines
npx skills add vercel-labs/agent-skills --skill web-design-guidelines

# Wireframe gate (evondev-style)
npx skills add evondev/evondevKit -a cursor
# then in Cursor: /ui-ux Build an orders list…
```

#### Suggested combo for a serious FE app

```bash
npx skills add anthropics/skills --skill frontend-design
npx skills add leonxlnx/taste-skill --skill design-taste-frontend   # optional second taste layer
# plus step 3 (agent-browser) for visual verify
# plus evondevKit only if you want mandatory wireframe approval
```

Re-check popularity anytime:

```bash
npx skills find frontend design
npx skills find ui-ux
```

### 5. Optional — stack overlays (per language / framework)

Core skills stay language-agnostic. Per project, add:

- `.cursor/rules/90-<stack>.mdc` — conventions, test/lint commands
- `.cursor/skills/stack.<name>/` — how to write tests, folder layout, etc.

Discover stack skills via `find-skills` / `npx skills find laravel` (or react, go, …), then install into **that app**, not into this kit.

### 6. What not to install into core

| Skill | Why skip for core |
|-------|-------------------|
| `mattpocock/skills` → `grill-with-docs` | Already covered by `grilling` + `domain-modeling` here — adding it duplicates the router |
| FE design skills above | App / user scope only — keep this kit process-only |
| Random one-off skills | Keep them in the **app** or **user** scope; keep this kit the A→Z process only |

---

## Use in Cursor

| Intent | Slash / action |
|--------|----------------|
| Feature | `/feature` |
| Bug | `/bug` |
| Greenfield | `/greenfield` |
| Router (in-kit) | `/ask` |
| Find external skills | ask the agent / `npx skills find …` (needs step 2) |
| Handoff | `/handoff` |
| Triage | `/triage` |
| Epic map | `/wayfinder` |
| Architecture survey | `/architecture` |
| Prototype | `/prototype` |
| Teach | `/teach` |

## Layers at a glance

```text
┌─────────────────────────────────────────┐
│  User global (optional)                 │
│  find-skills, agent-browser,            │
│  frontend-design / taste-skill          │
├─────────────────────────────────────────┤
│  App repo                               │
│  cursor-workflow core (this kit)        │
│  + stack rules/skills                   │
│  + FE design / ui-ux (step 4)           │
│  + optional agent-browser, evondevKit   │
└─────────────────────────────────────────┘
```

- **`ask-workflow` / `/ask`** → which skill **inside this kit**
- **`find-skills`** → which skill **on skills.sh** to install next
- **FE design skills (step 4)** → how UI should look; still follow discover → plan → implement

## Design principles

1. Grill before code  
2. Artifacts over chat memory  
3. TDD as the execute loop  
4. Two-axis review (Standards ‖ Spec)  
5. Evidence before “done”  
6. Parallel only with worktree isolation  
7. Glossary + ADRs for shared language  
8. Core process stays language-agnostic; stack is an overlay  

## License

MIT — see `ATTRIBUTION.md` for upstream inspiration.
