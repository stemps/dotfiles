. ~/dotfiles/zsh/config.sh
. ~/dotfiles/shells-common/env.sh
. ~/dotfiles/shells-common/aliases.sh

# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '+' 'm:{[:lower:]}={[:upper:]}'
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/Users/simons/'

autoload -Uz compinit
compinit
# End of lines added by compinstall
 
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Postgres Version Manager
source /Users/stemps/.pgvm/pgvm_env

# ASDF Version Manager
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# Flutter
export PATH=$HOME/opt/flutter/bin:$PATH
