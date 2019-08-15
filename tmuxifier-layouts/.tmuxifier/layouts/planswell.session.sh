if initialize_session "planswell"; then
  load_window "htop"
  load_window "irc"
  load_window "portfolios"
  load_window "pw-server"
  load_window "pw-react"
  load_window "empire"
  load_window "design"
  new_window
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
