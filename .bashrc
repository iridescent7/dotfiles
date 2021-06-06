# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='\[\e[36m\]\w\[\e[0m\] \$ '

alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip --color=auto'
alias ls='ls --color=auto'
