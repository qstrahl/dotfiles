# Executes commands at the start of an interactive session.

# load profiling module
zmodload zsh/zprof

# source prezto (if present)
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# aliases
alias sudo='sudo '
alias xvfb-run='xvfb-run -a -s "-screen 0 1920x1080x24" '
alias optirun='optirun '
alias primusrun='primusrun '
alias activator='activator -Duser.timezone=GMT -mem 2048'
alias record='asciinema rec'
alias trash='gvfs-trash'

if (( $+commands[tmuxifier] )); then
    eval "$(tmuxifier init -)"
    alias mux='tmuxifier'
fi

# shell options
setopt extendedglob
