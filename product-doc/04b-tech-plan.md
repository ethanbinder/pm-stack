# Tech Plan: Add a top-level `Prototypes/` folder

**Author**: Ethan Binder

**Objective**: Give PM Stack a canonical home for interactive prototypes (HTML mockups, design system docs, UX specs) by adding a top-level `Prototypes/` folder, mirroring the structure already in use at `WhoopInc/ai-pm-os/Prototypes/`. Document conventions in a folder README and register the new directory in `CLAUDE.md`'s repo-structure listing.

**PRD & Design Link**:

---

## Problem Statement

PM Stack is organized today around `skills/`, `references/`, `docs/`, and `product-doc/`. There is no agreed-upon home for the interactive artifacts that PM Builders produce alongside their product work — HTML prototypes, design system docs, or UX specs. Without a canonical folder, prototype files get scattered across the user's `~/Desktop/Development/Prototypes/` workspace, individual project folders, or nowhere reproducible at all, and there is no shared convention for naming, headers, or how to link to them from project docs.

The `WhoopInc/ai-pm-os` repo solved this by adding a top-level `Prototypes/` directory whose only checked-in file is a `README.md` documenting conventions; new prototypes are dropped in as siblings as they are produced. Replicating that pattern in PM Stack gives PM Builders an obvious place to put prototypes and a one-page reference for how to format them.

## Changes Made

- **`Prototypes/README.md`** (new) — documents the folder's purpose (HTML prototypes, design system docs, UX specs), the kebab-case naming convention with three example filenames adapted to PM-Stack-relevant subjects, the required HTML comment header (Prototype/Author/Date/Description), the no-build-step viewing instructions (`open Prototypes/...`), and the markdown linking syntax for referencing prototypes from project folders. Mirrors the structure of `WhoopInc/ai-pm-os/Prototypes/README.md` verbatim with two small framing adaptations (PM Builder voice, PM-Stack example filenames).
- **`CLAUDE.md`** — add one bullet to the `## Structure` section listing the new `Prototypes/` directory and pointing to its README for conventions. Maintains the lockstep rule's intent that the documented repo structure stays current with the on-disk structure.

## Testing

N/A — no runtime behavior, no skills, no tooling, no install-flow change. Manual smoke checks: (1) `ls "PM Stack/Prototypes/"` shows `README.md`; (2) `grep -n "Prototypes/" CLAUDE.md` shows the new structure bullet; (3) the new README renders cleanly in any markdown previewer with the kebab-case examples and HTML comment block formatted as expected.

## Risks

- **None material.** The change is additive scaffolding — a new folder with a single doc plus a single bullet in `CLAUDE.md`. No existing skill, reference, doc, install step, or hook is touched. No README anchor or skill behavior depends on the prior absence of a `Prototypes/` directory. The folder has no automation behind it, so it cannot regress any flow; the worst case is that it stays empty until the first prototype is dropped in. Future prototypes added under this folder are independent artifacts and inherit no implicit guarantees from the scaffolding PR.
