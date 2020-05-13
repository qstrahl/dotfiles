status is-login && test -z $DISPLAY && test (tty) = "/dev/tty1" && exec startx -- -keeptty

functions -q fzf_key_bindings && fzf_key_bindings
bind -M default -M insert \cj history-search-forward
bind -M default -M insert \ck history-search-backward

starship init fish | source
