# .bash_profile

export PATH="$PATH:$HOME/.local/bin"
export EDITOR='nvim'

export SUDO_ASKPASS='/usr/bin/gnome-ssh-askpass'
export QT_AUTO_SCREEN_SCALE_FACTOR=1

# Get the aliases and functions
[ -f $HOME/.bashrc ] && . $HOME/.bashrc

# Autostart X on display and tty1
if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
	startx &> /dev/null
fi
