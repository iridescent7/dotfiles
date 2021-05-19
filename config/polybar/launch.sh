#!/bin/sh

. ~/.config/polybar/conf.sh

killall -q polybar
polybar --reload single &
