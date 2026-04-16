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
