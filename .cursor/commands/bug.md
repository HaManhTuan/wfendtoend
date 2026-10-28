# /bug

Debug and fix using cursor-workflow.

1. Read `AGENTS.md`.
2. Run **`diagnose`** — no fix before root cause.
3. Capture notes in `artifacts/research/<slug>-bug.md`.
4. Fix with **`tdd`** (failing regression first).
5. **`verify`**. The acceptance row is the regression check named in the bug note. Then **`ship`** if asked. **`/release`** only when users should receive the fix.
