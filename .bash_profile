# .bash_profile

export PATH="$PATH:$HOME/.local/bin"
export EDITOR='nvim'

# Get the aliases and functions
[ -f $HOME/.bashrc ] && . $HOME/.bashrc

# Autostart X on display and tty1
if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
	startx &> /dev/null
fi
