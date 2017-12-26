#!/bin/bash

############################
# Sets up a local dev env
############################

brew install tmux
brew install reattach-to-user-namespace # for tmux copy-paste on OSX
brew install hub
brew install ag
brew install diff-so-fancy
brew install fzf
brew install tree

# Needed for neovim completion via deoplete
pip3 install --upgrade neovim

# Install Tmux Package Manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

./makesymlinks.sh
