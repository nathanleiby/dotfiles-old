##############################################################################
# 00. General Env                                                            #
##############################################################################

### Homebrew
# make sure that any files Homebrew installs will be in your system path
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

### Editor
export EDITOR=/usr/local/bin/nvim
export VISUAL=$EDITOR

### Bash History
HISTFILESIZE=1000000000
HISTSIZE=1000000

# Must press Ctrl+D twice before you exit shell
export IGNOREEOF=1

### Python
# Anaconda
export PATH="/usr/local/anaconda3/bin:$PATH"
# TODO: switch to mini-conda for control

### Golang
# Golang: Brew installed
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

### Git
# if `hub` exists, add it as a Git alias
if `which hub > /dev/null`; then
  eval "$(hub alias -s)"
fi

### CD
# Add code dirs to CDPATH
export CDPATH=.:~:~/go/src/github.com/Clever:~/go/src/github.com/nathanleiby

##############################################################################
# 02. Aliases                                                                #
##############################################################################

# copy-paste
alias to_clipboard=pbcopy # handle ubuntu too

### Bash / ZSH Profile
alias bp="$EDITOR ~/.bashrc ~/.bash_profile_private ~/.bash_profile"
alias sbp="source ~/.bash_profile"
alias sz="source ~/.zshrc"

### Grep
alias grep='grep --color'

### Ls
alias l='ls -Glah' # Enable colors in "ls" command output
alias ll='ls -FGal' # Show hidden files as list, colored
alias lst="ls -AGlFTtr" # Short by time (reverse)

### Git
# TODO: Add these to gitconfig instead
alias gs='git status'
alias gst='git status -uno' #tracked files only
alias gss='git status -sb' # short status
alias gd='git diff'
alias gdw='git diff -w' #ignore whitespace
alias gdp='gd HEAD~1' #diff currect state against previous commit
alias ga='git add -p'
alias gau='git add -u -p'
alias gaa='git add -A -p'
alias gb='git branch'
alias gc='git commit'
alias gca='git commit --amend'

alias gl='git lg'
alias gls='git log --oneline --decorate' # short git log
alias gco='git checkout'
alias gcom='git checkout master'
alias gpp='git pull && git push'
alias gp='git pull'
alias gr='git reset'
alias groll='git checkout HEAD~1' #rollback 1 commit
alias grom='git fetch && git stash && git rebase origin/master && git stash pop'
alias gcob="git checkout -b"
alias gpf="git push --force"

alias gll="git log -1 --pretty=format:%H | tee /dev/tty | to_clipboard"  # git last log
alias glls="git log -1 --pretty=format:%H | cut -c 1-7 | tee /dev/tty | to_clipboard" # git last log short
alias gcb="git rev-parse --abbrev-ref HEAD | tee /dev/tty | to_clipboard" # git current branch

# Application shortcuts
alias py='python'
alias ipy='ipython'

# Vim
alias vim=$EDITOR
alias vi=$EDITOR
alias v=$EDITOR

# Time
alias unixtime='date +%s' # prints current unixtime
alias utc="date -u" # prints UTC date

# Make aliases
alias m='make'
alias mb='make build'
alias mt='make test'
alias mr='make run'
alias mg='make generate'
alias md='make install_deps || make deps'
alias mm='make mocks'

# other
alias f="fg"
alias xx="exit"
alias c="hub clone -p"
alias gh='hub browse' # open repo in github
alias cw="watch -c unbuffer circleci-cli show" # watch CircleCI build output

it2_set_profile() { echo -e "\033]50;SetProfile=$1\a" } # switch between my Light/Dark profiles

# watch + pretty-print go test output
#
# requires:
# - reflex (github.com/cespare/reflex)
# - richgo (https://github.com/kyoh86/richgo)
watch_go_test() {
  reflex -r '\.go$' -R vendor/ -- richgo test $@
}
alias got=watch_go_test

############################################################################
# 03. Private Bash - may things in existing bash, too
############################################################################

### Private Bash Profile: API Keys, etc
if [ -f ~/.bash_profile_private ]; then
  source $HOME/.bash_profile_private
else
  echo "Could not find $HOME/.bash_profile_private. You may be missing API Keys, etc"
fi

##############################################################################
# 04. Experimental (TBD if useful)
##############################################################################

