# vim: ft=sh

# The one and only
export EDITOR="vim"

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

export TERMINFO_DIRS="$HOME/dotfiles/terminfo:$TERMINFO_DIRS"
