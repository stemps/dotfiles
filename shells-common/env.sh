#export EDITOR='mate -w'
export EDITOR='vim'

# enable command line color
export CLICOLOR=1

# local bin
export PATH=~/bin:$PATH

# Amazon EC2
export EC2_HOME="/Users/simons/opt/ec2-api-tools-1.3-46266"
export EC2_CLOUDWATCH_HOME="/Users/simons/opt/CloudWatch-1.0"
export MONITORING_HOME=$EC2_CLOUDWATCH_HOME
export PATH=$PATH:"$EC2_HOME/bin:$EC2_CLOUDWATCH_HOME/bin"
[[ -s /Volumes/bizsphere/.ec2/env ]] && source /Volumes/bizsphere/.ec2/env

# MySQL
export PATH=$PATH:"/usr/local/mysql/bin"
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib/

# Flash
export PATH=$PATH:"/Applications/Adobe Flash Builder Beta 2/Player/mac/Flash Player.app/Contents/MacOS"

# JAVA
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home

# Maven
export M2_HOME=~/opt/apache-maven-2.2.1
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
