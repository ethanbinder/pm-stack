# Tech Plan: Add interactive install.sh and simplify README setup flow

**Author**: Ethan Binder

**Objective**: Replace the README's existing `--add-dir ~/.pm-stack/skills` setup snippet with a new interactive `install.sh` that sets up PM Stack the way it's actually meant to be used — skills discoverable globally, references reachable, post-git hook installed globally, and a `SessionStart` auto-sync hook so new skills landing upstream show up automatically. Also recommend a parent `Development/` folder for users who don't already have one.

**PRD & Design Link**:

---

## Problem Statement

The current `Quick Start > Install` instructs users to run `claude --add-dir ~/.pm-stack/skills`, which only makes the skills directory readable per session — it does not register the skills as discoverable, does not install the post-git hook outside the PM Stack repo, and provides no auto-sync. New users following the README hit this gap silently and never get the experience the skills are designed to deliver. This PR closes that gap with a one-command interactive installer and a friendlier README that recommends a `Development/` parent folder for clean repo organization.

## Changes Made

- `install.sh` (NEW, executable, repo root) — interactive 4-step installer. Resolves PM Stack's location from `$BASH_SOURCE` so it works wherever the user cloned. Each step prints a plain-English explanation of what it does and why before its Y/n prompt. Steps are independent — the user can accept any subset.
  - **Step 1**: symlinks each `skills/*/` into `~/.claude/skills/` so PM Stack's skills become user-level and invocable from any folder.
  - **Step 2**: `jq`-merges PM Stack's root into `permissions.additionalDirectories` in `~/.claude/settings.json` so skills can reach `references/` and `product-doc/` from any cwd.
  - **Step 3**: `jq`-merges a `PostToolUse` entry pointing at `<pm-stack>/.claude/hooks/post-git.sh` into `~/.claude/settings.json` so `/start` re-invokes after `git pull`/`fetch`/`clone` in any repo.
  - **Step 4**: writes `~/.claude/hooks/sync-pm-stack.sh` (path-resolved at install time) and `jq`-merges a `SessionStart` hook entry. The script does a best-effort `git pull --ff-only` on PM Stack and re-runs the symlink loop, silently no-oping on offline / dirty tree / diverged history. Prunes dangling symlinks for skills removed upstream.
  - Idempotent: each `jq` merge filters out an existing matching entry before adding, so re-runs produce no semantic diff. Backs up `~/.claude/settings.json` to a timestamped sibling before each modification.
  - Falls back to printing the JSON snippet for manual paste when `jq` is not installed.
- `README.md` — `Quick Start > Install` section replaced with a three-step flow: (1) recommend a `~/Desktop/Development` folder for repo organization with a one-paragraph rationale, (2) `git clone`, (3) `./install.sh` with a numbered list of what each installer step does so users can preview before running. Adds a `Re-running` subsection clarifying that `install.sh` is safe to re-run and that step 4's auto-sync makes manual re-syncs unnecessary. Adds a `Minimal alternative` subsection that preserves the original `claude --add-dir` line for users who explicitly don't want global config changes, with an honest note that the minimal path skips skill discovery and hook installation.
- `README.md` — the existing `After a pull` paragraph (which described the post-git hook as a project-level setup users had to copy by hand) is replaced as part of the new `Quick Start` since step 3 of the installer handles this globally.

No skills, references, hooks, or any other PM Stack runtime files were touched. Existing project-level `.claude/hooks/post-git.sh` and `.claude/settings.json` inside the repo are unchanged — the installer just makes the same hook fire globally.

## Testing

Verified locally on the author's machine:

- `bash -n install.sh` — passes syntax check.
- `printf 'Y\nY\nY\nY\n' | ./install.sh` against an already-installed `~/.claude/settings.json` → all four steps reported `✓` and the diff between pre- and post-run `jq -S . settings.json` is empty. Strongest possible idempotency check (the author's machine had every piece installed by hand before the installer existed; the installer correctly recognized each as already-present).
- `ls ~/.claude/skills/ | wc -l` after run → still 13 symlinks, all live and resolving to `<PM Stack>/skills/<name>/`.
- Symlink targets verified with `readlink ~/.claude/skills/start` → resolves into the live PM Stack tree (so skill bodies' `references/` lookups continue to work).
- `jq . ~/.claude/settings.json` → valid JSON post-run.
- The generated `~/.claude/hooks/sync-pm-stack.sh` is `chmod +x` and syntactically valid (`bash -n`).

End-to-end "fresh-user" test (recommended for reviewer): on a machine that has never run the installer, `git clone`, `cd pm-stack`, `./install.sh`, accept all four prompts, then `cd ~ && claude` and confirm `/start`, `/engineer`, `/release` appear in the slash-command picker.

## Risks

- **Settings.json merge complexity.** The installer edits `~/.claude/settings.json` via `jq`, which can fail in unusual ways (existing config schema variation, jq version differences). Mitigations: timestamped backup before every write; explicit "no jq" fallback that prints the snippet to paste manually; idempotent merges so a second run after a partial first run cannot duplicate entries.
- **SessionStart hook latency.** Every Claude Code session now fires a `git pull --ff-only` against PM Stack at startup. Latency cost is small (single git fetch on a small repo), but always present. Mitigation: `--quiet` and `2>/dev/null || true` so the hook never blocks or surfaces noise; users can decline step 4 and keep manual control.
- **Hardcoded PM Stack path in the generated sync script.** Step 4 writes a sync script with the user's PM Stack path baked in at install time. If the user later moves the PM Stack clone, the sync script will silently fail. Mitigation: `--ff-only ... || true` means failure is non-blocking, and re-running `./install.sh` from the new location regenerates the script with the correct path.
- **Minimal-alternative path remains supported.** Users who explicitly want zero global config changes can still use `claude --add-dir <pm-stack>/skills` per the README's `Minimal alternative` section. No breaking change.
- No security implications. The installer only writes to `$HOME/.claude/`, never touches PM Stack repo files, and doesn't execute network code beyond the optional `git pull --ff-only` in step 4 (which the user accepts explicitly).
