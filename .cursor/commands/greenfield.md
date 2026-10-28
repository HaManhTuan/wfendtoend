# /greenfield

Bootstrap a **new product** with cursor-workflow (full discover). Log **Cursor command: `/greenfield`** via `run-log`.

1. Run **`setup-project`** if `AGENTS.md` / `.cursor/skills/discover` is missing in this repo.
2. Deep **`discover`**: users, MVP, non-goals, stack, glossary seed — **one question per turn**, Q&A in research. No silent assumptions.
3. **`lock-scope`** for MVP only.
4. If more than one milestone, or product decisions are still open, stop and run **`wayfinder`** before a single plan.
5. **`write-plan`** + **`risk-assess`** + **`to-tickets`** (tracer-bullet vertical slices).
6. Optional: **`parallel-worktrees`** for independent foundation tickets. After the winner is merged, **integration verify**.
7. **`implement`** → **`dual-review`** → **`verify`** → **`ship`** if asked. **`/release`** only when an audience should receive the build.
8. End with **`retro`** after the first milestone. Include whether the success metric moved.

If the product is FE-heavy, after setup remind the user about `frontend-design` / `agent-browser` (see README).
