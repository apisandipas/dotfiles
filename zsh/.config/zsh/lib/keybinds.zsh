#!/usr/bin/env zsh

# Disabled CapsLock
if [ "$XDG_SESSION_TYPE" = "x11" ]; then
  setxkbmap -option ctrl:nocaps
fi
