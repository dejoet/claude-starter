#!/bin/bash
# Hook: bij Edit/Write reminder welk deeldoc relevant is (PreToolUse)
#
# OPTIONEEL — alleen activeren als project deeldocs gebruikt in docs/.
# Pas de mapping hieronder aan op je eigen project-structuur.

INPUT="$(cat)"
FILE_PATH="$(echo "$INPUT" | jq -r '.tool_input.file_path // ""' 2>/dev/null)"

[ -z "$FILE_PATH" ] && exit 0

# === MAPPING: pas aan per project ===
case "$FILE_PATH" in
  */src/dashboard/*)        DEEL="dashboard.md" ;;
  */src/api/*)              DEEL="api.md" ;;
  */src/components/*)       DEEL="components.md" ;;
  # Voeg eigen mappings toe...
  *) exit 0 ;;
esac

cat >&2 <<EOF
📖 Deeldoc-herinnering: dit bestand valt onder \`docs/$DEEL\`.
   Lees het deeldoc indien nog niet gedaan in deze sessie.
   Update het bij architecturale wijzigingen.
EOF

exit 0
