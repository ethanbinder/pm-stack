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

When a user opens a new Claude Code session in this repo and has not yet stated a task, invoke `/start`. That skill handles the greeting, asks what they're building, and routes them into the right lane (0 → 1 full strategy stack, or fast iteration straight to code).

If the first message is already a concrete task or skill invocation, act on it directly — do not invoke `/start`.
