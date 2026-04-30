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
