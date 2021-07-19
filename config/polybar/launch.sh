
#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar

if [[ $(xrandr -q | grep 'HDMI1 connected') ]]; then
	MONITOR='eDP1' polybar --reload docked_internal &
	MONITOR='HDMI1' polybar --reload docked_external &
else
	MONITOR='eDP1' polybar --reload undocked_internal &
fi

