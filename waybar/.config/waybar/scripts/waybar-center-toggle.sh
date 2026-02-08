#!/usr/bin/env bash
# waybar-center-toggle.sh — flip between clock (c) and media (m) modes
set -euo pipefail

STATE_FILE="${XDG_RUNTIME_DIR:-/tmp}/waybar-center-state"

if [[ "$(cat "$STATE_FILE" 2>/dev/null)" == "c" ]]; then
    echo "m" > "${STATE_FILE}.tmp" && mv "${STATE_FILE}.tmp" "$STATE_FILE"
else
    echo "c" > "${STATE_FILE}.tmp" && mv "${STATE_FILE}.tmp" "$STATE_FILE"
fi

pkill -RTMIN+10 waybar
