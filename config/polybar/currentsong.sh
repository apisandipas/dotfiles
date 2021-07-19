#!/bin/sh

player_status=$(playerctl --player=spotify status 2> /dev/null)
artist=$(playerctl --player=spotify metadata artist)
song_title=$(playerctl --player=spotify metadata title)
trunc_song_title="${song_title:0:30}"

if [ "$player_status" = "Playing" ]; then
    echo "  $artist - $trunc_song_title…"
elif [ "$player_status" = "Paused" ]; then
    echo "[||] $artist - $trunc_song_title…"
elif [ "$player_status" = "Stopped" ]; then
  echo "[[]] Stopped: $artist - $trunc_song_title…"
else
    echo "Something went wrong: $player_status"
fi
