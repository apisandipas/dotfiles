#!/usr/bin/env zsh

# Disabled CapsLock
setxkbmap -option ctrl:nocaps

# Assure the touchscreen input is mapped only to the laptop screen.
xinput map-to-output 20 'eDP-1'
