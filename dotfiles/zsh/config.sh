# wunjo git prompt
fpath=($fpath $HOME/bin/dotfiles/zsh/func)
typeset -U fpath


#HISTFILE=~/.zsh_history
#SAVEHIST=10000
#HISTSIZE=10000

#REPORTTIME=10
#LISTMAX=0

## auto completions
#autoload compinit
#compinit

## enable VIM style navigation
#bindkey -v

setopt promptsubst
autoload -U promptinit
promptinit
prompt simons

# Colors from http://wiki.archlinux.org/index.php/Color_Bash_Prompt
# misc
NO_COLOR=$'\e[0m' #disable any colors
# regular colors
BLACK=$'\e[0;30m'
RED=$'\e[0;31m'
GREEN=$'\e[0;32m'
YELLOW=$'\e[0;33m'
BLUE=$'\e[0;34m'
MAGENTA=$'\e[0;35m'
CYAN=$'\e[0;36m'
WHITE=$'\e[0;37m'
# emphasized (bolded) colors
EBLACK=$'\e[1;30m'
ERED=$'\e[1;31m'
EGREEN=$'\e[1;32m'
EYELLOW=$'\e[1;33m'
EBLUE=$'\e[1;34m'
EMAGENTA=$'\e[1;35m'
ECYAN=$'\e[1;36m'
EWHITE=$'\e[1;37m'
# underlined colors
UBLACK=$'\e[4;30m'
URED=$'\e[4;31m'
UGREEN=$'\e[4;32m'
UYELLOW=$'\e[4;33m'
UBLUE=$'\e[4;34m'
UMAGENTA=$'\e[4;35m'
UCYAN=$'\e[4;36m'
UWHITE=$'\e[4;37m'
# background colors
BBLACK=$'\e[40m'
BRED=$'\e[41m'
BGREEN=$'\e[42m'
BYELLOW=$'\e[43m'
BBLUE=$'\e[44m'
BMAGENTA=$'\e[45m'
BCYAN=$'\e[46m'
BWHITE=$'\e[47m'


autoload -U colors && colors

# Update the command prompt to be <user>:<current_directory>(git_branch) >
# Note that the git branch is given a special color

#PS1='\n$CYAN[\!]$NO_COLOR \u:%{$YELLOW%}\w%{$NO_COLOR%} $(vcprompt --format \"%{$GREEN%}[%s:%b%{$BLUE%}%pc%{$RED%}%m%u%{$GREEN%} → %{$ECYAN%}%t%{$BLUE%}%pm%{$GREEN%}]%{$NO_COLOR%}\")%{$NO_COLOR%} \n→ '

#$pc[hist][%h]$pc[reset] $pc[user]%n$pc[reset]:$pc[path]%~$pc[reset] $(vcprompt --format $pc[scm_branch]\[%s:%b$pc[scm_pending_commits]%pc$pc[scm_status_dirty]%m%u$pc[scm_branch]\ →\ $pc[scm_remote_branch]%t$pc[scm_pending_merges]%pm$pc[scm_branch]\])


PS1='
%{$CYAN%}[%h]%{$NO_COLOR%} %n:%{$YELLOW%}%~%{$NO_COLOR%} $(vcprompt --format %{$GREEN%}\[%s:%b%{$BLUE%}%pc%{$RED%}%m%u%{$GREEN%}\ →\ %{$ECYAN%}%t%{$BLUE%}%pm%{$GREEN%}])%{$NO_COLOR%}
→ '

#PROMPT='%{\e$RED%}Hallo! '
#PS1='$RED$ $(vcprompt) \e[0m'



