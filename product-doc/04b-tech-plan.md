# Tech Plan: Add Confluence output path to /product-doc for the Product Spec

**Author**: Ethan Binder

**Objective**: Extend `/product-doc` with a third output format — Confluence — that creates the Product Spec (Tab 2) as a Confluence page via the `confluence` CLI, using a richer PRD-style template than the existing Tab 2 markdown structure. Markdown and Google Docs paths are unchanged.

**PRD & Design Link**:

---

## Problem Statement
PRDs already live in Confluence at most companies. Forcing the user to generate a markdown file from `/product-doc` and then paste-and-reformat into Confluence is friction we can remove. Adding a third output format for Tab 2 lets the skill create the page directly via `confluence create`. The existing Tab 2 markdown template is intentionally lightweight; Confluence audiences are wider and less technical, so the Confluence template is richer (Overview, Assumptions, Requirements with MLP categorization, Designs, Notes for Execution, Dependencies, Stakeholders, Reporting, Privacy, Open Questions, Approvals).

## Changes Made
- `references/confluence-product-spec-template.md` (NEW) — body template piped to `confluence create` via stdin. `[bracket placeholders]` populated by the skill at generate time. Trailing `---` + `Built with [Ethan's PM Stack](https://github.com/ethanbinder/pm-stack)` footer matches the canonical recipe established in PR #43.
- `skills/product-doc/SKILL.md` step 2 — output-format menu gets a third option (**Confluence**). Eligibility gating inline: only offered when (a) requested tabs include Tab 2 AND (b) `command -v confluence` succeeds.
- `skills/product-doc/SKILL.md` step 3b (NEW) — Confluence-mode setup phase that re-validates the CLI, confirms Tab-2-only scope (asks how to handle Tab 1 or other requested tabs), and gathers space key (offering `confluence config` default) + optional parent page ID.
- `skills/product-doc/SKILL.md` step 4 — Generate step gets a `Confluence path:` sub-bullet that reads the new template, populates per step 5, and pipes to `confluence create --space-key <KEY> --title "<Product Name> — Product Spec" [--parent-id <ID>]`.
- `README.md` — workflow-table row for `/product-doc` and the longer per-skill description in the Strategy section both updated to mention Confluence as a third output (Product Spec only). Lockstep update per CLAUDE.md.

`confluence create` syntax verified locally: `confluence create --space-key SPACE_KEY --title TITLE [--parent-id PARENT_ID]`, body read from stdin. Tab 2's existing markdown template (`skills/product-doc/SKILL.md` ~line 92) is unchanged. Tabs 1, 3–10 are not Confluence-eligible in this PR.

## Testing
N/A in CI — pure SKILL.md instruction edit + new reference file + README update; no runtime behavior in this repo's test harness. Verified by:
- `git diff --stat` shows: one new file (`references/confluence-product-spec-template.md`), edits confined to `skills/product-doc/SKILL.md` (step 2 + new step 3b + step 4), `README.md` (two lines), and `product-doc/04b-tech-plan.md`.
- The new reference file contains the section structure described above and ends with the canonical attribution footer.
- The skill's step 2 lists three output formats with the eligibility note inline.
- Step 3b validates `command -v confluence`, gates Confluence to Tab 2 only, and asks for space key + optional parent page ID.
- Step 4 has a `Confluence path:` sub-bullet that reads the template and pipes to `confluence create`.
- Tabs 1–10 templates in the Tab Structure section are byte-identical to `main`.

End-to-end Confluence test (manual, requires `confluence` CLI configured): run `/product-doc` and ask for "just the product spec, in Confluence." Skill validates the CLI, asks for space key (offering the default), asks for optional parent page ID, then calls `confluence create` and reports the resulting page URL. Open the page in Confluence and confirm the section structure, populated content, and footer with hyperlinked **Ethan's PM Stack**.

## Risks
- **Tab gating UX.** If a user requests "all 10 tabs, in Confluence," they hit the Tab-2-only constraint and have to make a sub-choice (other tabs in markdown / google docs / skip). Acceptable: small UX cost, prevents the alternative (forcing 9 other tabs to fit Confluence pages they weren't designed for).
- **Atlassian markup variance.** The template is markdown. Modern Atlassian Cloud renders this correctly; legacy on-prem Server may render literal markdown. Same trade-off as PR #43's Jira-ticket footer.
- **No persistence of space key / parent page ID.** Each Confluence run asks fresh. If repeated runs against the same space become annoying, `.pm-stack/learnings.md` `## Project Facts` is the natural follow-up — same mechanism as `Company:`.
- **No retroactive update** of Product Specs already on disk in markdown — only new runs get the Confluence option.
- No security implications. No new auth path; reuses the same `confluence` CLI auth that `/release` already relies on.
