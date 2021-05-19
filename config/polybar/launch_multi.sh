#!/bin/sh

. ~/.config/polybar/conf.sh

killall -q polybar

for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload multi &
    sleep 1
done
