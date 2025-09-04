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

# Suppress docker spam
export DOCKER_CLI_HINTS=false

# Enable history in Elixir
export ERL_AFLAGS=-kernel shell_history enabled
alias iex="rlwrap --always-readline iex"


# bun completions
[ -s "/Users/stemps/.bun/_bun" ] && source "/Users/stemps/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/stemps/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/stemps/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/stemps/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/stemps/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# Android Development
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Created by `pipx` on 2025-09-04 09:03:04
export PATH="$PATH:/Users/stemps/.local/bin"

# Added by Windsurf
export PATH="/Users/stemps/.codeium/windsurf/bin:$PATH"
