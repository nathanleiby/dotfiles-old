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

./makesymlinks.sh
