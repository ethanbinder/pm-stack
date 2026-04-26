# Tech Plan: Add Canonical Doc Confluence template + auto-create / auto-update on every Confluence run

**Author**: Ethan Binder

**Objective**: Add a polished, generalized Canonical Doc template — a single per-project "front door" Confluence page that aggregates links to every per-tab page (One Pager, Product Spec, Experimentation Plan, OK2Ship) plus paste-placeholder sections for GitHub, Figma, and Roadmap — and wire `/product-doc`'s Confluence path to create-or-update this doc on every run. Title format `<Product Name> — Canonical Doc`. The doc becomes a stable bookmark for the team, kept current as later runs add more per-tab pages.

**PRD & Design Link**:

---

## Problem Statement

`/product-doc`'s Confluence path now publishes one polished page per supported tab (Tabs 1, 2, 7, 8). What's missing is a single per-project page that aggregates links to all of them so a team member can land in one place and navigate from there — without a doc index, the only "front door" is whatever ad-hoc parent page the user picked at intake. This PR adds a generic Canonical Doc template + auto-create / auto-update plumbing so every Confluence run produces or updates one project-level doc that always points at the latest per-tab pages.

## Changes Made

- **`references/confluence-canonical-doc-template.md`** (new) — generic canonical-doc body. Top INFO callout (purpose: "one doc to rule them all") + TIP callout (4-step how-to-use, generalized — no internal sprint-page URL) + `---` rule + `## [Project Name] — Canonical Doc` heading + `### Project Overview` bullets (what / why / experience / impact) + `### Product Docs` bullet list with `[pending]` placeholders for Strategic One Pager · Product Spec · Tech Plan · Experimentation Plan · OK2Ship · 1-month readout · 3-month readout + `### GitHub` / `### Figma` / `### Roadmap` sections with paste-placeholders + PM Stack attribution footer.
- **`skills/product-doc/SKILL.md`** — Confluence option summary at line 38 now mentions the Canonical Doc is also created. Added a new "Canonical Doc — create or update" sub-step at the end of the Confluence-path generate phase. The block describes the title scheme (`<Product Name> — Canonical Doc`), the CQL search to detect prior existence, the create-vs-update branch (zero results → render template + `confluence create`; one result → `confluence get` to read current bullet text + per-tab `confluence edit` invocations to swap bullets in place; >1 result → pick most-recently-updated, warn inline). Added a bullet-to-tab mapping table. Tab 7's general/agentic variants share a single `Experimentation Plan` slot; the latest run wins. Tech Plan / readouts / GitHub / Figma / Roadmap are intentionally left as user-editable placeholders — the skill never overwrites manual edits to those sections.
- **`README.md`** — workflow row at line 27 now mentions the per-project Canonical Doc that aggregates links. Per-skill description appended with one new sentence describing the Canonical Doc's structure, file path, and auto-update behavior, in lockstep with the SKILL.md change.

## Testing

N/A — template / skill-doc change, no runtime behavior. Manual smoke tests after merge: (1) run `/product-doc` for a fresh dummy initiative requesting Tab 1 only on the Confluence path; confirm two pages get created (One Pager + Canonical Doc), the Canonical Doc has Strategic One Pager populated as a hyperlink, all other Product Docs slots show `[pending]`, GitHub/Figma/Roadmap have paste-placeholders. (2) Re-run for the same project requesting Tab 2 + Tab 8 on the same space; confirm the Canonical Doc was found (no second one created), Product Spec and OK2Ship bullets are now hyperlinks, the Strategic One Pager bullet still resolves to its earlier URL. (3) Manually paste a GitHub URL into the Canonical Doc's GitHub section and re-run `/product-doc`; confirm the manual edit is preserved. (4) Run `/product-doc` for a different project name on the same space; confirm a separate Canonical Doc is created. (5) Grep the new template for any company-specific terms (default platform names, default human names, internal-tool URLs) and confirm zero hits.

## Risks

- **CQL title-match precision.** `confluence search 'space = <KEY> AND title = "<title>"'` relies on title equality. If a writer renames the canonical doc in the UI (e.g. drops the em-dash), subsequent runs won't find it and will create a duplicate. Mitigation: the >1-result branch picks the most-recently-updated and warns inline, so the user can manually delete the duplicate. A future enhancement could fall back to fuzzy matching, but that's out of scope here.
- **Bullet old-text matching during update.** `confluence edit` requires the old text to appear exactly once. Implementation reads the current body via `confluence get` and locates the exact bullet text before issuing the edit. Edge case: a writer who manually rewords a bullet (e.g. changes `- [Product Spec](URL)` to `- [PRD](URL)`) will cause the next run's edit to fail. Mitigation: log a clear warning to the user and skip that bullet's update — never falsely match a different bullet. The user can fix the canonical doc by hand.
