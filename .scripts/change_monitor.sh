#!/bin/sh

LAPTOP='eDP-1'
HDMI='HDMI-1'

reload_polybar() {
    $HOME/.scripts/launch_polybar.sh $1
}

case "$1" in
    laptop)
        xrandr --output $LAPTOP --primary --auto --output $HDMI --off
        reload_polybar single
        ;;
    hdmi)
        xrandr --output $HDMI --primary --auto --output $LAPTOP --off
        reload_polybar single
        ;;
    mirror)
        xrandr --output $LAPTOP --primary --auto --output $HDMI --same-as $LAPTOP --auto
        reload_polybar single
        ;;
    extend_left)
        # quick fix until i figure out what's stopping i3 from
        # recognizing which monitor should be primary
        xrandr --output $LAPTOP --auto --output $HDMI --off
        xrandr --output $LAPTOP --primary --auto --output $HDMI --left-of $LAPTOP --auto
        reload_polybar auto
        ;;
    extend_right)
        xrandr --output $LAPTOP --auto --output $HDMI --off
        xrandr --output $LAPTOP --primary --auto --output $HDMI --right-of $LAPTOP --auto
        reload_polybar auto
        ;;
    reverse_extend_left)
        xrandr --output $HDMI --auto --output $LAPTOP --off
        xrandr --output $HDMI --primary --auto --output $LAPTOP --left-of $HDMI --auto
        reload_polybar auto
        ;;
    reverse_extend_right)
        xrandr --output $HDMI --auto --output $LAPTOP --off
        xrandr --output $HDMI --primary --auto --output $LAPTOP --right-of $HDMI --auto
        reload_polybar auto
        ;;
    -h|--help)
        echo "Usage: ${0##*/} (laptop|hdmi|mirror|[reverse_]extend_{left,right})"
        ;;
    "")
        echo "No argument provided, see -h or --help for help."
        ;;
    *)
        echo "Error: invalid argument '$1', see -h or --help for help."
        ;;
esac
