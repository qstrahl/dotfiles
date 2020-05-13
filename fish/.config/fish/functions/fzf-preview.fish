# Defined in /tmp/fish.w75FSM/fzf-preview.fish @ line 2
function fzf-preview
	set ft (xdg-mime query filetype "$argv" 2>/dev/null)

  if string match -q "text/*" "$ft"
    bat --paging=never "$argv"
  else if string match -q "inode/directory" "$ft"
    ls -Al --color=always "$argv"
  end
end
