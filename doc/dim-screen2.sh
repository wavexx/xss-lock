#!/bin/bash

# Fade the screen and wait. Needs xbacklight.
# When receiving SIGHUP, stop fading and set backlight to original brightness.
# When receiving SIGTERM, wait a bit, and set backlight to original brightness
# (this prevents the screen from flashing before it is turned completely off
# by DPMS in the locker command).

min_brightness=30
fade_time=2000
fade_steps=70

BRIGHTNESS=$(xbacklight -get)
trap "xbacklight -set $BRIGHTNESS" EXIT
trap 'kill %%; exit 0' HUP
trap 'sleep 1s; kill %%; exit 0' TERM

xbacklight -time $fade_time -steps $fade_steps -set $min_brightness &
wait
sleep infinity & # No, sleeping in the foreground does not work
wait
