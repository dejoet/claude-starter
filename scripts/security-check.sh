#!/bin/bash
# Hook: blokkeer gevaarlijke bash-commando's (PreToolUse)
INPUT=$(cat)
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // ""' 2>/dev/null)

# Pipe-naar-shell aanvallen
if printf %s "$COMMAND" | grep -qE '(curl|wget)[^|]*\|[[:space:]]*(sudo[[:space:]]+)?(ba)?sh'; then
  printf '{"hookSpecificOutput":{"hookEventName":"PreToolUse","permissionDecision":"deny","permissionDecisionReason":"Pipe-naar-shell aanval geblokkeerd (curl/wget | sh/bash)."}}\n'
  exit 2
fi

# rm -rf met wildcards op projectmappen
if printf %s "$COMMAND" | grep -qE 'rm -rf[[:space:]]+\.?/?(public|src|dist|build|node_modules)/\*'; then
  printf '{"hookSpecificOutput":{"hookEventName":"PreToolUse","permissionDecision":"deny","permissionDecisionReason":"Destructief rm -rf wildcard geblokkeerd."}}\n'
  exit 2
fi

# Destructieve SQL
if printf %s "$COMMAND" | grep -qiE '(DELETE[[:space:]]+FROM|TRUNCATE[[:space:]]+TABLE|DROP[[:space:]]+(TABLE|DATABASE))'; then
  printf '{"hookSpecificOutput":{"hookEventName":"PreToolUse","permissionDecision":"deny","permissionDecisionReason":"Destructieve SQL-opdracht geblokkeerd."}}\n'
  exit 2
fi

# Gevaarlijke chmod (777)
if printf %s "$COMMAND" | grep -qE 'chmod[[:space:]]+(-R[[:space:]]+)?777'; then
  printf '{"hookSpecificOutput":{"hookEventName":"PreToolUse","permissionDecision":"deny","permissionDecisionReason":"chmod 777 geblokkeerd (te ruim)."}}\n'
  exit 2
fi

# Probeer .env te lezen via cat/less/head/tail
if printf %s "$COMMAND" | grep -qE '(cat|less|head|tail|more)[[:space:]]+[^|]*\.env(\.|$|[[:space:]])'; then
  printf '{"hookSpecificOutput":{"hookEventName":"PreToolUse","permissionDecision":"deny","permissionDecisionReason":".env bestanden mogen niet via bash gelezen worden. Gebruik Read tool."}}\n'
  exit 2
fi

exit 0
