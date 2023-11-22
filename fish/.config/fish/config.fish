# status is-login && test -z $DISPLAY && test (tty) = "/dev/tty1" && exec startx -- -keeptty

if status is-interactive

  # fzf keys, maybe
  functions -q fzf_key_bindings && fzf_key_bindings

  # extended keys
  set -l cTab \e\[9\;5u
  set -l cEnter \e\[13\;5u
  set -l sEnter \e\[13\;2u

  bind -M default -M insert \cj history-search-forward
  bind -M default -M insert \ck history-search-backward
  bind -M insert $cTab accept-autosuggestion
  bind -M insert $sEnter accept-autosuggestion
  bind -M insert $cEnter accept-autosuggestion

  # cursor shape
  set -g fish_cursor_default block blink
  set -g fish_cursor_insert line blink
  set -g fish_cursor_replace_one underscore blink
  set -g fish_cursor_visual block blink

  fish_theme_mine

  starship init fish | source
end
