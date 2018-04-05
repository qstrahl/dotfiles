if initialize_session "update"; then
  new_window
  run_cmd "aurman -Syu"

  new_window
  run_cmd "antigen update"

  new_window
  run_cmd "nvim +PlugUpdate"
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
