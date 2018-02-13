#!/bin/bash

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/' | sed -e 's/^/ /'
}

print_git_status() {
    inside_git_repo=$(git status 2> /dev/null)
    if [ "$?" -gt "0" ]; then
        echo ""
    else 
        dirty=$(git status --porcelain 2> /dev/null | wc -l)
        stashed=$(git stash list 2> /dev/null | wc -l)
        if [ "$dirty" -gt "0" ]; then
            result=" ✖"
        else
            result=" ✔"
        fi  
        if [ "$stashed" -gt "0" ]; then
            result=$result"⚑"
        fi
        echo $result
    fi
}

PS1='[\u@\h \W]\[\033[01;32m\]$(parse_git_branch)\[\033[00m\]$(print_git_status) \$ ' 
