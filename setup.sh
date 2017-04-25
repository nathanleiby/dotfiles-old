#!/bin/bash

############################
# Sets up a local dev env
############################

brew install z
brew install tmux
brew install reattach-to-user-namespace
brew install hub
brew install ag
brew install diff-so-fancy

# Needed for neovim completion via deoplete
pip3 install --upgrade neovim

./makesymlinks.sh
