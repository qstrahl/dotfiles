# Defined in /tmp/fish.uNsC1q/update.fish @ line 2
function update --description 'Update all my shit'
	set s update

  if tmux new -d -c ~ -s $s
    tmux \
    neww -t $s: -n cmpl \; send 'fish_update_completions' C-m \;\
    neww -t $s: -n tmux \; send 'sh ~/.tmux/plugins/tpm/scripts/update_plugin_prompt_handler.sh all' C-m \;\
    neww -t $s: -n nvim \; send 'nvim +PlugUpdate +PlugDiff' C-m \;\
    neww -t $s: -n arch \; send 'yay -Syu && yes | yay -Scc' C-m \;\
    killw -t $s:^
  end

  tmux new -A -s $s
end
