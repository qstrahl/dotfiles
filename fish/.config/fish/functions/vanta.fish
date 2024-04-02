function vanta -d "Start up dev stuff in vanta codespace"
  cd ~/obsidian && mux vanta \
    neww lazydocker lazydocker \
    neww storybook 'env BROWSER=echo make storybook' \
    neww nvim nvim
end
