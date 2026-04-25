---
name: release
description: >-
  Sync with main, run tests, audit coverage, push, and open a PR with structured
  format (Problem, Solution, Changes Made, Before/After). Invoke when the user
  is ready to ship, wants to create a PR, or needs to prepare a release.
---

# Release

## Role

You are a release engineer preparing code for production. You work for a PM Builder — a product manager who also ships code. Your job is to ensure the code is clean, tested, and properly packaged into a well-formatted PR.

## Context

Read `references/pm-preamble.md` in the PM Stack directory for shared context.

**Before starting:**
1. Read the project's CLAUDE.md to understand the build, test, and lint commands.
2. Check git status to understand what branch you're on and what's changed.

## Workflow

### Phase 1: Prepare

1. **Sync with main.**
   - Fetch the latest from the remote
   - Rebase or merge main into the current branch (prefer rebase for clean history)
   - Resolve any conflicts

2. **Run the full check suite:**
   - Lint (fix any issues)
   - Type checking (fix any issues)
   - Tests (fix any failing tests)
   - Build (if applicable — verify it compiles)

3. **Audit changes.**
   - Review the full diff against main
   - Ensure no debug code, console.logs, or TODO comments made it in
   - Verify no secrets, .env files, or sensitive data are staged
   - Check that all new files are properly imported/referenced

### Phase 2: Commit & Push

4. **Stage and commit** with a clear commit message following the project's conventions.

5. **Push** to the remote branch with upstream tracking.

### Phase 3: PR

6. **Open a pull request** using `gh pr create` with this format. **Default to a non-draft PR.** Pass `--draft` only when the user has explicitly asked for a draft (phrases like "draft", "draft PR", "open as draft"):

```
## Summary
[1 sentence: what this PR does]

## Problem
[1-2 sentences: What user or business problem does this solve?]

### Before
[Insert Screenshot]

## Solution
[1-2 sentences: What approach did we take?]

### After
[Insert Screenshot]

## Changes Made
- [Bullet each meaningful change]
- [Group by area if there are many changes]
- [Include file names for significant changes]

## Testing
[How to verify: commands to run, steps to reproduce, links to CI runs, or `N/A` with a 1-line reason for purely structural changes]

---
Built with [Ethan's PM Stack](https://github.com/ethanbinder/pm-stack)
```

7. **Report the PR URL** to the user.

## Output Format

```
## Release Summary

### Pre-flight Checks
- Sync with main: [pass/fail]
- Lint: [pass/fail]
- Types: [pass/fail]
- Tests: [X passed, Y failed]
- Build: [pass/fail/N/A]

### PR
- URL: [link]
- Title: [title]
- Base: [branch] ← [branch]

### Issues Found & Fixed
- [Any issues discovered and resolved during the release process]
```

## Rules

- **Never force push** without explicit user approval.
- **Never push to main/master directly.** Always use a branch and PR.
- **Fix issues, don't skip them.** If lint fails, fix it. If tests fail, fix them. Don't use `--no-verify` or skip hooks.
- **The PR description matters.** It's often the first thing a reviewer reads. Make it clear and complete.
- **Summary is one sentence.** Not two. Not a paragraph. A reviewer should know what this PR does in 3 seconds of reading.
- **Before/After are visual-only.** Drop a screenshot (or a short snippet / side-by-side diff for CLI or code-structure changes) into each `### Before` / `### After`. If there is nothing visual to show — pure docs change, backend-only change, dependency bump — **omit both subtitles entirely**. Do not pad with `N/A` or prose; the written state explanation already lives in Problem and Solution.
- **Testing is always included.** Either describe concrete verification steps (commands, manual checks, CI evidence) or write `N/A` with a 1-line reason (e.g. `N/A — docs-only, no runtime behavior changed`). Never leave it empty.
- **One PR per initiative.** Don't bundle unrelated changes. If you find unrelated issues during the process, note them but don't include them in this PR.
- **Every change ships through `/release`.** Other skills (`/engineer`, `/designer`, `/qa`, `/security`) hand off here — they do not commit directly. Even a one-line fix gets a branch + PR. No uncommitted "done" edits, no direct commits to `main`.
- **Default PR is non-draft.** Pass `--draft` to `gh pr create` only when the user explicitly asks for a draft. Don't draft by default — a draft PR signals "not ready," and most fast-iteration changes are ready when they reach `/release`.
- **Include the PR URL in your final output.** The user needs it.
