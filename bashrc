. ~/dotfiles/bash/config.sh
. ~/dotfiles/shells-common/env.sh
. ~/dotfiles/shells-common/aliases.sh


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

if command -v wt >/dev/null 2>&1; then eval "$(command wt config shell init bash)"; fi
