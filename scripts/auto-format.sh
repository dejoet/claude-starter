#!/bin/bash
# Hook: automatische formatting na Write/Edit (PostToolUse)
# JS/TS → Biome (snel), HTML/CSS/JSON/MD → Prettier
INPUT=$(cat)
FILE=$(echo "$INPUT" | jq -r '.tool_input.file_path // .tool_response.filePath // ""' 2>/dev/null)

if [[ -z "$FILE" || ! -f "$FILE" ]]; then
  exit 0
fi

case "$FILE" in
  *.js|*.ts|*.jsx|*.tsx)
    npx biome format --write "$FILE" 2>/dev/null || npx prettier --write "$FILE" 2>/dev/null || true
    ;;
  *.html|*.css|*.json|*.md|*.yaml|*.yml)
    npx prettier --write "$FILE" 2>/dev/null || true
    ;;
esac

exit 0
