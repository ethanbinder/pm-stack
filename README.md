# PM Stack

### Hey, I'm Ethan Binder 👋

A founder at GoPeer ([acquired](https://www.linkedin.com/posts/ethan-binder_proud-to-announce-that-imagine-learning-has-activity-6968201533150654464-a7Fe?utm_source=share&utm_medium=member_desktop)), Forbes [30 Under 30](https://www.linkedin.com/posts/ethan-binder_forbesunder30-activity-7135339792417898496-x0RR?utm_source=share&utm_medium=member_desktop), and Senior Product Manager at [Roblox](https://www.linkedin.com/posts/ethan-binder_after-8-eventful-years-i-hung-up-my-gopeer-activity-7247295183929659394-OuqJ?utm_source=share&utm_medium=member_desktop) — energized by building products that create user value and move business metrics. Acquisition. Engagement. Monetization. Retention.

PM Stack is built to help teams ship high-quality products faster — while staying aligned around a shared goal as they scale up + out.

---

> Claude Code skills for PMs who build and ship code.

PM Stack gives product managers a virtual team inside Claude Code. Nine specialized skills that cover the full product lifecycle — from writing a strategic one-pager to shipping a production PR.

Built for **PM Builders** — product managers who don't just write specs, they write code. You prototype your own features, ship your own PRs, and review your own deploys. PM Stack is built from the conviction that the best PMs don't just define products — they build them. The tools should match the ambition.

## The PM Builder Workflow

```
Think → Plan → Build → Review → Test → Ship → Reflect
```

| Phase | Skill | What It Does |
|-------|-------|-------------|
| **Think** | `/product-doc` | Strategic One Pager — problem, vision, goals |
| **Plan** | `/product-doc` | Full product doc with 10 structured tabs |
| **Plan** | `/deck` | Strategic slide deck for presentations |
| **Plan** | `/eng-manager` | Architecture, data flow, edge cases, test strategy |
| **Build** | `/designer` | Design consistency, component reuse, accessibility |
| **Build** | `/engineer` | Write code, find production bugs, auto-fix |
| **Review** | `/security` | OWASP audit, secrets scan, auto-fix, risk report |
| **Test** | `/qa` | Adversarial testing, bug fixes, test coverage |
| **Ship** | `/release` | Sync, test, push, open a structured PR |
| **Reflect** | `/memory` | Save and search learnings across sessions |

*`/product-doc` spans two phases (Think and Plan), so the table has 10 rows for 9 unique skills.*

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

## Skills

### Strategy

**`/product-doc`** — Create a complete product document with 10 tabs: Strategic One Pager, Product Spec, Design Brief, Eng Design Spec, Eng Estimates, QA Spec, Experimentation Plan, Critical Launch Checklist, GTM Plan, and Notes. Works with Google Docs MCP for native doc creation, or generates markdown files as a fallback.

**`/deck`** — Build a strategic slide deck as a real .pptx file. Adapts to your audience — exec review, board presentation, or team standup. Default structure: Problem → Vision → Solution → Why Now → Prototype → Metrics → Ask.

### Engineering

**`/eng-manager`** — Lock in architecture before writing code. Reads your codebase, produces architecture diagrams (mermaid), data flow documentation, API contracts, edge case analysis, and test strategy. Ensures new work is consistent with existing patterns.

**`/designer`** — Audit UI against existing components and design system. Ensures new interfaces reuse existing patterns before introducing new ones. Checks accessibility, responsive behavior, and design consistency. Provides specific component paths and implementation guidance.

**`/engineer`** — Write production code following existing codebase conventions. After writing, self-reviews for bugs that pass CI but break in production: race conditions, stale closures, missing error handling, memory leaks. Auto-fixes obvious issues, flags ambiguous ones.

**`/qa`** — Test with an adversarial mindset. Runs existing tests, writes new ones for uncovered paths, tries edge cases and error paths. Fixes bugs it finds, writes regression tests, and produces a confidence-rated test report.

**`/security`** — OWASP Top 10 review against your codebase. Scans for exposed secrets, audits dependencies for known CVEs, checks auth boundaries. Auto-fixes safe issues (gitignore, input sanitization). Produces a severity-rated security report for anything that needs human judgment.

**`/release`** — Sync with main, run the full check suite (lint, types, tests, build), push, and open a PR with structured format: Problem, Solution, Changes Made, and Before/After screenshots.

### Meta

**`/memory`** — Manage what PM Stack has learned about your project across sessions. Add patterns, pitfalls, preferences, and decisions. Search prior learnings. Review and prune to keep knowledge fresh. Learnings compound — PM Stack gets smarter on your codebase over time.

## Google Docs Integration (Optional)

The `/product-doc` skill can create native Google Docs with tabs if you have a Google Docs MCP server configured. Without it, the skill generates well-formatted markdown files instead.

See [docs/google-docs-setup.md](docs/google-docs-setup.md) for setup instructions.

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
