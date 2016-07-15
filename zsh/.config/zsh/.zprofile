# vim: ft=sh

. "$HOME"/.profile

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# /etc/zshrc will forego doing a compinit if it sees this var; speeds up start time
export skip_global_compinit=1

# aliases
alias activator='activator -Duser.timezone=GMT -mem 2048'
alias ls='ls --group-directories-first --color=auto'
alias mux='tmuxifier'
alias optirun='optirun '
alias primusrun='primusrun '
alias record='asciinema rec'
alias sudo='sudo '
alias trash='gvfs-trash'
alias xvfb-run='xvfb-run -a -s "-screen 0 1920x1080x24" '
