# Tech Plan: Remove "(OK2Ship)" parenthetical from README workflow table

**Author**: Ethan Binder

**Objective**: Drop the redundant `(OK2Ship)` parenthetical that follows "Critical Launch Checklist" in the Plan-row workflow table cell on `README.md` line 27. The OK2Ship template association is already documented in the per-skill section below (line 135), so the parenthetical adds noise to the summary table without adding information.

**PRD & Design Link**:

---

## Problem Statement

The Plan-row workflow table cell in `README.md` line 27 reads "...Critical Launch Checklist (OK2Ship) specifically...". The parenthetical interrupts the list of tab names and is redundant: the per-skill paragraph at line 135 already calls out that Tab 8 (Critical Launch Checklist) uses an OK2Ship template, with a link to `references/confluence-ok2ship-template.md`. Readers of the summary table do not need the inline gloss.

## Changes Made

- **`README.md`** (line 27, workflow table) — delete the literal substring ` (OK2Ship)` (leading space + parenthesized text) from the Plan row's description. Sentence becomes "...Strategic One Pager, Product Spec, Experimentation Plan, and Critical Launch Checklist specifically — Confluence pages via the `confluence` CLI...". The line 135 per-skill description, which names the OK2Ship template explicitly for Tab 8, is unchanged.

## Testing

N/A — single-line text deletion in a markdown file with no runtime behavior. Manual smoke: `grep -n "OK2Ship" README.md` returns exactly one match (line 135) and no longer matches line 27.

## Risks

- **None material.** The parenthetical is purely descriptive — removing it changes no link, anchor, structural element, table column, or downstream reference. OK2Ship terminology continues to appear in the per-skill description (line 135) and in the template filename `references/confluence-ok2ship-template.md`. Reviewers cross-referencing "Critical Launch Checklist" to its template still find the answer one paragraph below.
