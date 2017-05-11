if initialize_session "kyc"; then
  load_window "htop"
  load_window "kyc"
  load_window "kyc-ui"
  load_window "surveyjs"
  load_window "irc"
  new_window
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
