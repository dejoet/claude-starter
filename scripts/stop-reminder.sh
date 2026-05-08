#!/bin/bash
# Hook: end-of-session reminder (Stop hook)
CHANGES=$(git status --short 2>/dev/null | wc -l | tr -d ' ')

if [[ "$CHANGES" -gt 0 ]]; then
  MSG="REMINDER: $CHANGES uncommitted bestand(en) aanwezig.

Vóór afsluiten:
  1. npx prettier --write <gewijzigde bestanden>
  2. npm run lint
  3. npm run audit:ci
  4. npm test
  5. git commit met conventional message + Co-Authored-By"
else
  MSG="Geen uncommitted changes — sessie afgerond."
fi

jq -n --arg msg "$MSG" '{"hookSpecificOutput":{"hookEventName":"Stop","additionalContext":$msg}}'
exit 0
