# status is-login && test -z $DISPLAY && test (tty) = "/dev/tty1" && exec startx -- -keeptty

functions -q fzf_key_bindings && fzf_key_bindings

# extended keys
set -l cTab \e\[9\;5u
set -l cEnter \e\[13\;5u
set -l sEnter \e\[13\;2u

bind -M default -M insert \cj history-search-forward
bind -M default -M insert \ck history-search-backward
bind -M insert $cTab accept-autosuggestion
bind -M insert $cEnter accept-autosuggestion and execute

starship init fish | source
