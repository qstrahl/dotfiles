function mux -d "It's tmuxinator. It's just tmuxinator."
  set session $argv[1]
  set args $argv[2..]

  if tmux new -d -c ~ -s "$session"
    while set -q args[1]
      set method $args[1]
      set tmuxArgs "$method -t" (string escape -- $session)
      set args $args[2..]

      if test $method = "neww"
        set name $args[1]
        set -a tmuxArgs "-n" (string escape -- $name)
        set args $args[2..]
      end

      if test -d "$args[1]"
        set path $args[1]
        set -a tmuxArgs "-c" (string escape -- $path)
        set args $args[2..]
      end

      set command $args[1]
      set -a tmuxArgs "fish -C" (string escape -- $command)
      set args $args[2..]

      eval "tmux $tmuxArgs"
    end

    tmux killw -t "$session:^"
  end

  if set -q TMUX
    tmux switch-client -t "$session"
  else
    tmux attach -t "$session"
  end
end
