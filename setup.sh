#!/bin/bash

# backup .gitconfig
if [ -f ~/.gitconfig ]; then
    DATE=`date '+%Y-%m-%d_%H:%M:%S'`
    mv ~/.gitconfig ~/.gitconfig.$DATE
fi

# link .gitconfig and concrete .gitconfig files for daimler and private use
ln -s ~/git/gitconfig ~/.gitconfig
ln -s ~/git/gitconfig-daimler ~/.gitconfig-daimler
ln -s ~/git/gitconfig-private ~/.gitconfig-private

# link .gitcommitmessage
ln -s ~/git/gitcommitmessage ~/.gitcommitmessage

# copy gitprompt.bashrc
cp ~/git/bashrc.d/gitprompt.bashrc ~/.bashrc.d/gitprompt.bashrc
