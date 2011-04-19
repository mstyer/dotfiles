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

# User specific aliases and functions

source ~/.aws/dev_credentials
