if initialize_session "update"; then
  new_window
  run_cmd "pacaur -Syu"

  new_window
  run_cmd "antigen update"

  new_window
  run_cmd "vim +PlugUpdate"

  new_window
  run_cmd "tmux run-shell $HOME/.tmux/plugins/tpm/bindings/update_plugins"
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
