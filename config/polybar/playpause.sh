#!/bin/sh
PLAYERSTATUS=$(playerctl --player=spotify status)

if [[ "$PLAYERSTATUS" == "Paused" ]]; then
    echo ""
elif [[ "$PLAYERSTATUS" == "Playing" ]]; then
  echo ""
elif [[ "$PLAYERSTATUS" == "Stopped" ]]; then
  echo ""
else
    echo "Something went wrong"
fi
