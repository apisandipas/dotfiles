#!/bin/sh

player_status=$(playerctl --player=spotify status 2> /dev/null)
artist=$(playerctl --player=spotify metadata artist)
song_title=$(playerctl --player=spotify metadata title)

if [ "$player_status" = "Playing" ]; then
    echo "  $artist - $song_title"
elif [ "$player_status" = "Paused" ]; then
    echo "Paused: $artist - $song_title"
elif [ "$player_status" = "Stopped" ]; then
  echo "Stopped: $artist - $song_title"
else
    echo "Something went wrong: $player_status"
fi
