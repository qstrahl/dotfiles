# vim: ft=sh

# The one and only
export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Include per-user bins
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

if which ruby >/dev/null && which gem >/dev/null; then
  # Add gem bins in path
  export PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"

  # Set user-local GEM_HOME
  export GEM_HOME="$(ruby -rubygems -e 'puts Gem.user_dir')"
fi

# Add npm bins to path
export PATH="$HOME/.npm/bin:$PATH"

# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH
export MANPATH="$HOME/.npm/share/man:$(manpath)"

export TERMINFO_DIRS="$HOME/.terminfo:$TERMINFO_DIRS"

export NODE_PATH="$NODE_PATH:$HOME/.npm/lib/node_modules"

# Remove duplicate entries from environment vars in case of multiple login shells
for i in PATH TERMINFO_DIRS; do
  export $i="$( eval echo "\$$i" | tr ':' '\n' | sort -u | paste -sd: )"
done

# aliases
alias activator='activator -Duser.timezone=GMT -mem 2048'
alias ls='ls --group-directories-first --color=auto'
alias mux='tmuxifier'
alias optirun='optirun '
alias primusrun='primusrun '
alias record='asciinema rec'
alias sudo='sudo '
alias trash='gvfs-trash'
alias xvfb-run='xvfb-run -a -s "-screen 0 1920x1080x24" '
