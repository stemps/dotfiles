# Open new Terminal window in current directory
alias nt='osascript -e "tell Application \"Terminal\"" -e "activate" -e "do script with command \"cd $PWD\"" -e "end tell" &>/dev/null'

# Maven
alias mvnecl='mvn eclipse:clean eclipse:eclipse'
alias mvnecls='mvn eclipse:clean eclipse:eclipse -DdownloadSources=true'

# Amazon
alias ec2conn='ssh -i /Users/simons/projects/bizsphere/.ec2/bizsphere.pem -l root'
alias ec2cp='scp -i /Users/simons/projects/bizsphere/.ec2/bizsphere.pem '

# rake / rails / ruby
alias rt='rake test cucumber:all'


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
alias gpff='git pull --ff-only'
alias gf='git fetch'
alias gaa='git add -A; gs'
alias gb='git branch'
alias gsb='git checkout $(git branch | grep -v \* | sort | selecta)'
alias gbrt='gbrt.rb'
alias gc='git commit -v'
alias gco='git checkout'
alias gca='gaa; gc'
alias gl='git log --pretty=format:"%C(yellow)%ar%Creset [%Cblue%h%Creset] %Cgreen%an%Creset:%Cred%d%Creset %s" --graph'
alias gla='gl --all --date-order'
alias glas='gla --simplify-by-decoration'
alias gll='git log --stat'
alias glll='git log -p --stat'
alias gt='git tag'
alias gcb='git checkout -b'
alias gcm='git checkout master'
alias gc40='git checkout release-4.0.x'
alias gc41='git checkout release-4.1.x'
alias gc42='git checkout release-4.2.x'
alias gc43='git checkout release-4.3.x'
alias gcw='git checkout work'
alias gmw='git merge work'
alias gmm='git merge master'
alias gxmlb='git checkout contentnuggets/lib/xmlbeans-generated.jar'
alias gphm='git push heroku master'
#alias grma='for x in `git status | grep deleted | awk \'{print $3}\'`; do git rm $x; done'
alias gcp="git cherry-pick"
alias gdc="git diff --cached"
alias gd="git diff"
# push current branch to origin
alias gpbo='git push origin `current_git_branch` -u'
alias grh='git reset --hard'
alias oops='gaa; gc --amend'
alias gsta='git stash --include-untracked'


# bizsphere
alias bsw="mvn clean install -Dmaven.test.skip=true"
alias mgs="mvn generate-sources"
alias bbe="ant clean compile package transfer deploy"

# papersmart
alias cdp="cd /Users/simons/projects/papersmart/papersmart"

# haystack
alias cdh="cd /Users/simons/projects/haystack/haystack-app"

# Rails
alias r='rails'
alias rs='rails server'
alias rdb='rails dbconsole'
alias rco='rails console'
alias rpry='pry -r ./config/environment'
alias rmigd='bundle exec rake db:migrate RAILS_ENV=development'
alias rmigt='bundle exec rake db:migrate RAILS_ENV=test'
alias mig='bundle exec rake db:migrate db:test:prepare'
alias migredo='bundle exec rake db:migrate:redo db:test:prepare'
alias rsd="rails server --debugger"
alias b="bundle"
alias be="bundle exec"
alias bo="bundle open"
alias ze="zeus"

# create directory and change into it
function mcd {
  mkdir $1
  cd $1
}

# vagrant
alias v='vagrant'

# Tmux (shamelessly stolen from Moritz Breit at https://github.com/mbreit/dotfiles/blob/master/zsh/.zshrc)
alias t='SESSION_NAME=`echo $PWD:t|sed s/\\\./-/g` ;tmux attach -t $SESSION_NAME || tmux new -s $SESSION_NAME'''

# Workaround for Tmux / Macvim / Clipboard issue
alias mvim="reattach-to-user-namespace mvim"
