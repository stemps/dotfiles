#export EDITOR='mate -w'
export EDITOR='vi'
export BUNDLER_EDITOR='vi'

# enable command line color
export CLICOLOR=1

# local bin
export PATH=~/bin:$PATH

# homebrew 
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Amazon EC2
export EC2_HOME="/usr/local/Cellar/ec2-api-tools/1.5.0.1/jars"

# Wireshark
export PATH=$PATH:$HOME/opt/wireshark/bin

# RI options
export RI="-T --format ansi"

#NodeJS
export PATH=$PATH:/usr/local/share/npm/bin
export NODE_PATH="/usr/local/lib/node"

# Work around locale issue in Mac OS (or iterm)
export LC_CTYPE=en_US.UTF-8

# Node JS
export NODE_PATH=$NODE_PATH:/usr/local/lib/node_modules

# Autoenv
[[ -f /usr/local/opt/autoenv/activate.sh ]] && source /usr/local/opt/autoenv/activate.sh
