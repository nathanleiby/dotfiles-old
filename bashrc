##############################################################################
# 00. General Env                                                            #
##############################################################################

### Homebrew
# make sure that any files Homebrew installs will be in your system path
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export HOMEBREW_NO_EMOJI='1'
export HOMEBREW_DEVELOPER='1'

### Editor
export EDITOR=nvim
export VISUAL=nvim

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

# Home dir for Glide, go version manager
# https://github.com/Masterminds/glide
export GLIDE_HOME=~/.glide

### Git
# if `hub` exists, add it as a Git alias
if `which hub > /dev/null`; then
  eval "$(hub alias -s)"
fi

##############################################################################
# 02. Aliases                                                                #
##############################################################################

### Bash / ZSH Profile
alias bp="$EDITOR ~/.bashrc ~/.bash_profile_private ~/.bash_profile"
alias sbp="source ~/.bash_profile"
alias sz="source ~/.zshrc"

### Python (PIP)
pipInstallAll() {
  for req in `ls requirements*.txt`; do
    pip install -r $req;
  done
}
alias pip_install_all=pipInstallAll
alias pip_uninstall_all="pip freeze | xargs pip uninstall -y"

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
alias lst='ls -ltr'
alias lt='lst'

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
alias lt="ls -AGlFTtr" # alias of ls that puts recently modified files at the bottom
alias mod="lt | tail"


# TODO: Necessary when not using Vagrant?
# Reuse existing SSH auth, so credentials get passed correctly to tmux
if [[ -S "$SSH_AUTH_SOCK" && ! -h "$SSH_AUTH_SOCK" ]]; then
  ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock;
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock;

## TODO: Try
#function m() { make $@ 2>&1 | make2tap | tap-simple; }

# android dev
export ANDROID_HOME=~/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

# cw = watch CircleCI build output
alias cw="circle --watch"

# TODO: Make a virtual env with same name as current directory
alias mve='mkvirtualenv $(basename $(pwd))'

# Add code dirs to CDPATH
export CDPATH=.:~:~/go/src/github.com/Clever:~/go/src/github.com/nathanleiby

# Make aliases
alias m='make'
alias mb='make build'
alias mt='make test'
alias mr='make run'

# watch + pretty-print go test output
#
# requires:
# - unbuffer (https://apple.stackexchange.com/questions/193138/to-install-unbuffer-in-osx)
# - richgo (https://github.com/kyoh86/richgo)
alias watch_go_test="watch --color unbuffer richgo test"

# [ -f ~/.fzf.bash ] && source ~/.fzf.bash
