# Executes commands at the start of an interactive session.

# load profiling module
# zmodload zsh/zprof

# load builtin "plugins"
autoload -Uz bracketed-paste-magic
autoload -Uz edit-command-line
autoload -Uz select-bracketed
autoload -Uz select-quoted
autoload -Uz surround

# load antigen plugins
source "$ZDOTDIR/antigen/bin/antigen.zsh"
bundles=(
  asdf
  mafredri/zsh-async
  sindresorhus/pure
  hlissner/zsh-autopair
  zsh-users/zsh-autosuggestions
  zsh-users/zsh-completions
  zsh-users/zsh-history-substring-search
  zsh-users/zsh-syntax-highlighting
)
for bundle in $bundles; do antigen bundle "$bundle"; done

# pairs text objects
zle -N select-bracketed
for m in visual viopp; do
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
    bindkey -M $m $c select-bracketed
  done
done

# bracketed paste magic!
zle -N bracketed-paste bracketed-paste-magic

# vim-surround-like keys
zle -N delete-surround surround
zle -N add-surround surround
zle -N change-surround surround
bindkey -a cs change-surround
bindkey -a ds delete-surround
bindkey -a ys add-surround
bindkey -M visual S add-surround

# vim-like quote text objects
zle -N select-quoted
for m in visual viopp; do
  for c in {a,i}{\',\",\`}; do
    bindkey -M $m $c select-quoted
  done
done

# edit the current zsh command line in $EDITOR
zle -N edit-command-line

# extended globbing is good
setopt extendedglob

# history settings
export HISTFILE="$ZDOTDIR/.zhistory"
export HISTSIZE=1000
export SAVEHIST=100000
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_find_no_dups
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_save_no_dups
setopt hist_verify
setopt inc_append_history
setopt share_history

# tmuxifier
if (( $+commands[tmuxifier] )); then
  eval "$(tmuxifier init -)"
fi

# custom keys (mostly for pangoterm)
source "$ZDOTDIR/.keys"

# apply loaded antigen bundles
antigen apply

# autosuggestions config
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=0'

# 0 -- vanilla completion (abc => abc)
# 1 -- smart case completion (abc => Abc)
# 2 -- word flex completion (abc => A-big-Car)
# 3 -- full flex completion (abc => ABraCadabra)
zstyle ':completion:*' matcher-list '' \
  'm:{a-z\-}={A-Z\_}' \
  'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
  'r:|?=** m:{a-z\-}={A-Z\_}'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Set cursor shape (blinking block)
tput Ss 1
