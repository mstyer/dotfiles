# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Git tab completion files
source ~/.git-completion.bash

#prompt
PS1="\[\033[1;36m\]\t [\u@\h \W]\$ \[\033[0m\]"

# Environment variables
HAVE_DOT=YES
DOT_PATH=/usr/local/graphviz-2.14/bin
OOYALA_CODE_ROOT=$HOME/repos/ooyala

# User specific aliases and functions
alias kinit='/usr/bin/kinit -l7days'
alias gitk='/usr/bin/wish $(which gitk)'

if [ -f "$HOME/.aws/dev_credentials" ]; then
  source $HOME/.aws/dev_credentials
fi

if [ -f "$HOME/.rvm/scripts/rvm" ]; then
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
fi

if [ -f "/usr/local/rvm/scripts/rvm" ]; then
  [[ -s "/usr/local/rvm/scripts/rvm" ]] && . "/usr/local/rvm/scripts/rvm" # Load RVM function
fi
