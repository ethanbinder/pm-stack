# Tech Plan: Use commit SHA (not branch) in /release tech-plan URLs

**Author**: Ethan Binder

**Objective**: Fix `/release`'s tech-plan URL convention so links in PR bodies and Jira comments survive `gh pr merge --delete-branch`. Switch the URL from `/blob/{branch}/...` to `/blob/{commit}/...`, where `{commit}` is `git rev-parse HEAD` on the branch at PR-open time.

**PRD & Design Link**:

---

## Problem Statement
Every PR `/release` opens includes a hyperlinked **Tech Plan** entry in the **References:** block (and a parallel Jira ticket comment in Jira mode). Both URLs were built with the branch name baked in: `https://github.com/{owner}/{repo}/blob/{branch}/product-doc/04b-tech-plan.md`. As soon as the PR was squash-merged with `--delete-branch` (the standard merge for this repo), the branch disappeared on the remote and every prior **Tech Plan** link 404'd. PRs #36–#40 in this repo all have broken tech-plan links for exactly this reason. The convention was fragile — clicking "Tech Plan" on a merged PR returned `file not found`.

## Changes Made
- `skills/release/SKILL.md` (line 48) — Jira-mode tech-plan URL: changed the URL recipe from `/blob/{branch}/...` to `/blob/{commit}/...`, where `{commit}` is `git rev-parse HEAD` (not `git rev-parse --abbrev-ref HEAD`). Annotation added: *"use the commit SHA, not the branch name, so the link stays valid after `gh pr merge --delete-branch` removes the feature branch on remote."*
- `skills/release/SKILL.md` (line 125) — PR body **References** block tech-plan URL: same recipe change with the same annotation. The `## Tech Plan` entry now bakes in a permanent commit SHA at PR-open time instead of a branch name.

A commit SHA is permanent — even after `--delete-branch`, the commit remains in the repo's object store (reachable from `main` via the squash merge). Branch names are mutable references; commit SHAs are not. Using the SHA is the right primitive for "the tech plan as it shipped with this PR."

Tabs / templates elsewhere are unchanged. The `gh repo view --json nameWithOwner` derivation for `{owner}/{repo}` is unchanged.

## Testing
N/A — pure SKILL.md instruction edit, no runtime behavior in this repo. Verified by:
- `git diff --stat` shows only `skills/release/SKILL.md` and `product-doc/04b-tech-plan.md`.
- Both occurrences of `/blob/{branch}/...` in the tech-plan URL recipe are replaced with `/blob/{commit}/...`.
- The PR opened from this branch will use the new convention — its **Tech Plan** link bakes in the head commit SHA instead of the branch name. After this PR is squash-merged with `--delete-branch`, that link will still resolve (verifiable by clicking).

## Risks
- **Past PRs (#36–#40)** are not retroactively fixed — their tech-plan links will continue to 404 because their branches are already deleted. The user explicitly opted to fix going forward only, not back-fill.
- **Stale-tech-plan-after-additional-pushes edge case.** If someone pushes more commits to the PR's branch after `gh pr create` runs (e.g. addressing reviewer feedback that touches `04b-tech-plan.md`), the URL in the PR body will point at the *original* head commit SHA, not the latest tech-plan content. Acceptable: the URL still resolves, just to an older version, and the latest version is always at `product-doc/04b-tech-plan.md` on the branch (or on `main` post-merge). If this becomes a real problem, a follow-up could add a post-merge "rewrite the tech-plan link to the merge commit SHA" step in `/release` — not in scope here.
- No security or data-handling implications. No file format changes. No breakage for `gh repo view --json nameWithOwner` callers.
