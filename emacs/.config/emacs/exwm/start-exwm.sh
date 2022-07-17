#!/bin/sh
# Set the screen DPI (uncomment this if needed!)
# xrdb ~/.emacs.d/exwm/Xresources

xautolock -time 120 -locker 'betterlockscreen -l dim' &

# Make it pretty.
picom -b --config ~/.config/emacs/exwm/picom.conf

# Disable access control for the current user.
xhost +SI:localuser:$USER

# Make Java applications aware this is a non-reparenting window manager.
export _JAVA_AWT_WM_NONREPARENTING=1

# Set default cursor.
xsetroot -cursor_name left_ptr

# Set keyboard repeat rate.
# xset r rate 200 60

# Finally start Emacs
exec emacs -mm --debug-init --with-profile custom -l ~/.config/emacs/exwm/desktop.el
