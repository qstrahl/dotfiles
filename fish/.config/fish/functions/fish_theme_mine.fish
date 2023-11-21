# Defined in /tmp/fish.oJUBVQ/set-fish-colors.fish @ line 1
function fish_theme_mine --description 'Activate my preferred fish theme colors'
  set -g fish_color_autosuggestion brblack
  set -g fish_color_cancel -r
  set -g fish_color_command green
  set -g fish_color_comment brblack
  set -g fish_color_cwd brblue
  set -g fish_color_cwd_root red
  set -g fish_color_end brblack
  set -g fish_color_error red
  set -g fish_color_escape brmagenta
  set -g fish_color_history_current -o
  set -g fish_color_host normal
  set -g fish_color_host_remote yellow
  set -g fish_color_match brblack -o -b brgreen
  set -g fish_color_normal normal
  set -g fish_color_operator yellow
  set -g fish_color_param normal
  set -g fish_color_quote magenta
  set -g fish_color_redirection brblue -i
  set -g fish_color_search_match brblack -b bryellow
  set -g fish_color_selection -b 333
  set -g fish_color_status red
  set -g fish_color_user brgreen
  set -g fish_color_valid_path -u
  set -g fish_pager_color_prefix -o normal
  set -g fish_pager_color_completion normal
  set -g fish_pager_color_description yellow
  set -g fish_pager_color_progress brwhite -b cyan
  set -g fish_pager_color_selected_prefix -o white
  set -g fish_pager_color_selected_completion white
  set -g fish_pager_color_selected_description bryellow
  set -g fish_pager_color_selected_background -b 333
end
