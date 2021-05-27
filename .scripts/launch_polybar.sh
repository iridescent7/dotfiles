#!/bin/sh

export BAR_MODULES_RIGHT="net-wireless sep audio sep memory sep cpu sep temperature sep battery"
export NET_WIRED_INTERFACE="$(ls /sys/class/net | grep -o 'enp.*')"

[ -n "$NET_WIRED_INTERFACE" ] && BAR_MODULES_RIGHT="net-wired ${BAR_MODULES_RIGHT}"

case "$1" in
    single)
        killall -q polybar
        polybar --reload single &
        ;;
    auto)
        killall -q polybar
        for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
            MONITOR=$m polybar --reload multi &
            sleep 1
        done
        ;;
    *)
        echo "Error: invalid polybar launch argument: $1"
        ;;
esac
