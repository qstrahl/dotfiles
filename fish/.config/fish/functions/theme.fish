# Defined in /tmp/fish.oJUBVQ/set-fish-colors.fish @ line 1
function theme --description 'Activate my preferred fish theme colors'
  set -U fish_color_autosuggestion brblack
  set -U fish_color_cancel -r
  set -U fish_color_command green
  set -U fish_color_comment brblack
  set -U fish_color_cwd brblue
  set -U fish_color_cwd_root red
  set -U fish_color_end brblack
  set -U fish_color_error red
  set -U fish_color_escape brmagenta
  set -U fish_color_history_current -o
  set -U fish_color_host normal
  set -U fish_color_match brblack -o -b brgreen
  set -U fish_color_normal normal
  set -U fish_color_operator yellow
  set -U fish_color_param normal
  set -U fish_color_quote magenta
  set -U fish_color_redirection brblue -i
  set -U fish_color_search_match brblack -b bryellow
  set -U fish_color_selection -o brblack -b brgreen
  set -U fish_color_status red
  set -U fish_color_user brgreen
  set -U fish_color_valid_path -u
  set -U fish_pager_color_completion normal
  set -U fish_pager_color_description yellow -d
  set -U fish_pager_color_prefix white -o
  set -U fish_pager_color_progress brwhite -b cyan
end
