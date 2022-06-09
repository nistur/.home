#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -l'
PS1='[\u@\h \W]\$ '
export TERMINAL=st
export PATH=${HOME}/bin:${PATH}
