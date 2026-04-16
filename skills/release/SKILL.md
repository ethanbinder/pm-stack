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

6. **Open a pull request** using `gh pr create` with this format:

```
## Problem
[1-2 sentences: What user or business problem does this solve?]

## Solution
[1-2 sentences: What approach did we take?]

## Changes Made
- [Bullet each meaningful change]
- [Group by area if there are many changes]
- [Include file names for significant changes]

## Before / After
| Before | After |
|--------|-------|
| [Screenshot or description] | [Screenshot or description] |

---
Generated with [PM Stack](https://github.com/ethanbinder/pm-stack)
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
- **Before/After is for visual changes.** If the change is purely backend or non-visual, replace the Before/After section with a "Testing" section describing how to verify.
- **One PR per initiative.** Don't bundle unrelated changes. If you find unrelated issues during the process, note them but don't include them in this PR.
- **Include the PR URL in your final output.** The user needs it.
