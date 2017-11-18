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
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

# Include per-user bins
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

if command -v ruby >/dev/null && command -v gem >/dev/null; then
  # Set user-local GEM_HOME
  export GEM_HOME="$(ruby -rubygems -e 'puts Gem.user_dir')"

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

if [[ -z "$NODE_PATH" ]] && command -v npm >/dev/null 2>&1; then
  export NODE_PATH="$(npm root -g)"
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
alias ls='ls --group-directories-first --color=auto'
alias mux='tmuxifier'
alias nox='xvfb-run '
alias optirun='optirun '
alias primusrun='primusrun '
alias record='asciinema rec'
alias sudo='sudo '
alias trash='gvfs-trash'
alias xvfb-run='xvfb-run -a -s "-screen 0 1920x1080x24" '

# unfortunately necessary to make some xdg stuff work
export DE="gnome"
export GDK_SCALE=1
