##############################################################################
# 00. General Env                                                            #
##############################################################################

### Homebrew
# make sure that any files Homebrew installs will be in your system path
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export HOMEBREW_NO_EMOJI='1'
export HOMEBREW_DEVELOPER='1'

### Editor
export EDITOR=/usr/local/bin/nvim
export VISUAL=$EDITOR

### Bash History
HISTFILESIZE=1000000000
HISTSIZE=1000000

# Must press Ctrl+D twice before you exit shell
export IGNOREEOF=1

### Python
# VirtualEnv / VirtualEnvWrapper
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=`which python`
export VIRTUALENVWRAPPER_VIRTUALENV=`which virtualenv`

if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
  source /usr/local/bin/virtualenvwrapper.sh
fi

### NodeJS
# node package manager - have npm-installed binaries picked up
export PATH=/usr/local/share/npm/bin:$PATH

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

### Anaconda
export PATH="/usr/local/anaconda3/bin:$PATH"

##############################################################################
# 02. Aliases                                                                #
##############################################################################

### Bash / ZSH Profile
alias bp="$EDITOR ~/.bashrc ~/.bash_profile_private ~/.bash_profile"
alias sbp="source ~/.bash_profile"
alias sz="source ~/.zshrc"

# VirtualEnv
alias wo="workon"

### Grep
alias grep='grep --color'
alias fgrep='fgrep --color'

### Ls
# Enable colors in "ls" command output
alias l='ls -Glah'

# Show hidden files, colored
alias la='ls -FGa'

# Show hidden files as list, colored
alias ll='ls -FGal'

# Short by time (reverse)
alias lst="ls -AGlFTtr" # alias of ls that puts recently modified files at the bottom
alias lt='lst'
alias mod="lt | tail"

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
alias gcv='git commit --no-verify' #skips pre-commit hook (tests), e.g. for simple amend of message
alias gcav='git commit --amend --no-verify' #I like to live dangerously

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

# Application shortcuts
alias py='python'
alias ipy='ipython'

# Get my IP on WiFi (OSX)
alias my_ip='/sbin/ifconfig en1| grep "inet "| cut -d" " -f2'

# Vim
alias vim=$EDITOR
alias vi=$EDITOR
alias v=$EDITOR

# Time
alias unixtime='date +%s' # prints current unixtime
alias utc="date -u" # prints UTC date

# other
alias f="fg"
alias xx="exit"
alias c="hub clone -p"

# gll = "git last log" -- print last commit sha, and copy it to clipboard
alias to_clipboard=pbcopy # handle ubuntu too
alias gll="git log -1 --pretty=format:%H | tee /dev/tty | to_clipboard"
alias glls="git log -1 --pretty=format:%H | cut -c 1-7 | tee /dev/tty | to_clipboard"
# gcb = "git current branch"
alias gcb="git rev-parse --abbrev-ref HEAD | tee /dev/tty | to_clipboard"

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

# TODO: Add a 'list commands / aliases' to tell me all my private aliases in a beautiful way

## TODO: Remove this? Or use go install brew
alias bash_analyze='cut -f1 -d" " .bash_history | sort | uniq -c | sort -nr | head -n 30'


# TODO: Necessary when not using Vagrant?
# Reuse existing SSH auth, so credentials get passed correctly to tmux
#if [[ -S "$SSH_AUTH_SOCK" && ! -h "$SSH_AUTH_SOCK" ]]; then
  #ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock;
#fi
#export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock;

# Add code dirs to CDPATH
export CDPATH=.:~:~/go/src/github.com/Clever:~/go/src/github.com/nathanleiby

# Make aliases
alias m='make'
alias mb='make build'
alias mt='make test'
alias mr='make run'
alias mg='make generate'
alias md='make install_deps || make deps'
alias mm='make mocks'

# watch + pretty-print go test output
#
# requires:
# - reflex (github.com/cespare/reflex)
# - richgo (https://github.com/kyoh86/richgo)
watch_go_test() {
  reflex -r '\.go$' -R vendor/ -- richgo test $@
}
alias got=watch_go_test

# Disable Ctrl+S, Ctrl+Q
stty -ixon

#watch_node_test() {
  #reflex -r '\.ts$' -R node_modules -- make
#}
#alias wnt=watch_node_test

# [ -f ~/.fzf.bash ] && source ~/.fzf.bash
update_prezto() {
  cd $ZPREZTODIR
  git pull
  git submodule update --init --recursive
}

alias cw="watch -c unbuffer circleci-cli show"

# https://routley.io/tech/2017/11/23/logbook.html
function lb() {
  $EDITOR ~/Dropbox/logbook/$(date '+%Y-%m-%d').md
}

# Docker build "local"
docker_build_local() {
  tag=local/`basename $(pwd)`
  echo "Building docker image '$tag'..."
  docker build -t $tag .
}
alias dbl=docker_build_local

# Tree is a good way to view file structure
# let's ignore annoying vendor dirs
alias tt="tree -I 'node_modules|vendor'"
# directories only
alias ttd="tree -d -I 'node_modules|vendor'"

alias gh='hub browse'
alias github='hub browse'

alias fmtjson="python -m json.tool"
it2_set_profile() { echo -e "\033]50;SetProfile=$1\a" }

nth() { sed "$1q;d" $2 }

# get `unbuffer` working on Mac
# https://discourse.brew.sh/t/help-with-unbuffer-cant-find-package-expect/1645/7
export TCLLIBPATH=“/usr/local/lib”
