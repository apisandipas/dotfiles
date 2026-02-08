#!/usr/bin/env bash
# waybar-center.sh — outputs clock or media JSON based on toggle state
set -uo pipefail

STATE_FILE="${XDG_RUNTIME_DIR:-/tmp}/waybar-center-state"
MAX_MEDIA_WIDTH=25
SCROLL_PAD="   ·   "

# Default to clock mode
[[ ! -f "$STATE_FILE" ]] && echo "c" > "$STATE_FILE"

mode=$(cat "$STATE_FILE")

# Scroll long text using a time-based offset (shifts every 2s)
scroll_text() {
    local text="$1" max="$2"
    if [[ ${#text} -le $max ]]; then
        echo "$text"
        return
    fi
    local looped="${text}${SCROLL_PAD}${text}"
    local total=$(( ${#text} + ${#SCROLL_PAD} ))
    local offset=$(( $(date +%s) / 2 % total ))
    echo "${looped:$offset:$max}"
}

clock_output() {
    text=$(date +'󰥔  %a %d %b   %H:%M')
    tooltip=$(date +'%A, %B %d %Y  —  %H:%M:%S')
    jq -cn --arg t "$text" --arg tt "$tooltip" \
        '{"text": $t, "tooltip": $tt, "class": "clock"}'
}

media_output() {
    # Try MPD first — capture once to avoid races and repeated subprocesses
    local mpc_out
    mpc_out=$(mpc status 2>/dev/null) || true

    if echo "$mpc_out" | grep -q '\[playing\]\|\[paused\]'; then
        status=$(echo "$mpc_out" | sed -n '2s/.*\[\(.*\)\].*/\1/p')
        current=$(mpc current -f '%title%')
        artist=$(mpc current -f '%artist%')
        elapsed=$(echo "$mpc_out" | sed -n '2s/.*#[0-9]*\/[0-9]*\s\+//;2s/\/.*//;2p')
        total=$(echo "$mpc_out" | sed -n '2s/.*\///;2s/\s*(.*//;2p')
        times="${elapsed}/${total}"

        # Build progress bar (10 segments)
        pct=$(echo "$mpc_out" | sed -n '2s/.*(\([0-9]*\)%).*/\1/p')
        pct=${pct:-0}
        filled=$(( pct / 10 ))
        empty=$(( 10 - filled ))
        bar=""
        for ((i=0; i<filled; i++)); do bar+="━"; done
        for ((i=0; i<empty; i++)); do bar+="─"; done

        if [[ "$status" == "playing" ]]; then
            icon="󰎈"
            class="media-playing"
        else
            icon="󰏤"
            class="media-paused"
        fi

        # Scroll the song/artist portion if too long
        media_info="${current}  ${artist}"
        media_info=$(scroll_text "$media_info" "$MAX_MEDIA_WIDTH")

        text="${icon}  ${media_info}  ${bar} ${times}"
        tooltip="${artist} — ${current}\n${times}  (${pct}%)"

        jq -cn --arg t "$text" --arg tt "$tooltip" --arg c "$class" \
            '{"text": $t, "tooltip": $tt, "class": $c}'
        return
    fi

    # Fallback: playerctl (browser media, etc.)
    local p_status
    p_status=$(playerctl status 2>/dev/null) || true

    if [[ "$p_status" == "Playing" || "$p_status" == "Paused" ]]; then
        p_title=$(playerctl metadata title 2>/dev/null) || true
        p_artist=$(playerctl metadata artist 2>/dev/null) || true

        if [[ "$p_status" == "Playing" ]]; then
            icon="󰎈"
            class="media-playing"
        else
            icon="󰏤"
            class="media-paused"
        fi

        media_info="${p_title}  ${p_artist}"
        media_info=$(scroll_text "$media_info" "$MAX_MEDIA_WIDTH")

        text="${icon}  ${media_info}"
        tooltip="${p_artist} — ${p_title}"

        jq -cn --arg t "$text" --arg tt "$tooltip" --arg c "$class" \
            '{"text": $t, "tooltip": $tt, "class": $c}'
        return
    fi

    # Nothing playing
    jq -cn '{"text": "󰎊  Nothing playing", "tooltip": "No media active", "class": "media-idle"}'
}

if [[ "$mode" == "m" ]]; then
    media_output
else
    clock_output
fi
