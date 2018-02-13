#!/bin/bash

# backup .gitconfig
if [ -f ~/.gitconfig ]; then
    DATE=`date '+%Y-%m-%d_%H:%M:%S'`
    mv ~/.gitconfig ~/.gitconfig.$DATE
fi

# link .gitconfig
ln -s ~/git/gitconfig ~/.gitconfig
