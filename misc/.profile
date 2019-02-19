# vim: ft=sh

# The one and only
export EDITOR="$(command -v nvim || command -v vim || command -v vi)"
export VISUAL="$EDITOR"
export PAGER="$(command -v less || command -v more)"

export TERMINAL="xterm"

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# FZF config
# Solarized colors
export FZF_DEFAULT_OPTS="
  --color=bg+:#073642,bg:#002b36,spinner:#859900,hl:#b58900
  --color=fg:#839496,header:#586e75,info:#cb4b16,pointer:#839496
  --color=marker:#859900,fg+:#839496,prompt:#859900,hl+:#b58900
"
export FZF_DEFAULT_COMMAND="rg -uu -g '!.git' -l ''"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

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
alias scut='cut -d" " -f'
alias fuck='sudo $(fc -ln -1)'
alias irc='mosh qstrahl.com tmux a'
alias ls='ls --group-directories-first --color=auto'
alias mux='tmuxifier'
alias nox='xvfb-run '
alias optirun='optirun '
alias primusrun='primusrun '
alias record='asciinema rec'
alias sudo='sudo '
alias trash='gvfs-trash'
alias xvfb-run='xvfb-run -a -s "-screen 0 1920x1080x24" '

# stupid virtualbox and its stupid crap
alias fixvbox='killall VBoxClient && VBoxClient-all'

# unfortunately necessary to make some xdg stuff work
export DE="gnome"
export GDK_SCALE=1

# automatically start x on login
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  exec startx
fi
