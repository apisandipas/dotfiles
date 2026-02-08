#!/usr/bin/env bash
# waybar-cava.sh — long-running cava-to-unicode bridge for waybar
set -uo pipefail

STATE_FILE="${XDG_RUNTIME_DIR:-/tmp}/waybar-center-state"
CAVA_CFG="${XDG_RUNTIME_DIR:-/tmp}/waybar-cava-config"
BARS=("▁" "▂" "▃" "▄" "▅" "▆" "▇" "█")

# Write a minimal cava config for raw ASCII output
cat > "$CAVA_CFG" << 'EOF'
[general]
bars = 8
framerate = 30
autosens = 1
sensitivity = 100

[output]
method = raw
raw_target = /dev/stdout
data_format = ascii
ascii_max_range = 7
EOF

# Run cava, process each line
cava -p "$CAVA_CFG" 2>/dev/null | while IFS=';' read -ra values; do
    # Check state — only output in media mode
    mode="c"
    [[ -f "$STATE_FILE" ]] && mode=$(cat "$STATE_FILE")

    if [[ "$mode" != "m" ]]; then
        echo '{"text": "", "class": "hidden"}'
        continue
    fi

    output=""
    for val in "${values[@]}"; do
        val=${val//[^0-9]/}
        [[ -z "$val" ]] && continue
        [[ $val -gt 7 ]] && val=7
        output+="${BARS[$val]}"
    done

    echo "{\"text\": \"${output}\", \"class\": \"active\"}"
done
