# CLAUDE.md

## Project

PM Stack is a collection of Claude Code skills for PM Builders — product managers who also write and ship code. Each skill is a self-contained SKILL.md file with YAML frontmatter.

## Structure

- `skills/` — one directory per skill, each containing a SKILL.md
- `references/` — shared context files that skills can reference
- `docs/` — setup guides and documentation

## Conventions

- Skills are plain markdown with YAML frontmatter. No build step, no binaries.
- Each SKILL.md must have `name` and `description` in its frontmatter.
- Skills should reference `references/pm-preamble.md` for shared PM Builder context.
- Keep skills self-contained — a skill should work without any other skill installed.
- When adding or removing a skill directory under `skills/`, update the count in `README.md`'s tagline ("Nine specialized skills...") in the same PR.
- Keep `README.md` in lockstep with the rest of the repo. Any change that alters what a skill does, how it's invoked, what's in `references/` or `docs/`, or the project's setup/install flow MUST update the matching parts of `README.md` in the same PR — at minimum the workflow table row ("What It Does") and the longer per-skill description in the Strategy/Engineering/Meta sections. Don't ship the code change and the README update separately.

## Onboarding

When a user opens a new Claude Code session in this repo and has not yet stated a task, open with this greeting verbatim:

> What are you building? One or two sentences.
>
> Then pick a lane:
>
>   • **0 → 1** — a new bet. Start at `/office-hours` to pressure-test the framing, then walk the full stack — strategic one-pager, product specs, eng design, and on through Think → Plan → Build → Review → Test → Ship → Reflect — before a line of code.
>
>   • **Fast iteration** — you already know what to ship. Skip to `/engineer`, `/qa`, `/pr-comments`, or `/release` and put up a production-ready PR.

Then route by lane:

- **0 → 1 lane** → invoke `/office-hours` first. After that skill lands its design doc, continue through `/product-doc`, `/data-insights`, `/deck`, and `/eng-manager` as needed before any `/engineer` work.
- **Fast-iteration lane** → jump directly to whichever build/ship skill the user's request points at (`/engineer` for code, `/qa` for test coverage, `/pr-comments` for reviewer feedback, `/release` for the PR itself). Skip the full Think/Plan phase.
- **Ambiguous** → if the user's reply already signals the lane (new idea and vague framing → 0→1; concrete code change or existing PR → fast), act on it without re-asking. Only re-ask if the signal is genuinely unclear.

Do not open with this greeting if the user's first message already states a concrete task or invokes a skill — in that case, act on the request directly.
