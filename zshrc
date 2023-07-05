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
 
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Postgres Version Manager
source /Users/stemps/.pgvm/pgvm_env

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

#Rbenv
if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi

# ASDF Version Manager
. $HOMEBREW_PREFIX/opt/asdf/libexec/asdf.sh

# Pyenv
eval "$(pyenv init --path)"

source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# commit signing
export GPG_TTY=$(tty)
