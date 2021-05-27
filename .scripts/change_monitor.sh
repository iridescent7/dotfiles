#!/bin/sh

LAPTOP='eDP-1'
HDMI='HDMI-1'

LAPTOP_DPI=120
HDMI_DPI=96

update() {
    killall -q polybar
    $HOME/.scripts/set_dpi.sh $1
    $HOME/.scripts/launch_polybar.sh $2
}

case "$1" in
    laptop)
        xrandr --output $LAPTOP --primary --auto --output $HDMI --off
        update $LAPTOP_DPI single
        ;;
    hdmi)
        xrandr --output $HDMI --primary --auto --output $LAPTOP --off
        update $HDMI_DPI single
        ;;
    mirror)
        xrandr --output $LAPTOP --primary --auto --output $HDMI --same-as $LAPTOP --auto
        update $LAPTOP_DPI single
        ;;
    extend_left)
        # quick fix until i figure out what's stopping i3 from
        # recognizing which monitor should be primary
        xrandr --output $LAPTOP --auto --output $HDMI --off
        xrandr --output $LAPTOP --primary --auto --output $HDMI --left-of $LAPTOP --auto
        update $LAPTOP_DPI auto
        ;;
    extend_right)
        xrandr --output $LAPTOP --auto --output $HDMI --off
        xrandr --output $LAPTOP --primary --auto --output $HDMI --right-of $LAPTOP --auto
        update $LAPTOP_DPI auto
        ;;
    reverse_extend_left)
        xrandr --output $HDMI --auto --output $LAPTOP --off
        xrandr --output $HDMI --primary --auto --output $LAPTOP --left-of $HDMI --auto
        update $HDMI_DPI auto
        ;;
    reverse_extend_right)
        xrandr --output $HDMI --auto --output $LAPTOP --off
        xrandr --output $HDMI --primary --auto --output $LAPTOP --right-of $HDMI --auto
        update $HDMI_DPI auto
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
