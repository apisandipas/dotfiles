
. $ZDOTDIR/.zprofile

xhost +SI:localuser:$USER

export _JAVA_SWT_WM_NONREPARENTING=1

xrdb -merge ~/.Xresources

xset -b

xautolock -time 120 &

picom -b --config ~/.doom.d/exwm/picom.conf
#polybar -c ~/.doom.d/exwm/polybar.config.ini --reload main &

exec emacs -mm --debug-init -l ~/.doom.d/exwm/desktop.el
#.doom.d/exwm/start-exwm.sh
