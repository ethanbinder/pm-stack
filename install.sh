#!/bin/bash
# PM Stack interactive installer.
# Sets up PM Stack so its skills are discoverable from any Claude Code
# session, not just from inside this repo. Each step asks before running
# and explains what it does and why it helps. Safe to re-run any time.

set -uo pipefail

PM_STACK="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SETTINGS="$HOME/.claude/settings.json"
SKILLS_DIR="$HOME/.claude/skills"
HOOKS_DIR="$HOME/.claude/hooks"

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
DIM='\033[2m'
NC='\033[0m'

confirm() {
  local prompt="$1"
  local reply
  printf "%b %b[Y/n]%b " "$prompt" "$DIM" "$NC"
  read -r reply
  reply=${reply:-Y}
  [[ "$reply" =~ ^[Yy]$ ]]
}

backup_settings() {
  if [ -f "$SETTINGS" ]; then
    cp "$SETTINGS" "$SETTINGS.bak.$(date +%s)"
  fi
}

ensure_settings_file() {
  mkdir -p "$(dirname "$SETTINGS")"
  [ -f "$SETTINGS" ] || echo '{}' > "$SETTINGS"
}

if [ ! -d "$PM_STACK/skills" ]; then
  echo "ERROR: $PM_STACK/skills not found. Run install.sh from inside the PM Stack repo." >&2
  exit 1
fi

if command -v jq >/dev/null 2>&1; then
  HAS_JQ=1
else
  HAS_JQ=0
fi

printf "%b" "$BLUE"
echo "==========================================="
echo "  PM Stack Setup"
echo "==========================================="
printf "%b\n" "$NC"
echo "This installer offers four optional integrations, one at a time."
echo "Each is independent — say no to any you don't want. Re-run any time."
echo
printf "%bPM Stack location:%b %s\n" "$DIM" "$NC" "$PM_STACK"
echo

if [ "$HAS_JQ" = 0 ]; then
  printf "%bNote:%b 'jq' is not installed. Steps that would edit\n" "$YELLOW" "$NC"
  echo "~/.claude/settings.json will print the JSON snippet for you to"
  echo "paste manually instead of editing the file automatically."
  echo
fi

# ---- Step 1 ----
printf "%b[1/4]%b Make PM Stack skills discoverable from any folder\n" "$BLUE" "$NC"
echo
echo "  Why: by default, PM Stack's skills only show up when you run"
echo "  Claude Code from inside this repo. Symlinking each skill into"
echo "  ~/.claude/skills/ makes /engineer, /release, /start, etc."
echo "  invocable from any project."
echo

if confirm "  Symlink ${PM_STACK}/skills/* into ~/.claude/skills/?"; then
  mkdir -p "$SKILLS_DIR"
  count=0
  for dir in "$PM_STACK/skills/"*/; do
    [ -d "$dir" ] || continue
    name=$(basename "$dir")
    ln -sfn "$dir" "$SKILLS_DIR/$name"
    count=$((count + 1))
  done
  printf "  %b✓%b Linked %d skills into %s\n" "$GREEN" "$NC" "$count" "$SKILLS_DIR"
else
  printf "  %bskipped%b\n" "$DIM" "$NC"
fi
echo

# ---- Step 2 ----
printf "%b[2/4]%b Let skills reach references/ and product-doc/\n" "$BLUE" "$NC"
echo
echo "  Why: several skills look up files in references/ and"
echo "  product-doc/ (siblings of skills/). Adding PM Stack's root to"
echo "  Claude Code's additionalDirectories makes those reachable from"
echo "  any working directory."
echo

if confirm "  Add ${PM_STACK} to additionalDirectories in ~/.claude/settings.json?"; then
  if [ "$HAS_JQ" = 1 ]; then
    ensure_settings_file
    backup_settings
    tmp=$(mktemp)
    jq --arg path "$PM_STACK" '
      .permissions = (.permissions // {}) |
      .permissions.additionalDirectories = (
        ((.permissions.additionalDirectories // []) | map(select(. != $path))) + [$path]
      )
    ' "$SETTINGS" > "$tmp" && mv "$tmp" "$SETTINGS"
    printf "  %b✓%b Updated additionalDirectories\n" "$GREEN" "$NC"
  else
    echo "  Add this entry to permissions.additionalDirectories in $SETTINGS:"
    printf '    "%s"\n' "$PM_STACK"
  fi
else
  printf "  %bskipped%b\n" "$DIM" "$NC"
fi
echo

# ---- Step 3 ----
printf "%b[3/4]%b Auto-invoke /start after git pull/fetch/clone (any repo)\n" "$BLUE" "$NC"
echo
echo "  Why: PM Stack ships a hook that re-greets you with /start"
echo "  whenever you pull/fetch/clone — useful because the change you"
echo "  just pulled may shift what you should work on. Installing it"
echo "  globally makes it fire in any repo, not just inside PM Stack."
echo

POST_GIT_HOOK="$PM_STACK/.claude/hooks/post-git.sh"

if confirm "  Install post-git hook into ~/.claude/settings.json?"; then
  if [ "$HAS_JQ" = 1 ]; then
    ensure_settings_file
    backup_settings
    tmp=$(mktemp)
    jq --arg cmd "$POST_GIT_HOOK" '
      .hooks = (.hooks // {}) |
      .hooks.PostToolUse = (.hooks.PostToolUse // []) |
      if (.hooks.PostToolUse
            | map(.hooks // [] | map(.command))
            | flatten
            | any(. == $cmd))
      then .
      else .hooks.PostToolUse += [{
        "matcher": "Bash",
        "hooks": [{"type": "command", "command": $cmd}]
      }]
      end
    ' "$SETTINGS" > "$tmp" && mv "$tmp" "$SETTINGS"
    printf "  %b✓%b Installed post-git hook\n" "$GREEN" "$NC"
  else
    echo "  Add this entry to hooks.PostToolUse in $SETTINGS:"
    cat <<EOF
    {
      "matcher": "Bash",
      "hooks": [{ "type": "command", "command": "$POST_GIT_HOOK" }]
    }
EOF
  fi
else
  printf "  %bskipped%b\n" "$DIM" "$NC"
fi
echo

# ---- Step 4 ----
printf "%b[4/4]%b Auto-update PM Stack at the start of every Claude session\n" "$BLUE" "$NC"
echo
echo "  Why: when new skills land upstream, you'd otherwise have to"
echo "  git pull this repo and re-link by hand. This installs a"
echo "  SessionStart hook that does both for you, silently, every time"
echo "  you open Claude Code. --ff-only means your local unpushed"
echo "  commits in PM Stack are never disturbed."
echo

if confirm "  Install SessionStart auto-sync hook?"; then
  mkdir -p "$HOOKS_DIR"
  SYNC_SCRIPT="$HOOKS_DIR/sync-pm-stack.sh"
  cat > "$SYNC_SCRIPT" <<EOF
#!/bin/bash
# Auto-generated by PM Stack install.sh. Re-run install.sh to update.
set -uo pipefail
PM_STACK="$PM_STACK"
SKILLS_DIR="\$HOME/.claude/skills"
[ -d "\$PM_STACK/.git" ] && git -C "\$PM_STACK" pull --ff-only --quiet 2>/dev/null || true
mkdir -p "\$SKILLS_DIR"
if [ -d "\$PM_STACK/skills" ]; then
  for dir in "\$PM_STACK/skills/"*/; do
    [ -d "\$dir" ] || continue
    name=\$(basename "\$dir")
    ln -sfn "\$dir" "\$SKILLS_DIR/\$name"
  done
fi
find "\$SKILLS_DIR" -maxdepth 1 -type l ! -exec test -e {} \; -delete 2>/dev/null || true
exit 0
EOF
  chmod +x "$SYNC_SCRIPT"
  if [ "$HAS_JQ" = 1 ]; then
    ensure_settings_file
    backup_settings
    tmp=$(mktemp)
    jq --arg cmd "$SYNC_SCRIPT" '
      .hooks = (.hooks // {}) |
      .hooks.SessionStart = (.hooks.SessionStart // []) |
      if (.hooks.SessionStart
            | map(.hooks // [] | map(.command))
            | flatten
            | any(. == $cmd))
      then .
      else .hooks.SessionStart += [{
        "hooks": [{"type": "command", "command": $cmd}]
      }]
      end
    ' "$SETTINGS" > "$tmp" && mv "$tmp" "$SETTINGS"
    printf "  %b✓%b Installed sync script and SessionStart hook\n" "$GREEN" "$NC"
  else
    echo "  Sync script written to $SYNC_SCRIPT"
    echo "  Add this entry to hooks.SessionStart in $SETTINGS:"
    cat <<EOF
    {
      "hooks": [{ "type": "command", "command": "$SYNC_SCRIPT" }]
    }
EOF
  fi
else
  printf "  %bskipped%b\n" "$DIM" "$NC"
fi
echo

printf "%b" "$GREEN"
echo "==========================================="
echo "  Setup complete."
echo "==========================================="
printf "%b\n" "$NC"
echo "Open Claude Code in any project folder and type / to see your"
echo "PM Stack skills. Re-run ./install.sh any time — it's idempotent."
