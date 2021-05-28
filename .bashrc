# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

for cmd in diff grep ip ls; do
    alias $cmd="$cmd --color=auto"
done

PS1='\[\e[36m\]\w\[\e[0m\] \$ '
