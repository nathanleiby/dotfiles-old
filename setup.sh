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
$(brew --prefix)/opt/fzf/install # install useful key bindings (CTRL-R) and fuzzy completion:
brew install tree
brew install gnu-sed --with-default-names

# Needed for neovim completion via deoplete
pip3 install --upgrade neovim

# Install Tmux Package Manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Window manager
brew cask install spectacle

./makesymlinks.sh
