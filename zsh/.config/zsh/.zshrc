# Executes commands at the start of an interactive session.

# load profiling module
zmodload zsh/zprof

# shell options
setopt extendedglob

# completion
autoload -U compinit
compinit
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

# prompt
export PS1="%B%F{green}
┏━ %F{blue}%~%F{green}
┗ %f%b"

if (( $+commands[tmuxifier] )); then
    eval "$(tmuxifier init -)"
fi

# history substring search
source "$ZDOTDIR/zsh-history-substring-search/zsh-history-substring-search.zsh"
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
