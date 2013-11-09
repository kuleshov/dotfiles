#!/bin/bash

export LS_COLORS='di=34:fi=0:ln=35:pi=5:so=5:bd=5:cd=5:or=36:mi=0:ex=32:*.rpm=90'
export PS1='\[\033[01;m\][\A] \u@\h\[\033[00m\]:\[\033[0m\]\w\$\[\033[00m\] '
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export PATH="$PATH:."

if [ `uname` = "Darwin" ]
then
  alias ls='ls -G'
  alias ll='ls -hl'
  alias mount_hek='sshfs hek: /Users/kuleshov/mnt/hek'
  alias mount_whale='sshfs whale2.moleculo.com: /Users/kuleshov/mnt/whale'
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
elif [ `uname` = "Linux" ]
then
  alias ll='ls -lh --color=auto'
  alias ls='ls --color=auto'
fi

alias grep='grep --color'

alias whale='ssh kuleshov@whale2.moleculo.com'
alias hek='ssh kuleshov@hek'
