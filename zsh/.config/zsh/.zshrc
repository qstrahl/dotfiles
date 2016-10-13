# Executes commands at the start of an interactive session.

# load profiling module
zmodload zsh/zprof

# shell options
setopt extendedglob

# vim-surround-like keys
autoload -Uz surround
zle -N delete-surround surround
zle -N add-surround surround
zle -N change-surround surround
bindkey -a cs change-surround
bindkey -a ds delete-surround
bindkey -a ys add-surround
bindkey -M visual S add-surround

# vim-like quote text objects
autoload -Uz select-quoted
zle -N select-quoted
for m in visual viopp; do
  for c in {a,i}{\',\",\`}; do
    bindkey -M $m $c select-quoted
  done
done

# completion
autoload -U compinit edit-command-line
zle -N edit-command-line
compinit
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

# prompt
export PS1="%B%F{green}
┏━ %F{blue}%~%F{green}
┗ %f%b"

# tmuxifier init
if (( $+commands[tmuxifier] )); then
    eval "$(tmuxifier init -)"
fi

# history settings
export HISTFILE="$ZDOTDIR/.zhistory"
export HISTSIZE=1000
export SAVEHIST=100000
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history

# vi mode
bindkey -v

# insert mode keys
bindkey -v "\e[H"       vi-beginning-of-line            # home
bindkey -v "\e[F"       vi-end-of-line                  # end
bindkey -v "\e[1~"      vi-beginning-of-line            # home
bindkey -v "\e[4~"      vi-end-of-line                  # end
bindkey -v "\e[5~"      up-line                         # pageup
bindkey -v "\e[6~"      down-line                       # pagedown
bindkey -v "\e[1;5H"    vi-beginning-of-line            # ctrl-home
bindkey -v "\e[1;5F"    vi-end-of-line                  # ctrl-end
bindkey -v "\e[5;5~"    up-line                         # ctrl-pageup
bindkey -v "\e[6;5~"    down-line                       # ctrl-pagedown
bindkey -v "\e[1;2H"    vi-beginning-of-line            # shift-home
bindkey -v "\e[1;2F"    vi-end-of-line                  # shift-end
bindkey -v "\e[1;6H"    vi-beginning-of-line            # ctrl-shift-home
bindkey -v "\e[1;6F"    vi-end-of-line                  # ctrl-shift-end
bindkey -v "\e[32;2u"   magic-space                     # shift-space
bindkey -v "\e[32;6u"   magic-space                     # ctrl-shift-space
bindkey -v "^?"         backward-delete-char            # backspace
bindkey -v "^W"         backward-kill-word
bindkey -v "\e[127;5u"  backward-kill-word              # ctrl-backspace
bindkey -v "\e[127;2u"  backward-kill-word              # shift-backspace
bindkey -v "\e[127;6u"  backward-kill-word              # ctrl-shift-backspace
bindkey -v "^U"         backward-kill-line
bindkey -v "\e[13;5u"   vi-open-line-below              # ctrl-enter
bindkey -v "\e[13;2u"   vi-open-line-below              # shift-enter
bindkey -v "\e[13;6u"   vi-open-line-below              # ctrl-shift-enter
bindkey -v "^O"         edit-command-line
bindkey -v "\e[1;5A"    up-line                         # ctrl-up
bindkey -v "\e[1;5B"    down-line                       # ctrl-down
bindkey -v "\e[1;5C"    forward-word                    # ctrl-right
bindkey -v "\e[1;5D"    backward-word                   # ctrl-left
bindkey -v "\e[1;2A"    up-line                         # shift-up
bindkey -v "\e[1;2B"    down-line                       # shift-down
bindkey -v "\e[1;2C"    forward-word                    # shift-right
bindkey -v "\e[1;2D"    backward-word                   # shift-left
bindkey -v "\e[1;6A"    up-line                         # ctrl-shift-up
bindkey -v "\e[1;6B"    down-line                       # ctrl-shift-down
bindkey -v "\e[1;6C"    forward-word                    # ctrl-shift-right
bindkey -v "\e[1;6D"    backward-word                   # ctrl-shift-left

# cmd mode keys
bindkey -a "\e[H"       vi-beginning-of-line            # home
bindkey -a "\e[F"       vi-end-of-line                  # end
bindkey -a "\e[1~"      vi-beginning-of-line            # home
bindkey -a "\e[4~"      vi-end-of-line                  # end
bindkey -a "\e[5~"      up-line                         # pageup
bindkey -a "\e[6~"      down-line                       # pagedown
bindkey -v "\e[1;5H"    vi-beginning-of-line            # ctrl-home
bindkey -v "\e[1;5F"    vi-end-of-line                  # ctrl-end
bindkey -v "\e[5;5~"    up-line                         # ctrl-pageup
bindkey -v "\e[6;5~"    down-line                       # ctrl-pagedown
bindkey -v "\e[1;2H"    vi-beginning-of-line            # shift-home
bindkey -v "\e[1;2F"    vi-end-of-line                  # shift-end
bindkey -v "\e[1;6H"    vi-beginning-of-line            # ctrl-shift-home
bindkey -v "\e[1;6F"    vi-end-of-line                  # ctrl-shift-end
bindkey -a "\e[32;2u"   magic-space                     # shift-space
bindkey -a "\e[32;6u"   magic-space                     # ctrl-shift-space
bindkey -a "^?"         backward-char                   # backspace
bindkey -a "\e[127;5u"  backward-word                   # ctrl-backspace
bindkey -a "\e[127;2u"  backward-word                   # shift-backspace
bindkey -a "\e[127;6u"  backward-word                   # ctrl-shift-backspace
bindkey -a "\e[13;5u"   vi-open-line-below              # ctrl-enter
bindkey -a "\e[13;2u"   vi-open-line-below              # shift-enter
bindkey -a "\e[13;6u"   vi-open-line-below              # ctrl-shift-enter
bindkey -a "^O"         edit-command-line
bindkey -a "\`"         vi-backward-word-end
bindkey -a "~"          vi-backward-blank-word-end
bindkey -a "U"          vi-swap-case
bindkey -a "j"          down-line
bindkey -a "k"          up-line
bindkey -a "\e[1;5A"    up-line                         # ctrl-up
bindkey -a "\e[1;5B"    down-line                       # ctrl-down
bindkey -a "\e[1;5C"    forward-word                    # ctrl-right
bindkey -a "\e[1;5D"    backward-word                   # ctrl-left
bindkey -a "\e[1;2A"    up-line                         # shift-up
bindkey -a "\e[1;2B"    down-line                       # shift-down
bindkey -a "\e[1;2C"    forward-word                    # shift-right
bindkey -a "\e[1;2D"    backward-word                   # shift-left
bindkey -a "\e[1;6A"    up-line                         # ctrl-shift-up
bindkey -a "\e[1;6B"    down-line                       # ctrl-shift-down
bindkey -a "\e[1;6C"    forward-word                    # ctrl-shift-right
bindkey -a "\e[1;6D"    backward-word                   # ctrl-shift-left

# autopair
source "$ZDOTDIR/zsh-autopair/autopair.zsh"

# history substring search
source "$ZDOTDIR/zsh-history-substring-search/zsh-history-substring-search.zsh"
zmodload zsh/terminfo

bindkey -v "\e[A"       history-substring-search-up     # up
bindkey -v "^K"         history-substring-search-up     # ctrl-k
bindkey -v "\e[B"       history-substring-search-down   # down
bindkey -v "\e[106;5u"  history-substring-search-down   # ctrl-j

bindkey -a "\e[A"       history-substring-search-up     # up
bindkey -a "^K"         history-substring-search-up     # ctrl-k
bindkey -a "\e[B"       history-substring-search-down   # down
bindkey -a "\e[106;5u"  history-substring-search-down   # ctrl-j

# syntax highlighting
source "$ZDOTDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
