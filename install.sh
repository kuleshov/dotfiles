#!/bin/bash

# backup old files:
cp ~/.bashrc ~/.bashrc.`date +%T`.backup
cp ~/.bash_profile ~/.bash_profile.`date +%T`.backup
cp ~/.inputrc ~/.inputrc.`date +%T`.backup
cp ~/.vimrc ~/.vimrc.`date +%T`.backup
mv ~/.vim ~/.vim.`date +%T`.backup

# copy new ones:
cp bashrc ~/.bashrc
cp bash_profile ~/.bash_profile
cp inputrc ~/.inputrc
cp vimrc ~/.vimrc
cp -r ./vim ~/.vim

# source them:
source ~/.bashrc
source ~/.bash_profile
source ~/.inputrc
