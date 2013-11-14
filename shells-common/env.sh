#export EDITOR='mate -w'
export EDITOR='$HOME/bin/vi'
export BUNDLER_EDITOR='$HOME/bin/mvim'

# enable command line color
export CLICOLOR=1

# local bin
export PATH=~/bin:$PATH

# homebrew 
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Amazon EC2
export EC2_HOME="/usr/local/Cellar/ec2-api-tools/1.5.0.1/jars"
export EC2_CLOUDWATCH_HOME="/Users/simons/opt/CloudWatch-1.0"
export MONITORING_HOME=$EC2_CLOUDWATCH_HOME
export PATH=$PATH:"$EC2_HOME/bin:$EC2_CLOUDWATCH_HOME/bin"
[[ -s /Volumes/bizsphere/.ec2/env ]] && source /Volumes/bizsphere/.ec2/env

# MySQL
export PATH=$PATH:"/usr/local/mysql/bin"
# export DYLD_LIBRARY_PATH=/usr/local/mysql/lib/

# Flash
export PATH=$PATH:"/Applications/Adobe Flash Builder Beta 2/Player/mac/Flash Player.app/Contents/MacOS"

# Flex
export FLEX_SDK_HOME_33=/Users/Shared/FlexSDKs/3.3.0.4852

# JAVA
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home

# Maven
export M2_HOME=~/opt/apache-maven-3.0.3
export PATH=$M2_HOME/bin:$PATH
export MAVEN_OPTS="-Xms512m -Xmx2048m -XX:MaxPermSize=256m"

# Wireshark
export PATH=$PATH:$HOME/opt/wireshark/bin


# RVM
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

# sphinx
export PATH=$PATH:/usr/local/sphinx/bin

# autotest
export AUTOFEATURE=true

# fix permissions for scripts on dropbox
files=( '/Users/simons/bin/vcprompt' '/Users/simons/bin/mvim' )
for file in ${files[@]}
do
	chmod u+x $file
done

# RI options
export RI="-T --format ansi"

#NodeJS
export PATH=$PATH:/usr/local/share/npm/bin
export NODE_PATH="/usr/local/lib/node"

# load z command
. `brew --prefix`/etc/profile.d/z.sh
