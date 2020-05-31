alias bash-reload='. ~/.bashrc'
alias zsh-reload='. ~/.zshrc'
alias ea="$EDITOR ~/dotfiles/shells-common/aliases.sh; env_reload"

function env_reload {
  CURRENT_SHELL=`ps | grep "^ *$$" | awk '{ print $4 }'`
  echo "Current shell is $CURRENT_SHELL"
  if  [[ $CURRENT_SHELL == "-zsh" ]]
  then
    echo Reloading zsh...
    zsh-reload
  fi
  if  [[ $CURRENT_SHELL == "bash" ]]
  then
    echo Reloading bash...
    bash-reload
  fi
}

function current_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

# git 
alias gs='git status'
alias ga='git add'
alias gaa='git add -A; gs'
alias gb='git branch'
alias gsb='git checkout $(git branch | grep -v \* | sort | selecta)'
alias gbrt='gbrt.rb'
alias gc='git commit -v'
alias gl='git log --pretty=format:"%C(yellow)%ar%Creset [%Cblue%h%Creset] %Cgreen%an%Creset:%Cred%d%Creset %s" --graph'
alias gla='gl --all --date-order'
alias glas='gla --simplify-by-decoration'
alias gll='git log --stat'
alias glll='git log -p --stat'
alias gt='git tag'
alias gd="git diff"
# push current branch to origin
alias gpbo='git push origin `current_git_branch` -u'
alias oops='gaa; gc --amend --no-edit'
alias gsta='git stash --include-untracked'


# Rails
alias mig='bundle exec rake db:migrate db:test:prepare'
alias migredo='bundle exec rake db:migrate:redo db:test:prepare'
alias b="bundle"
alias be="bundle exec"
alias bo="bundle open"

# create directory and change into it
function mcd {
  mkdir $1
  cd $1
}

# Tmux (shamelessly stolen from Moritz Breit at https://github.com/mbreit/dotfiles/blob/master/zsh/.zshrc)
alias t='SESSION_NAME=`echo $PWD:t|sed s/\\\./-/g` ;tmux attach -t $SESSION_NAME || tmux new -s $SESSION_NAME'''

# Workaround for Tmux / Macvim / Clipboard issue
alias mvim="reattach-to-user-namespace mvim"
