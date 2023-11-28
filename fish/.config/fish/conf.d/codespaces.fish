# import codespace environment variables
set -l env_file "/workspaces/.codespaces/shared/.env"
if test -e "$env_file"
  export (cat "$env_file")
end
