#!/bin/bash

export LS_COLORS='di=34:fi=0:ln=35:pi=5:so=5:bd=5:cd=5:or=36:mi=0:ex=32:*.rpm=90'
export PS1='\[\033[01;m\][\A] \u@\h\[\033[00m\]:\[\033[0m\]\w\$\[\033[00m\] '
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

alias whale='ssh -A kuleshov@whale2.moleculo.com'
alias hek='ssh -A kuleshov@hek'

if [ `hostname` = hemmingway ]
then
  export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
  export PATH="/Applications/Postgres93.app/Contents/MacOS/bin:$PATH"

  ### Added by the Heroku Toolbelt
  export PATH="/usr/local/heroku/bin:$PATH"
elif [ `hostname` = hek ]
then
  ## hek-specific
  export PYTHONPATH="$PYTHONPATH:/home/kuleshov/lib"
  export PATH="$PATH:~/bin:/sw/bin"
  export PERL5LIB="/home/kuleshov/bin/asm/metAMOS-1.5rc2/AMOS/Linux-x86_64/lib/AMOS"
elif [ `hostname` = scail ]
then
  unset SSH_ASKPASS
fi

if [ `hostname` = ladon1.stanford.edu ] || [ `hostname` = ladon2.stanford.edu ]
then
  alias python='python27'
fi

if [ `hostname` = nlp.stanford.edu ]
then
  source /u/nlp/bin/setup.bash
fi

if [ `hostname` = atlas2.stanford.edu ]
then
  export PATH="$PATH:/usr/local/cuda-7.5/bin"
  export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/cuda-7.5/lib64"
fi

alias tfpython='LD_LIBRARY_PATH="$HOME/lib/libc6_2.17/lib/x86_64-linux-gnu/:$HOME/lib/usr/lib64/" $HOME/lib/libc6_2.17/lib/x86_64-linux-gnu/ld-2.17.so `which python`'
