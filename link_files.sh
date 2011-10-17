#!/bin/bash

DOTDIR=`pwd`
if [[ $# > 0 ]]
then
  files=("$@")
else
  files=`ls $DOTDIR`
fi

for f in $files; do
  if   [[ -f "$f" ]] \
    && [[ "$f" != README* ]] \
    && [[ "$f" != .* ]] \
    && [[ "$f" != *.sh ]] \
    && [[ "$f" != *~ ]]
  then
    dotfile=$DOTDIR/$f
    dotlink=$HOME/.$f
    echo "rm -f $dotlink"
    rm -f $dotlink
    echo "ln -s $dotfile $dotlink"
    ln -s $dotfile $dotlink
  fi
done
