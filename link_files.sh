#!/bin/bash

DOTDIR=`pwd`
for f in `ls $DOTDIR`
do
  if [[ "$f" != README* ]] \
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
