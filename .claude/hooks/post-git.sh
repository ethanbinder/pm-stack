#!/bin/bash
set -euo pipefail

INPUT=$(cat)

# Match git pull / fetch / clone in the .tool_input.command field of the
# PostToolUse hook JSON. Regex is applied against raw input (no jq
# dependency). False positives would require another JSON field to contain
# the same pattern, which is vanishingly unlikely in PostToolUse payloads.
if echo "$INPUT" | grep -qE '"command":[[:space:]]*"[^"]*git[[:space:]]+(pull|fetch|clone)\b'; then
  cat <<'EOF'
{"hookSpecificOutput":{"hookEventName":"PostToolUse","additionalContext":"The user just pulled/fetched/cloned. Invoke the /start skill now — treat this as a new session and greet from Phase 1, so the user can re-route into the right lane (0 → 1 or fast iteration) for whatever the pull surfaced."}}
EOF
fi
exit 0
