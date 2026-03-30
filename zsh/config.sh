HISTFILE=~/.zsh_history
SAVEHIST=10000
HISTSIZE=10000
setopt inc_append_history
setopt share_history

REPORTTIME=10
LISTMAX=0

#fpath=(~/dotfiles/zsh/functions $fpath)
#autoload rails

## auto completions
autoload compinit
compinit

## enable VIM style navigation
bindkey -v

# bit keep search key bindings
bindkey -M viins '^r' history-incremental-search-backward
bindkey -M vicmd '^r' history-incremental-search-backward

# enable ctrl-a and ctrl-k in VI mode
bindkey -M viins '^a' beginning-of-line
bindkey -M viins '^e' end-of-line
bindkey -M viins '^k' kill-line

# use ssh known hosts file for autocompletion
local knownhosts
knownhosts=( ${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[0-9]*}%%\ *}%%,*} ) 
zstyle ':completion:*:(ssh|scp|sftp):*' hosts $knownhosts
