#!/bin/bash

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/' | sed -e 's/^/ /'
}

PS1='[\u@\h \W]\[\033[01;32m\]$(parse_git_branch)\[\033[00m\] \$ ' 
