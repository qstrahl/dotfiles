# Defined in - @ line 1
function man --wraps=batman --description 'alias man=batman'
  if command -q batman
    batman  $argv
  else
    command batman $argv
  end
end
