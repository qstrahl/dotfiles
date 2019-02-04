if initialize_session "update"; then
  new_window
  run_cmd "yay -Syu"

  new_window
  run_cmd "antigen update"

  new_window
  run_cmd "nvim +PlugUpdate +PlugDiff"

  new_window
  run_cmd "tmux run-shell '$HOME/.tmux/plugins/tpm/scripts/update_plugin_prompt_handler.sh all'"
  
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
