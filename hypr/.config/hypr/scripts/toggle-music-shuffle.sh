#!/usr/bin/env sh

playerctl shuffle "Toggle"
sleep 1
STATUS=$(playerctl shuffle)
notify-send "Music Player Toggle State Changed" "Toggle Status $STATUS"
