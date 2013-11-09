#!/bin/bash

set -e

# backup old files:
cp ~/.bashrc ~/.bashrc.`date +%T`.backup
cp ~/.bash_profile ~/.bash_profile.`date +%T`.backup
cp ~/.inputrc ~/.inputrc.`date +%T`.backup
cp ~/.vimrc ~/.vimrc.`date +%T`.backup

# copy new ones:
cp bashrc ~/.bashrc
cp bash_profile ~/.bash_profile
cp inputrc ~/.inputrc
cp vimrc ~/.vimrc

# source them:
source ~/.bashrc
source ~/.bash_profile
source ~/.inputrc
