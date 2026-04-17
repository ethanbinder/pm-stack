# PM Stack

### Hey, I'm Ethan Binder 👋

A founder at GoPeer ([acquired](https://www.linkedin.com/posts/ethan-binder_proud-to-announce-that-imagine-learning-has-activity-6968201533150654464-a7Fe?utm_source=share&utm_medium=member_desktop)), Forbes [30 Under 30](https://www.linkedin.com/posts/ethan-binder_forbesunder30-activity-7135339792417898496-x0RR?utm_source=share&utm_medium=member_desktop), and Senior Product Manager at [Roblox](https://www.linkedin.com/posts/ethan-binder_after-8-eventful-years-i-hung-up-my-gopeer-activity-7247295183929659394-OuqJ?utm_source=share&utm_medium=member_desktop) — energized by building products that create user value and move business metrics. Acquisition. Engagement. Monetization. Retention.

PM Stack is built to help teams ship high-quality products faster — while staying aligned around a shared goal as they scale up + out.

---

> Claude Code skills for PMs who build and ship code.

Built for **PM Builders** — PM Stack gives product managers a virtual team inside Claude Code. Thirteen specialized skills that cover the full product lifecycle — from writing a strategic one-pager to shipping a production PR.

## The PM Builder Workflow

```
Think → Plan → Build → Review → Test → Ship → Reflect
```

| Phase | Skill | What It Does |
|-------|-------|-------------|
| **Start** | `/start` | Run this on a fresh session. Asks what you're building, then routes you into one of two lanes: **0 → 1** (full strategy stack — `/office-hours`, `/product-doc`, `/eng-manager` — before any code) or **fast iteration** (straight to `/engineer`, `/qa`, `/pr-comments`, or `/release`). No spec or one-pager required for the fast lane |
| **Think** | `/office-hours` | First step of the 0 → 1 lane. Three strategic framing questions (Wand Wave, Gap Scan, Strategic Bet) plus six forcing questions reframe your product, challenge premises, and generate alternatives. Produces a design doc that feeds every downstream skill |
| **Think** | `/product-doc` | Strategic One Pager — align on the “why”: problem and success (first principles) |
| **Think** | `/data-insights` | Data-first analysis — DS Analysis, UX research, raw feedback, market research; validates/supports the one-pager before planning. Starts by asking for your questions, raw data, and context |
| **Plan** | `/product-doc` | Full product doc with 10 structured tabs: Strategic One Pager, Product Spec, Design Brief, Eng Design Spec, Eng Estimates, QA Spec, Experimentation Plan, Critical Launch Checklist, GTM Plan, and Notes. Output as Markdown files or a single Google Doc with native document tabs |
| **Plan** | `/deck` | Strategic slide deck for presentations — output as `.pptx` or Google Slides |
| **Plan** | `/eng-manager` | Architecture, system design, FE/BE split, data flow, edge cases, test strategy, observability, rollout |
| **Build** | `/designer` | Design consistency, component reuse, accessibility |
| **Build** | `/engineer` | Write code, find production bugs, auto-fix |
| **Review** | `/security` | OWASP audit, secrets scan, auto-fix, risk report |
| **Review** | `/pr-comments` | Respond to PR reviewer feedback — fixes what it agrees with, pushes back on what it doesn't, always invites live discussion |
| **Test** | `/qa` | Adversarial testing, bug fixes, test coverage |
| **Ship** | `/release` | Sync, test, push, open a structured PR |
| **Reflect** | `/memory` | Save and search learnings across sessions |

*`/product-doc` spans two phases (Think and Plan), so the table has 14 rows for 13 unique skills.*

## Quick Start

**Install:**

```bash
git clone https://github.com/ethanbinder/pm-stack.git ~/.pm-stack
```

**Use in any project** by adding to your `.claude/settings.json`:

```json
{
  "permissions": {
    "additionalDirectories": ["~/.pm-stack/skills"]
  }
}
```

Or one-shot:

```bash
claude --add-dir ~/.pm-stack/skills
```

**Try it:**

```
/product-doc    → Create a complete product document
/engineer       → Write production code
/release        → Ship a PR
```

**First session:** open Claude Code in any project with PM Stack on the path and Claude will ask what you're building, then offer two lanes — 0 → 1 (full strategy stack) or fast iteration (straight to a production-ready PR).

## Skills

### Start

**`/start`** — The entry point when you open a new session in a PM Stack project. Asks what you're building in one or two sentences, then forks you into one of two lanes: **0 → 1** — a new bet that needs strategic framing, a one-pager, a product spec, and eng design; routes to `/office-hours`, then `/product-doc` (Strategic One Pager → full product spec), then `/eng-manager` before any `/engineer` work. **Fast iteration** — you already know what to ship; routes straight to `/engineer`, `/qa`, `/pr-comments`, or `/release`. Infers the lane when the reply already signals it; only re-asks when genuinely ambiguous. Re-invoke mid-session if you pivot.

### Strategy

**`/office-hours`** — First step of the 0 → 1 lane. The `/start` skill routes you here when you're building a new bet. Three strategic framing questions (Wand Wave — 2/5/10-year vision; Gap Scan — where status quo falls short of vision; Strategic Bet — what this initiative uniquely unlocks) followed by six forcing questions (Demand Reality, Status Quo, Desperate Specificity, Narrowest Wedge, Observation & Surprise, Future-Fit) pressure-test your framing before a line of code. Pushes back on vague answers, generates 2–3 implementation alternatives scored against the Strategic Bet, and makes you pick a scope mode — Expansion, Selective Expansion, Hold Scope, or Reduction. Output: `product-doc/00-office-hours.md`, a design doc that every downstream skill reads as context.

**`/product-doc`** — Create a complete product document with 10 tabs: Strategic One Pager, Product Spec, Design Brief, Eng Design Spec, Eng Estimates, QA Spec, Experimentation Plan, Critical Launch Checklist, GTM Plan, and Notes. Choose your output at invocation: well-formatted markdown files in a `product-doc/` directory, or a single Google Doc (Pageless) with each tab as a native Google Docs document tab — via the Google Drive connector in Claude Chat/Cowork or the Google Drive MCP server in Claude Code. See [Google Workspace setup](docs/google-workspace-setup.md) if you need to wire up a connector.

**`/data-insights`** — Bring data-first thinking into the Think phase. Starts by asking for the questions you want answered, any raw data or exports you already have, and any other context — then analyzes DS analysis, UX research, raw user feedback, and market research to validate/support the strategic one pager before planning begins. Produces an insights brief (`product-doc/01b-data-insights.md`) with synthesized findings, confidence levels, assumption checks, and data gaps.

**`/deck`** — Build a strategic slide deck. Choose your output at invocation: a real `.pptx` file, or a Google Slides deck in your Drive — via the Google Drive connector in Claude Chat/Cowork or the Google Drive MCP server in Claude Code. Adapts to your audience — exec review, board presentation, or team standup. Default structure: Problem → Vision → Solution → Why Now → Prototype → Metrics → Ask. See [Google Workspace setup](docs/google-workspace-setup.md) if you need to wire up a connector.

### Engineering

**`/eng-manager`** — Lock in architecture and system design before writing code. Reads your codebase and related codebases, decides the frontend/backend split, and produces architecture diagrams (mermaid), data flow, API contracts, edge case analysis, test strategy, observability plan, and rollout strategy. Ensures new work is consistent with existing patterns and defensible at 10× scale.

**`/designer`** — Audit UI against existing components and design system. Ensures new interfaces reuse existing patterns before introducing new ones. Checks accessibility, responsive behavior, and design consistency. Provides specific component paths and implementation guidance.

**`/engineer`** — Write production code following existing codebase conventions. After writing, self-reviews for bugs that pass CI but break in production: race conditions, stale closures, missing error handling, memory leaks. Auto-fixes obvious issues, flags ambiguous ones.

**`/qa`** — Test with an adversarial mindset. Runs existing tests, writes new ones for uncovered paths, tries edge cases and error paths. Fixes bugs it finds, writes regression tests, and produces a confidence-rated test report.

**`/security`** — OWASP Top 10 review against your codebase. Scans for exposed secrets, audits dependencies for known CVEs, checks auth boundaries. Auto-fixes safe issues (gitignore, input sanitization). Produces a severity-rated security report for anything that needs human judgment.

**`/pr-comments`** — Respond to reviewer feedback on your open PRs. Reads inline and summary comments, classifies each as Agree / Partial / Disagree / Needs-human, and previews a plan before touching GitHub. Implements the fixes it agrees with in a single batched commit, pushes back on the ones it doesn't with specific reasoning, and always signs replies as "{Name}'s coding agent" — inviting live discussion whenever it disagrees.

**`/release`** — Sync with main, run the full check suite (lint, types, tests, build), push, and open a PR with structured format: Problem, Solution, Changes Made, and Before/After screenshots.

### Meta

**`/memory`** — Manage what PM Stack has learned about your project across sessions. Add patterns, pitfalls, preferences, and decisions. Search prior learnings. Review and prune to keep knowledge fresh. Learnings compound — PM Stack gets smarter on your codebase over time.

## Philosophy

- **Clean over clever.** Every skill is a self-contained markdown file. No build step, no binaries, no template generation, no compiled dependencies.
- **PM workflow over eng workflow.** Skills are organized around the product lifecycle (Think → Plan → Build → Review → Test → Ship → Reflect), not the engineering workflow.
- **Reuse first.** Every skill checks for existing patterns, components, and conventions before introducing new ones. Your codebase already has opinions — PM Stack respects them.
- **Ship quality.** Every output — whether a product doc, a slide deck, or a code change — should be production-ready. No placeholder text, no half-finished implementations.

Inspired by [gstack](https://github.com/garrytan/gstack), focused on the PM Builder.

## Contributing

PM Stack is open source under the MIT license. Contributions are welcome.

To add a new skill:
1. Create a new directory under `skills/` with your skill name
2. Add a `SKILL.md` following the format of existing skills (YAML frontmatter with `name` and `description`, then structured markdown)
3. Reference `references/pm-preamble.md` for shared context
4. Open a PR

## License

[MIT](LICENSE)
