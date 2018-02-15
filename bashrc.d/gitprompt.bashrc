#!/bin/bash

print_git_branch() {
    cyan
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
            red
            result=" ✖"
        else
            green
            result=" ✔"
        fi  
        if [ "$stashed" -gt "0" ]; then
            yellow
            result=$result"⚑"
        fi
        echo $result
    fi
}

red() {
    tput setaf 1
}

green() {
    tput setaf 2
}

yellow() {
    tput setaf 3
}

cyan() {
    tput setaf 6
}

white() {
    tput setaf 7
}

__PS1_GIT_BRANCH='$(print_git_branch)$(white)'
__PS1_GIT_STATUS='$(print_git_status)$(white)'

__PS1_GIT=$__PS1_GIT_BRANCH$__PS1_GIT_STATUS

__PS1_BEGIN='[\u@\h \W]'
__PS1_END=' \$ '

PS1=$__PS1_BEGIN$__PS1_GIT$__PS1_END
#PS1='[\u@\h \W]\[\033[01;32m\]$(print_git_branch)\[\033[00m\]$(print_git_status) \$ ' 
