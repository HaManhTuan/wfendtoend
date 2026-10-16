---
name: evidence-research
description: >-
  Investigate how authorized software works; cite evidence and limitations; feed into discover/SPEC.
  Use for REA-style learning from apps/binaries/websites you own or may analyze.
disable-model-invocation: true
---

# Evidence research

Learn *how something works* with cited evidence, then rebuild via the normal pipeline.

## Authorization gate

Only proceed if the user confirms they **own** the target or are **authorized** to analyze it. If unclear → stop.

Refuse illegal/unauthorized cracking, credential theft, or exploit development.

## Method (REA-inspired)

1. **One question** — e.g. “How does search ranking work in this app?”
2. **Inspect** — use available tools (browser MCP, source, docs, REA MCP if installed, HAR, etc.).
3. **Evidence** — every claim needs a pointer (file, symbol, screenshot path, request id).
4. **Unknowns** — list what you could not prove.
5. **Limits** — obfuscation, missing symbols, dynamic-only behavior.

## Output

Write `artifacts/research/<slug>-evidence.md`:

```markdown
# Evidence: <question>
## Target
## Authorization
## Method & tools
## Findings (with evidence)
## Unknowns
## Suggested rebuild approach
## Feed into SPEC
```

## Next

Hand off to `discover` / SPEC — **do not** jump straight to a full reimplementation without scope lock.
