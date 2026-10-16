# GLOSSARY

Shared language for humans and agents. Prefer these terms in code, tickets, and chat.

| Term | Meaning | Avoid saying |
|------|---------|--------------|
| **Discover** | Grilling + research until intent is clear | “just start coding” |
| **Grill** | Relentless clarifying interview | vague “any thoughts?” |
| **Spec** | Locked description of *what* to build | vague chat summary |
| **Scope lock** | Explicit in/out + assumptions | “we’ll see later” |
| **Plan** | Ordered implementation steps with verification | wish list |
| **Ticket** | Tracer-bullet work item with blocking edges | mega-task |
| **Ready frontier** | Tickets whose blockers are all done | random pick from backlog |
| **Slice** | Smallest vertical deliverable that can be verified | huge PR |
| **Seam** | Clean module boundary you design/test against | “utils dump” |
| **Deep module** | Lots of behavior behind a small interface | shallow wrapper soup |
| **Wayfinder** | Decision map for work bigger than one session | one giant PLAN |
| **Prototype** | Disposable probe to answer a design question | shipping the spike |
| **Standards review** | Diff vs coding standards / smells | “LGTM” |
| **Spec review** | Diff vs originating Spec/tickets | style-only review |
| **Evidence** | Command output / test result proving a claim | “should work” |
| **Worktree race** | Parallel agents, isolated checkouts, pick winner | shared dirty tree |
| **Handoff** | Compact artifact for the next agent/session | “continue somehow” |
| **Run log** | Append-only audit of slash + skill + outcome | invisible freestyle chat |
| **Skip-grill waiver** | User-typed `skip grill: …` recorded in research | silent assumptions |
| **ADR** | Architecture Decision Record | tribal memory only |
| **Retro** | Improve agent harness after a session | ignore friction |
| **Tidy** | Refactor while green; no new behavior | drive-by rewrite |

## Project-specific terms

_Add terms as you discover them. Keep definitions one sentence._

| Term | Meaning | Notes / ADR |
|------|---------|-------------|
| _(example)_ Checkout | Cart → payment handoff | see `docs/adr/0001-…` |
