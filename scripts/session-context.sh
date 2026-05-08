#!/bin/bash
# Hook: injecteer projectcontext bij elke prompt (UserPromptSubmit)
PROJECT=$(basename "$(pwd)")
BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo "geen-git")
CHANGED=$(git status --short 2>/dev/null | wc -l | tr -d ' ')

MSG="Project: $PROJECT | Branch: $BRANCH | Gewijzigd: $CHANGED bestand(en)
Conventies: CLAUDE.md"

jq -n --arg msg "$MSG" '{"hookSpecificOutput":{"hookEventName":"UserPromptSubmit","additionalContext":$msg}}'
exit 0
