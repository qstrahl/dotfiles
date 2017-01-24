# Executes commands at the start of an interactive session.

# load profiling module
# zmodload zsh/zprof

# load builtin "plugins"
autoload -U <<END
  surround
  select-quoted
  edit-command-line
END

# load antigen plugins
source "$ZDOTDIR/antigen/bin/antigen.zsh"
antigen bundles <<END
  mafredri/zsh-async
  sindresorhus/pure
  hlissner/zsh-autopair
  zsh-users/zsh-autosuggestions
  zsh-users/zsh-completions
  zsh-users/zsh-history-substring-search
  zsh-users/zsh-syntax-highlighting
END

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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
