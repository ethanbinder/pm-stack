# Tech Plan: Add One Pager Confluence template + wire `/product-doc` Tab 1 with conditional Reference Docs

**Author**: Ethan Binder

**Objective**: Add a polished, generalized Confluence template for the Strategic One Pager (Tab 1 of `/product-doc`) and extend `/product-doc`'s Confluence output path so users can publish a Tab 1 page via the `confluence` CLI alongside the Tab 2 / Tab 7 / Tab 8 pages already supported. Add a new conditional **Reference Docs** subsection inside the Context row that auto-links other docs from the same `/product-doc` run and accepts manual `Title | URL` additions at intake — collapsing entirely when there are no docs to link.

**PRD & Design Link**:

---

## Problem Statement

`/product-doc`'s Confluence path currently supports Tabs 2 (Product Spec) and 7 (Experimentation Plan, with general/agentic variants). The Strategic One Pager — the first artifact most PMs hand to a stakeholder — still has to be hand-built in the tracker. Adding a generalized one-pager template + wiring it into the Confluence path closes that gap with the same one-shot polish the other tabs get, while preserving our existing One Pager section list verbatim. The new conditional Reference Docs subsection makes the One Pager a useful "front door" to the rest of the docs created in the same run.

## Changes Made

- **`references/confluence-strategic-one-pager-template.md`** (new) — generic one-pager template. Top-of-page purpose blurb + INFO callout + `---` rule. Three-row metadata mini-table (Phase status badge / Driver / Contributors). Nine-row main content table mapping our existing Markdown Tab 1 section list 1:1 — `### Context` · `### Problem` · `### Vision` · `### Goal` (Value for End User + Value for [Company Name]) · `### High-Level Requirements` · `### Metrics` · `### What's Needed to Get Started` (with the canonical S/M/L/XL effort scale) · `### Open Questions` · `### Notes`. Status-badge syntax `[Discover](status:red:bold)` (atlassian-cli's round-trip syntax for Confluence's status macro). Internal team acronyms generalized to "specialist teams (e.g. Data Science, Hardware, Research, Performance, …)"; references to internal R&D programs generalized; PM Stack attribution footer at the bottom.
- **`skills/product-doc/SKILL.md`** — Confluence path extended from "Tabs 2 and 7" to "Tabs 1, 2, and 7" (one page each). Adds Tab 1 as the new top row of the per-tab template + title mapping (page title `<Product Name> — One Pager`). Adds a new intake check above the Tab 1 populate substitution: registry id `product-doc-one-pager-references`, two-way, default `none`, with the standard auto-decided announcement on `never-ask` and the standard tune hint after a non-silenced ask. Adds a "Tab 1 populate-time substitution" block that grounds from the existing Markdown Tab 1 file when present, substitutes `[Company Name]` from the persisted `Company:` learning, and substitutes `[S/M/L/XL]` with the matching short-descriptor from the Effort intake. Adds a "Tab 1 Reference Docs subsection" rule: build a list of `[<Title>](<URL>)` bullets from (a) URLs returned by `confluence create` for Tabs 2/7/8 in the same run, then (b) `Title | URL` pairs from the intake answer; render under a `**Reference Docs**` bold header inside the Context row's cell **only** when the combined list is non-empty; otherwise omit the entire subsection.
- **`references/question-registry.md`** — new row for `product-doc-one-pager-references` (product-doc skill, two-way, default `none`, offers tune hint).
- **`README.md`** — workflow row at line 27 now reads "for the Strategic One Pager, Product Spec, and Experimentation Plan specifically." Per-skill description updated in lockstep with a new sentence describing the One Pager template's structure, its file path, and the silenceable Reference Docs intake.

## Testing

N/A — template / skill-doc / registry change, no runtime behavior. Manual smoke tests after merge: (1) run `/product-doc` for a dummy initiative requesting Tab 1 only on the Confluence path; confirm a single One Pager page is created with the Phase status badge, the Driver / Contributors rows, and the 9-row main content table. The Context row must NOT contain a Reference Docs subsection. (2) Re-run for Tab 1 + Tab 2 + Tab 7; confirm three pages get created, and the One Pager's Context row ends with a `**Reference Docs**` subsection listing the Product Spec and Experimentation Plan URLs in tab order. (3) Run for Tab 1 alone and answer the Reference Docs intake with two `Title | URL` pairs; confirm the One Pager renders the subsection with those two bullets. (4) Set `tune: never-ask` for `product-doc-one-pager-references` and re-run Tab 1 only with no other Confluence pages; confirm the auto-decided announcement appears, the question is skipped, and no Reference Docs subsection is rendered. (5) Grep the new template for any company-specific terms (default platform names, default human names, internal-tool URLs) and confirm zero hits.

## Risks

- **PR depends on the prior PRs in the chain landing first.** This branch is based on PR #49 (Agentic A/B). Sibling PR #48 (OK2Ship / Tab 8) is also stacked on PR #47 — it adds Tab 8 wiring this branch hasn't seen yet. After all four prior PRs merge to `main`, GitHub auto-retargets this PR's base; a small rebase will be needed to merge the Tab 8 wiring into the supported-tabs lists in `skills/product-doc/SKILL.md` and `README.md`. The rebase is mechanical (extending the supported-tabs list and adding the Tab 8 row to the per-tab mapping) — no design conflicts.
