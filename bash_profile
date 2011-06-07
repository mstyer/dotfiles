# .bash_profile
# 
# based on a chunk of jpb's bash profile.
#
# Load aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$HOME/bin:/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/local/sbin:/usr/local/graphviz-2.14/bin:$PATH

# Conditional additions
if [ -d /Developer/Tools ];then
    export PATH=$PATH:/Developer/Tools:/Developer/usr/bin:/Developer/usr/sbin
fi
if [ -d /opt/local/bin ]; then
	export PATH=$PATH:/opt/local/bin
fi
if [ -d /opt/local/sbin ]; then
	export PATH=$PATH:/opt/local/sbin
fi

BASH_ENV=$HOME/.bashrc
ENV=$HOME/.bashrc

if [ -d ~/.bash_completion.d ]; then
    for c in ~/.bash_completion.d/*; do
        . "$c"
    done
fi


export BASH_ENV ENV PATH PS1 DISPLAY

# from macosxhints.com
cdf() # cd's to frontmost window of Finder
{
    cd "`osascript -e 'tell application "Finder"' \
        -e 'set myname to POSIX path of (target of window 1 as alias)' \
        -e 'end tell' 2>/dev/null`"
}


if [ $(ssh-add -l | grep -c "The agent has no identities." ) -eq 1 ]; then
    if [ -f /mach_kernel ]; then
        ssh-add -k
    fi
fi

# Setup bash history options
# export HISTCONTROL=erasedups
export HISTCONTROL='ignoreboth'
export HISTIGNORE="&:ls:[bf]g:exit"
export HISTSIZE=10000
export HISTTIMEFORMAT='%b %d %H:%M:%S: '
shopt -s histappend
set cmdhist

bind "set completion-ignore-case on"
shopt -s cdspell

if [ -f /opt/local/etc/bash_completion ]; then
  . /opt/local/etc/bash_completion
fi

export OOYALA_CODE_ROOT=~/repos/ooyala
export RUBYOPT="-I. -rubygems"
export MYSQL_UNIX_PORT=`mysql_config5 --socket`
export HADOOP_HOME=$OOYALA_CODE_ROOT/vendor/hadoop_distros/current
export PATH=$PATH:$HADOOP_HOME/bin:$OOYALA_CODE_ROOT/hadoop/tools
export JAVA_HOME=`/usr/libexec/java_home`

rvm_kill () {
    ps ax|grep rvm |grep -v grep|awk '{print $1}'|xargs kill -9
}
