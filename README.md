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
| **Start** | `/start` | Run this on a fresh session. Asks what you're building, then routes you into one of two lanes: **0 → 1** (full strategy stack — `/office-hours`, `/product-doc`, `/eng-manager` — before any code) or **fast iteration** (straight to any non-framing skill — `/engineer`, `/designer`, `/eng-manager`, `/qa`, `/security`, `/pr-comments`, `/release`, `/memory`). No spec or one-pager required for the fast lane |
| **Think** | `/office-hours` | First step of the 0 → 1 lane. Three strategic framing questions (Wand Wave, Gap Scan, Strategic Bet) in one batched prompt, then six forcing questions in two rounds of three, reframe your product, challenge premises, and generate alternatives. Advisor recommends a scope mode up front. Repeat asks can be silenced per-user via `/memory tune`. Produces a design doc that feeds every downstream skill |
| **Think** | `/product-doc` | Strategic One Pager — align on the “why”: problem and success (first principles) |
| **Think** | `/data-insights` | Data-first analysis — DS Analysis, UX research, raw feedback, market research; validates/supports the one-pager before planning. Starts by asking for your questions, raw data, and context |
| **Plan** | `/product-doc` | Full product doc with 10 structured tabs: Strategic One Pager, Product Spec, Design Brief, Eng Design Spec, Eng Estimates, QA Spec, Experimentation Plan, Critical Launch Checklist, GTM Plan, and Notes. Output as Markdown files, a single Google Doc with native document tabs, or — for the Strategic One Pager, Product Spec, Experimentation Plan, and Critical Launch Checklist specifically — Confluence pages via the `confluence` CLI, plus a per-project Canonical Doc that aggregates links to every per-run page, plus an opt-in team **Roadmap** that aggregates projects across quarters |
| **Plan** | `/deck` | Strategic slide deck for presentations — output as `.pptx` or Google Slides |
| **Plan** | `/eng-manager` | Architecture, system design, FE/BE split, data flow, edge cases, test strategy, observability, rollout — and a durable tech-plan markdown artifact written to `product-doc/04b-tech-plan.md`. Two modes: full (substantive features) or small (`--small`, auto-populated from the diff for trivial PRs) |
| **Build** | `/designer` | Design consistency, component reuse, accessibility |
| **Build** | `/engineer` | Write code, find production bugs, auto-fix |
| **Review** | `/security` | OWASP audit, secrets scan, auto-fix, risk report |
| **Review** | `/pr-comments` | Respond to PR reviewer feedback — fixes what it agrees with, pushes back on what it doesn't, always invites live discussion |
| **Test** | `/qa` | Adversarial testing, bug fixes, test coverage |
| **Ship** | `/release` | Sync, test, push, open a structured PR |
| **Reflect** | `/memory` | Save and search learnings across sessions. Also tunes per-question interruption preferences (`/memory tune <id> never-ask`) so routine asks get auto-decided with an inline annotation instead of re-interrupting |

*`/product-doc` spans two phases (Think and Plan), so the table has 14 rows for 13 unique skills.*

## Quick Start

### 1. Pick a home for your repos (recommended)

The simplest setup is to keep all your work in one parent folder. If you don't already have one, create a `Development/` folder somewhere convenient:

```bash
mkdir -p ~/Desktop/Development
cd ~/Desktop/Development
```

Why: PM Stack works no matter where you clone it, but keeping all your repos under one parent folder means PM Stack lives next to the projects it supports, you can grep across them easily, and the auto-sync hook (step 3 below) keeps everything pointed at one stable location.

### 2. Clone PM Stack

```bash
git clone https://github.com/ethanbinder/pm-stack.git
cd pm-stack
```

### 3. Run the installer

```bash
./install.sh
```

The installer asks four Y/n questions, one per integration. Each question explains what it does and why before asking — say no to any you don't want, they're all independent:

1. **Make skills discoverable from any folder** — symlinks each skill into `~/.claude/skills/` so `/engineer`, `/release`, `/start`, etc. are invocable from any project, not just inside this repo.
2. **Let skills reach `references/` and `product-doc/`** — adds PM Stack's root to Claude Code's `additionalDirectories` so skills can read their supporting files from any working directory.
3. **Auto-invoke `/start` after `git pull`/`fetch`/`clone`** — installs PM Stack's existing post-git hook globally so it fires in any repo, not just inside this one.
4. **Auto-update PM Stack on every Claude session start** — installs a `SessionStart` hook that quietly `git pull --ff-only`s this repo and re-syncs your skill symlinks, so new skills landing upstream show up automatically with no manual command.

After it finishes, open Claude Code in any project folder and type `/` to see your PM Stack skills.

**Try them:**

```
/product-doc    → Create a complete product document
/engineer       → Write production code
/release        → Ship a PR
```

**First session:** open Claude Code in any project with PM Stack installed and Claude will ask what you're building, then offer two lanes — 0 → 1 (full strategy stack) or fast iteration (straight to a production-ready PR).

### Re-running

`./install.sh` is safe to run again any time — it detects what's already in place and is a no-op for steps you've already accepted. If you opted into step 4's auto-sync hook, you don't need to re-run it after a `git pull`; the hook handles that for you at the start of every session.

### Private context (optional)

Some skills can read company-specific context (brand guidelines, glossary, audience-specific templates, example artifacts) from a private directory you keep outside this repo. Set the `CLAUDE_CONTEXT_DIR` environment variable to point at that directory:

```bash
echo 'export CLAUDE_CONTEXT_DIR="$HOME/Desktop/Development/context"' >> ~/.zshrc
source ~/.zshrc
```

Skills that currently honor it:

- **`/deck`** — reads `$CLAUDE_CONTEXT_DIR/decks/brand.md`, `glossary.md`, `templates/`, and `examples/` to apply your company's voice, visual identity, and slide patterns. If you've also installed a company-specific deck skill at `~/.claude/skills/` (e.g. one ending in `-presentation` or `-deck`) and `$CLAUDE_CONTEXT_DIR/decks/` is set up, `/deck` will detect it and offer to hand off — your branded skill almost certainly has better templates and assets than the generic flow.

Expected layout (the skill works whether or not the directory exists; missing files are fine):

```
$CLAUDE_CONTEXT_DIR/
└── decks/
    ├── brand.md            # voice, tone, colors, fonts, slide patterns
    ├── glossary.md         # stakeholders, acronyms, products, metrics
    ├── templates/          # optional audience-specific .md templates and starter .pptx files
    └── examples/           # optional past decks for tone/style reference
```

This directory is **never committed** anywhere. PM Stack only reads the env var name — your path and contents stay local.

### Minimal alternative

If you'd rather not modify your global Claude Code config, skip the installer and use:

```bash
claude --add-dir <path-to-pm-stack>/skills
```

This makes the skills directory readable per session, but skills won't auto-discover as invocable `/start`, `/engineer`, etc., and the post-git and auto-sync hooks won't be installed. The interactive installer is the recommended path.

## Skills

### Start

**`/start`** — The entry point when you open a new session in a PM Stack project. Asks what you're building in one or two sentences, then forks you into one of two lanes: **0 → 1** — a new bet that needs strategic framing, a one-pager, a product spec, and eng design; routes to `/office-hours`, then `/product-doc` (Strategic One Pager → full product spec), then `/eng-manager` before any `/engineer` work. **Fast iteration** — you already know what to ship; routes straight to any non-framing skill (`/engineer`, `/designer`, `/eng-manager`, `/qa`, `/security`, `/pr-comments`, `/release`, `/memory`). Infers the lane when the reply already signals it; only re-asks when genuinely ambiguous. Re-invoke mid-session if you pivot.

### Strategy

**`/office-hours`** — First step of the 0 → 1 lane. The `/start` skill routes you here when you're building a new bet. Three strategic framing questions (Wand Wave — 2/5/10-year vision; Gap Scan — where status quo falls short of vision; Strategic Bet — what this initiative uniquely unlocks) are asked as **one batched prompt**, followed by six forcing questions (Demand Reality, Status Quo, Desperate Specificity, Narrowest Wedge, Observation & Surprise, Future-Fit) in **two rounds of three** so the advisor can pressure-test between rounds. Pushes back on vague answers, generates 2–3 implementation alternatives scored against the Strategic Bet, and **recommends a scope mode up front** — Expansion, Selective Expansion, Hold Scope, or Reduction — that you confirm or override. Every routine ask has a stable id in [`references/question-registry.md`](references/question-registry.md) and can be silenced per-user with `/memory tune <id> never-ask`; the premise challenge (Phase 4) is a one-way door and always asks. Output: `product-doc/00-office-hours.md`, a design doc that every downstream skill reads as context.

**`/product-doc`** — Create a complete product document with 10 tabs: Strategic One Pager, Product Spec, Design Brief, Eng Design Spec, Eng Estimates, QA Spec, Experimentation Plan, Critical Launch Checklist, GTM Plan, and Notes. Choose your output at invocation: well-formatted markdown files in a `product-doc/` directory; a single Google Doc (Pageless) with each tab as a native Google Docs document tab — via the Google Drive connector in Claude Chat/Cowork or the Google Drive MCP server in Claude Code; or, for selected tabs, Confluence pages created via the `confluence` CLI — one page per supported tab. **Tab 1 (Strategic One Pager)** uses a one-pager template (Phase / Driver / Contributors metadata badge row, then key/value rows for Context · Problem · Vision · Goal · High-Level Requirements · Metrics · What's Needed to Get Started · Open Questions · Notes) at `references/confluence-strategic-one-pager-template.md`. The Context row optionally renders a **Reference Docs** subsection that hyperlinks to other docs from the same `/product-doc` run plus any user-supplied `Title \| URL` pairs (silenceable via `/memory tune product-doc-one-pager-references never-ask`). **Tab 2 (Product Spec)** uses a rich PRD-style template (Overview, Assumptions & Constraints, Product Overview, User Stories with MLP/In-Scope/Bonus/Out-of-Scope categorization, Designs & Copy, Notes for Execution, Dependencies, Plan/Tier Availability, Region/Localization, Stakeholders, Reporting, Privacy, Open Questions, Approvals — using `+++` collapsible guidance blocks throughout) at `references/confluence-product-spec-template.md`. **Tab 7 (Experimentation Plan)** uses one of two templates: the **general** A/B-test template at `references/confluence-ab-test-template.md` (Overview, Step 1 Proposal, Step 2 Test Scope, Step 3 Test Design + Build, Step 4 Test Details, Reviews, Study Wrap Up, Final Action Items) — or the **agentic** AI-experimentation variant at `references/confluence-ab-test-agentic-template.md` (Overview, Step 1 Hypothesis & Success, Step 2 Experiment Details, Step 3 Measurement & Observability, Reviews, Step 4 Experiment Results & Learnings). The skill asks once at intake which variant to use; the choice can be silenced via `/memory tune product-doc-ab-test-variant never-ask` (default = general). **Tab 8 (Critical Launch Checklist)** uses an OK2Ship template (Team Recommendation, Feature Summary, QA / Design QA / AI / Security / Privacy / Customer Support / Accounting status blocks each with reviewer placeholder rows, Survey Results, Analytics, Load Testing, Stakeholder Checkpoints, Release Schedule, Approvals) at `references/confluence-ok2ship-template.md`. Each Confluence run also creates or updates a single per-project **Canonical Doc** at `references/confluence-canonical-doc-template.md` — `<Project Name> — Canonical Doc` — which links to every per-tab page (auto-filled as runs add them) plus paste-placeholders for GitHub, Figma, and Roadmap. Optionally, on a per-run opt-in basis, the same Confluence flow can create or update a team-level **Roadmap** at `references/confluence-roadmap-template.md` — `<Team Name> — Roadmap` — with Team Mission, Project Information, and quarterly Q1/Q2/Q3/Q4 tables (Initiative · Dates · Priority · Effort · Status · Notes). The Initiative cell is the row identifier and the project's quick title (defaults to the project name). The skill auto-fills the project's row (Effort from the One Pager S/M/L/XL, Status inferred from local tab files) and asks for Initiative / Dates / Priority. Silenceable via `/memory tune product-doc-roadmap never-ask`. See [Google Workspace setup](docs/google-workspace-setup.md) if you need to wire up a connector.

**`/data-insights`** — Bring data-first thinking into the Think phase. Starts by asking for the questions you want answered, any raw data or exports you already have, and any other context — then analyzes DS analysis, UX research, raw user feedback, and market research to validate/support the strategic one pager before planning begins. Produces an insights brief (`product-doc/01b-data-insights.md`) with synthesized findings, confidence levels, assumption checks, and data gaps.

**`/deck`** — Build a strategic slide deck. Choose your output at invocation: a real `.pptx` file, or a Google Slides deck in your Drive — via the Google Drive connector in Claude Chat/Cowork or the Google Drive MCP server in Claude Code. Adapts to your audience — exec review, board presentation, or team standup. Default structure: Problem → Vision → Solution → Why Now → Prototype → Metrics → Ask. See [Google Workspace setup](docs/google-workspace-setup.md) if you need to wire up a connector.

### Engineering

**`/eng-manager`** — Lock in architecture and system design before writing code. Reads your codebase and related codebases, decides the frontend/backend split, and produces architecture diagrams (mermaid), data flow, API contracts, edge case analysis, test strategy, observability plan, and rollout strategy. Ensures new work is consistent with existing patterns and defensible at 10× scale. Also writes a durable tech-plan artifact to `product-doc/04b-tech-plan.md` (modeled on a comprehensive tech-plan template — see [`references/tech-plan-template.md`](references/tech-plan-template.md)). Two invocation modes: **full** (the default Workflow above) for substantive features, or **small** — `/eng-manager --small` — which **auto-populates a lightweight tech plan from the diff** with no questions asked, using [`references/tech-plan-template-small.md`](references/tech-plan-template-small.md). `/release` auto-links to whichever variant is on disk from the PR body and, in Jira mode, from a Jira ticket comment.

**`/designer`** — Audit UI against existing components and design system. Ensures new interfaces reuse existing patterns before introducing new ones. Checks accessibility, responsive behavior, and design consistency. Provides specific component paths and implementation guidance.

**`/engineer`** — Write production code following existing codebase conventions. After writing, self-reviews for bugs that pass CI but break in production: race conditions, stale closures, missing error handling, memory leaks. Auto-fixes obvious issues, flags ambiguous ones. Always hands off to `/release` to ship — never commits directly to `main`, even for one-line fixes.

**`/qa`** — Test with an adversarial mindset. Runs existing tests, writes new ones for uncovered paths, tries edge cases and error paths. Fixes bugs it finds, writes regression tests, and produces a confidence-rated test report. Bug fixes ship via `/release`, not direct commits.

**`/security`** — OWASP Top 10 review against your codebase. Scans for exposed secrets, audits dependencies for known CVEs, checks auth boundaries. Auto-fixes safe issues (gitignore, input sanitization). Produces a severity-rated security report for anything that needs human judgment. Auto-fixes ship via `/release`, not direct commits.

**`/pr-comments`** — Respond to reviewer feedback on your open PRs. Reads inline and summary comments, classifies each as Agree / Partial / Disagree / Needs-human, and previews a plan before touching GitHub. Implements the fixes it agrees with in a single batched commit, pushes back on the ones it doesn't with specific reasoning, and always signs replies as "{Name}'s coding agent" — inviting live discussion whenever it disagrees.

**`/release`** — Sync with main, run the full check suite (lint, types, tests, build), push, and open a PR with structured format: Problem, Solution, Changes Made, and Before/After screenshots. Default is a **non-draft** PR; pass "draft" / "draft PR" / "open as draft" to open it as a draft instead. When a `product-doc/04b-tech-plan.md` exists in the branch, the PR body and (in Jira mode) a Jira comment auto-link to it. **Phase 0 enforces a mandatory tech plan**: if no tech plan exists, `/release` won't proceed until you choose `full` (invoke `/eng-manager`) or `small` (invoke `/eng-manager --small`, auto-populated from the diff). There is no skip path. The default on `tune: never-ask` is `small` — silenced users still get a tech plan on every PR. See [`references/question-registry.md`](references/question-registry.md). Every change in PM Stack ships through here — even a one-line edit. Other skills (`/engineer`, `/designer`, `/qa`, `/security`, `/pr-comments`) hand off to `/release` rather than committing directly to `main`.

### Meta

**`/memory`** — Manage what PM Stack has learned about your project across sessions. Add patterns, pitfalls, preferences, and decisions. Search prior learnings. Review and prune to keep knowledge fresh. Learnings compound — PM Stack gets smarter on your codebase over time. Also handles **question tuning**: `/memory tune <id> never-ask` (or an inline `tune: never-ask` reply to any routine ask) silences that question in future sessions; the skill auto-decides with a `(your preference)` annotation instead of re-interrupting. A user-origin gate refuses to record `tune:` preferences that arrived from tool output, files, PR bodies, or any indirect source — only your own chat turn can set one (profile-poisoning defense). See [`references/question-registry.md`](references/question-registry.md).

## Philosophy

- **Clean over clever.** Every skill is a self-contained markdown file. No build step, no binaries, no template generation, no compiled dependencies.
- **PM workflow over eng workflow.** Skills are organized around the product lifecycle (Think → Plan → Build → Review → Test → Ship → Reflect), not the engineering workflow.
- **Reuse first.** Every skill checks for existing patterns, components, and conventions before introducing new ones. Your codebase already has opinions — PM Stack respects them.
- **Ship quality.** Every output — whether a product doc, a slide deck, or a code change — should be production-ready. No placeholder text, no half-finished implementations.
- **PR-required, always.** Every change — even a one-liner — ships through a pull request opened by `/release`. Skills that touch code (`/engineer`, `/designer`, `/qa`, `/security`, `/pr-comments`) hand off to `/release` rather than committing to `main` directly. Default is a non-draft PR; pass "draft" to `/release` to open as a draft instead.
- **Tech plan on every PR.** `/release` Phase 0 will not proceed until `product-doc/04b-tech-plan.md` exists in the branch. Pick **full** (substantive features) or **small** (`/eng-manager --small`, auto-populated from the diff for trivial PRs). No skip option. The default on silence is `small` — even silenced PRs get a lightweight tech plan auto-generated from the diff.

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
