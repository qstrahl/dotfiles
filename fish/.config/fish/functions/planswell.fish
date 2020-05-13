# Defined in /tmp/fish.yUpoCl/planswell.fish @ line 2
function planswell --description 'Start up all the Planswell shit'
	set s "planswell"

  if tmux new -d -c ~ -s $s
    tmux \
    neww -t $s: -n sys \; send 'htop' C-m \;\
    neww -t $s: -n irc \; send 'mosh qstrahl.com tmux a' C-m \;\
    neww -t $s: -n pw-server -c pw-server \; send 'iex -S mix phx.server' C-m \;\
    neww -t $s: -n pw-react -c pw-react \; send 'yarn start' C-m \;\
    neww -t $s: -n empire -c empire \; send 'npm start -- --host 0.0.0.0' C-m \;\
    neww -t $s: -n design -c design \; send 'npm start' C-m \;\
    neww -t $s: \;\
    killw -t $s:^
  end

  tmux new -A -s $s
end
