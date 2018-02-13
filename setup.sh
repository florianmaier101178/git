#!/bin/bash

# backup .gitconfig
if [ -f ~/.gitconfig ]; then
    DATE=`date '+%Y-%m-%d_%H:%M:%S'`
    mv ~/.gitconfig ~/.gitconfig.$DATE
fi

# link .gitconfig
ln -s ~/git/gitconfig ~/.gitconfig

# link .gitcommitmessage
ln -s ~/git/gitcommitmessage ~/.gitcommitmessage

# copy gitprompt.bashrc
cp ~/git/bashrc.d/gitprompt.bashrc ~/.bashrc.d/gitprompt.bashrc
