#!/bin/bash

############################
# Sets up a local dev env
############################

git clone git@github.com:gmarik/Vundle.vim.git vim/bundle/Vundle.vim
git clone git@github.com:rupa/z.git
./makesymlinks.sh
