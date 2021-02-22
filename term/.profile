# vim: ft=sh
[[ -f "$HOME/.config/base16-shell/base16-twilight.sh" ]] && source "$HOME/.config/base16-shell/base16-twilight.sh"
# The one and only
export EDITOR="$(command -v nvim || command -v vim || command -v vi)"
export VISUAL="$EDITOR"
export BROWSER="w3m"
export PAGER="$(command -v bat || command -v less || command -v more)"
export MANPAGER="$PAGER"
export TERMINAL="xterm"
export COLORTERM="truecolor"
export LESS="-F -g -i -M -Q -R -S -z-2 --mouse --no-histdups --rscroll=*n- --wheel-lines=1"
export RIPGREP_CONFIG_PATH="$HOME/.config/ripgreprc"
export FZF_DEFAULT_OPTS="--inline-info"
fd="fd -HI --exclude .git -t f"
export FZF_DEFAULT_COMMAND="$fd -t f"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat {}'"
export FZF_ALT_C_COMMAND="$fd -t d"

# Include per-user bins
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

if command -v ruby >/dev/null && command -v gem >/dev/null; then
  # Set user-local GEM_HOME
  export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"

  # Add gem bins in path
  export PATH="$GEM_HOME/bin:$PATH"
fi

# # Add npm bins to path
# NPMPATH="$HOME/.npm/bin"
# if [[ -d "$NPMPATH" ]]
# if command -v npm >/dev/null; then
#   export PATH="$HOME/.npm/bin:$PATH"

#   # Unset manpath so we can inherit from /etc/manpath via the `manpath` command
#   unset MANPATH
#   export MANPATH="$HOME/.npm/share/man:$(manpath)"
# fi

export TERMINFO_DIRS="$HOME/.terminfo:$TERMINFO_DIRS"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

if command -v npm >/dev/null 2>&1; then
  export PATH="$(npm bin -g 2>/dev/null):$PATH"
  if [[ -z "$NODE_PATH" ]]; then
    export NODE_PATH="$(npm root -g)"
  fi
fi

export NODE_ENV="development"

# Remove duplicate entries from environment vars in case of multiple login shells
if command -v tr >/dev/null && command -v paste >/dev/null && command -v sort >/dev/null; then
  for i in PATH TERMINFO_DIRS; do
    export $i="$( eval echo "\$$i" | tr ':' '\n' | sort -u | paste -sd: )"
  done
fi

# aliases
alias activator='activator -Duser.timezone=GMT -mem 2048'
alias fuck='sudo $(fc -ln -1)'
alias git='noglob git'
alias irc='mosh qstrahl.com tmux a'
alias ls='ls --group-directories-first --color=auto'
alias nox='xvfb-run '
alias optirun='optirun '
alias primusrun='primusrun '
alias record='asciinema rec'
alias scut='cut -d" " -f'
alias sudo='sudo '
alias trash='gvfs-trash'
alias xvfb-run='xvfb-run -a -s "-screen 0 1920x1080x24" '

# stupid virtualbox and its stupid crap
alias fixvbox='killall VBoxClient && VBoxClient-all'

alias xrdbm="xrdb -merge "

# unfortunately necessary to make some xdg stuff work
export DE="gnome"
export GDK_SCALE=1

# automatically start x on login
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  exec startx
fi
