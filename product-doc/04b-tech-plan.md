# Tech Plan: Unbold "Canonical Doc" in README workflow table cell

**Author**: Ethan Binder

**Objective**: Remove the bold formatting from "Canonical Doc" in the Plan-row workflow table cell on `README.md` line 27, leaving it as plain text. Other emphasized terms in the same cell (e.g. `**Roadmap**`) and the bolded `**Canonical Doc**` in the per-skill description on line 135 are unchanged.

**PRD & Design Link**:

---

## Problem Statement

Line 27 of `README.md` mixes two bolded artifact names — `**Canonical Doc**` and `**Roadmap**` — inside the workflow table summary cell. Bolding both terms in a high-density summary line distracts from the actual workflow phase headers (the leftmost `**Plan**` column) and reads as overemphasis. Dropping the bold on `Canonical Doc` cleans up the cell while keeping the bold per-skill anchor on line 135 intact.

## Changes Made

- **`README.md`** (line 27, workflow table) — change `**Canonical Doc**` to `Canonical Doc` (drop the surrounding `**` markers). The phrase remains a noun referring to the same artifact; only its visual emphasis changes. The other bolded term in the same cell (`**Roadmap**`) is left as-is — out of scope for this edit. The line-135 per-skill description still uses `**Canonical Doc**` to anchor the artifact's first detailed mention, which is the correct place for emphasis.

## Testing

N/A — single-line markdown formatting change with no runtime behavior. Manual smoke: render `README.md` (e.g. `gh repo view` on the merged commit, or any markdown previewer) and confirm "Canonical Doc" on line 27 displays as plain text while "Roadmap" on the same line stays bold.

## Risks

- **None material.** Removing bold markers does not change link targets, anchor IDs, table column structure, or any downstream reference. The artifact name `Canonical Doc` still appears verbatim on the page; only its visual weight in one cell is reduced. The line-135 occurrence — the canonical detailed reference — keeps its bold treatment.
