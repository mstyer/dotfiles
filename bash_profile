# .bash_profile
# 
# based on a chunk of jpb's bash profile.
#
# Load aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

OOYALA_CODE_ROOT=~/repos/ooyala
OO_DEPLOY_DIR=$HOME/ooyala_deploy
OIS_ROOT=$HOME/repos/ois
HADOOP_HOME=$OOYALA_CODE_ROOT/vendor/hadoop_distros/current
PATH=$HOME/bin:/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/local/sbin:/usr/local/graphviz-2.14/bin:$PATH

# Conditional additions
if [ -d /Developer/Tools ];then
  PATH=$PATH:/Developer/Tools:/Developer/usr/bin:/Developer/usr/sbin
fi
if [ -d /opt/local/bin ]; then
	PATH=$PATH:/opt/local/bin
fi
if [ -d /opt/local/sbin ]; then
	PATH=$PATH:/opt/local/sbin
fi

BASH_ENV=$HOME/.bashrc
ENV=$HOME/.bashrc

if [ -d ~/.bash_completion.d ]; then
    for c in ~/.bash_completion.d/*; do
        . "$c"
    done
fi


export BASH_ENV ENV PATH PS1 DISPLAY OOYALA_CODE_ROOT OIS_DEPLOY_DIR OIS_ROOT HADOOP_HOME

# Do OS-specific stuff
uname=$(uname)
case $uname in
  "Darwin")
  # from macosxhints.com
  cdf() # cd's to frontmost window of Finder
  {
      cd "`osascript -e 'tell application "Finder"' \
          -e 'set myname to POSIX path of (target of window 1 as alias)' \
          -e 'end tell' 2>/dev/null`"
  }
  ;;
esac




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

export RUBYOPT="-I. -rubygems"
if [ `which mysql_config`x != "x" ]; then
  export MYSQL_UNIX_PORT=`mysql_config --socket`
fi
if [ -x /usr/libexec/java_home ]; then
  export JAVA_HOME=`/usr/libexec/java_home`
fi

export PATH=$HOME/.rbenv/bin:$HADOOP_HOME/bin:$OOYALA_CODE_ROOT/hadoop/tools:$PATH

eval "$(rbenv init -)"

