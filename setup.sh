#!/bin/bash

############################
# Sets up a local dev env
############################

brew install z
cbrew install tmux
brew install reattach-to-user-namespace
brew install hub
brew install ag

./makesymlinks.sh
