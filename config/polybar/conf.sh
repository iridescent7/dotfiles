export BAR_MODULES_RIGHT="net-wireless sep audio sep memory sep cpu sep temperature sep battery"
export NET_WIRED_INTERFACE="$(ls /sys/class/net | grep -o 'enp.*')"

[ -n "$NET_WIRED_INTERFACE" ] && BAR_MODULES_RIGHT="net-wired ${BAR_MODULES_RIGHT}"
