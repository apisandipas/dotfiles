#!/bin/sh
PLAYERSTATUS=$(playerctl status)

if [[ "$PLAYERSTATUS" == "Paused" ]]; then
    echo ""
elif [[ "$PLAYERSTATUS" == "Playing" ]]; then
    echo ""
else
    echo "Something went wrong"
fi
