# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='\[\e[36m\]\w\[\e[0m\] \$ '

alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip --color=auto'
alias ls='ls --color=auto'

# Load pyenv and nvm on demand to avoid unnecessary startup overhead
load() {
    case "$1" in
        pyenv)
            if [ -z "$PYENV_ROOT" ]; then
                export PYENV_ROOT="$HOME/.pyenv"
                export PATH="$PYENV_ROOT/bin:$PATH"

                # tell dumbware to shut the fuck up
                export PYENV_VIRTUALENV_DISABLE_PROMPT=1

                # leave problems to our users since we dont care
                export OLD_PS1="$PS1"
                export PROMPT_COMMAND='[ -n "$VIRTUAL_ENV" ] && PS1="(${VIRTUAL_ENV##*/}) $OLD_PS1" || PS1="$OLD_PS1"'

                eval "$(pyenv init --path)"
                eval "$(pyenv init -)"
                eval "$(pyenv virtualenv-init -)"

                [ "$2" != '--silent' ] && echo 'pyenv loaded'
            fi
            ;;
        nvm)
            if [ -z "$NVM_DIR" ]; then
                export NVM_DIR="$HOME/.nvm"

                [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

                [ "$2" != '--silent' ] && echo 'nvm loaded'
            fi
            ;;
        *)
            echo 'load: unknown argument'
            ;;
    esac
}

pyenv() {
    unset -f pyenv
    load pyenv --silent
    pyenv "$@"
}

nvm() {
    unset -f nvm
    load nvm --silent
    nvm "$@"
}
