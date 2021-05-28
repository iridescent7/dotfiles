#!/bin/sh

DPI="$1"

# Sanity checks
if ! [ "$DPI" -eq "$DPI" -a "$DPI" -ge 96 -a "$DPI" -le 480 ] 2>/dev/null; then
    echo "Error: invalid DPI amount: $DPI" >&2
    exit 1
fi

XRESOURCES="$HOME/.Xresources"
CONFIG_POLYBAR="$HOME/.config/polybar/config"
CONFIG_ROFI="$HOME/.config/rofi/config.rasi"
WINE_REG="$HOME/.wine/user.reg"

set_config() {
    sed -i "s/^\(\s*$2\s*[:=]\s*\).*$/\1$3/g" "$1"
}

scale_px() {
    echo "scale=2;$1/96*$2" | bc | awk '{printf "%0.f", $0}'
}

# persist over X restarts / reboots
set_config $XRESOURCES 'Xft.dpi' $DPI

# Polybar
set_config $CONFIG_POLYBAR 'dpi' $DPI
set_config $CONFIG_POLYBAR 'height' "$(scale_px $DPI 20)"

# Rofi
set_config $CONFIG_ROFI 'dpi' "$DPI;" "$HOME/.config/rofi/config.rasi"
set_config $CONFIG_ROFI 'width' "$(scale_px $DPI 30);" 

# Wine
set_config $WINE_REG '"LogPixels"' "dword:$(printf '%08x' $DPI)"

# Xorg
echo "Xft.dpi: $DPI" | xrdb -merge

# i3
i3-msg -q restart
