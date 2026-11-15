#!/usr/bin/env bash

set -euo pipefail

RAYCAST_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_FILE="$RAYCAST_DIR/window-management.rayconfig"

if [ ! -s "$BACKUP_FILE" ]; then
    echo "Raycast backup not found: $BACKUP_FILE" >&2
    exit 1
fi

# Raycast owns the encrypted hotkey storage. Use its importer rather than
# writing guessed defaults keys or replacing its live settings database.
echo "Opening the Raycast settings backup..."
echo "Enter your export passphrase and select only Settings, Aliases & Hotkeys."
echo "Finish importing in Raycast; opening the backup does not complete the import."
open -a Raycast "$BACKUP_FILE"
