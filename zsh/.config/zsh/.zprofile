# vim: ft=sh

. "$HOME"/.profile

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# /etc/zshrc will forego doing a compinit if it sees this var; speeds up start time
export skip_global_compinit=1
