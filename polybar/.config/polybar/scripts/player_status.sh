#!/usr/bin/env sh
PLAYER='spotify'
PLAYERCTL_STATUS=$(playerctl --player=$PLAYER status 2>/dev/null)
if [[ $PLAYERCTL_STATUS = "Playing" ]]; then
	echo " ";
else echo "";
fi;

