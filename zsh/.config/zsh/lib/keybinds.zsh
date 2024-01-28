#!/usr/bin/env zsh

<<<<<<< HEAD
# Disabled CapsLock
if [ "$XDG_SESSION_TYPE" = "x11" ]; then
  setxkbmap -option ctrl:nocaps
=======
if [ "$XDG_SESSION_TYPE" = "x11" ]; then
  setxkbmap -option ctrl:nocaps;
>>>>>>> 08ff1b3 (updates to galactus)
fi
