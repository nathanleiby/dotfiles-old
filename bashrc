##############################################################################
# 00. General Env                                                            #
##############################################################################
echo "  _   _          _   _                 _   _           _"
echo " | | | |   ___  | | | |   ___         | \ | |   __ _  | |_    ___"
echo " | |_| |  / _ \ | | | |  / _ \        |  \| |  / _  | | __|  / _ \ "
echo " |  _  | |  __/ | | | | | (_) |  _    | |\  | | (_| | | |_  |  __/"
echo " |_| |_|  \___| |_| |_|  \___/  ( )   |_| \_|  \__,_|  \__|  \___|"
echo "                                |/"
echo ""

### TODO:
### Scripts - installed by env setup script
SCRIPTS_PATH=/usr/local/bin/scripts
mkdir -p $SCRIPTS_PATH
export PATH=$PATH:$SCRIPTS_PATH

### Homebrew
# make sure that any files Homebrew installs will be in your system path
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

### Packer
export PATH=/usr/local/packer:$PATH

### Personal binaries
export PATH=$HOME/bin/:$PATH

#export EDITOR='vim' # TODO: Compile YouCompleteMe binaries against vim. works?
#export TERM="xterm-256color"
#export EDITOR='nvim'
export EDITOR=vim

## Homebrew
export HOMEBREW_NO_EMOJI='1'
export HOMEBREW_DEVELOPER='1'

### Bash History
HISTFILESIZE=1000000000
HISTSIZE=1000000

# Z search: https://github.com/rupa/z
source ~/dotfiles/z/z.sh

# Must press Ctrl+D twice before you exit shell
export IGNOREEOF=1


### Python: Virtual Env

# Support for bazaar (and virtualEnv?)
# https://github.com/Homebrew/homebrew/issues/316
# export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH

# Python: VirtualEnvWrapper
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=`which python`
export VIRTUALENVWRAPPER_VIRTUALENV=`which virtualenv`

if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
  source /usr/local/bin/virtualenvwrapper.sh
fi

alias wo="workon"

### Heroku Toolbelt

export PATH="/usr/local/heroku/bin:$PATH"

### NodeJS
# node package manager - have npm-installed binaries picked up
export PATH=/usr/local/share/npm/bin:$PATH

# node version manager
if [ -f ~/nvm/nvm.sh ]; then
  . ~/nvm/nvm.sh
  [[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh # This loads NVM
fi


##############################################################################
# 02. Aliases                                                                #
##############################################################################

### Bash Profile
alias bp="$EDITOR ~/.bashrc ~/.bash_profile_private ~/.bash_profile"
alias sbp="source ~/.bashrc"

### Python (PIP)
pipInstallAll() {
  for req in `ls requirements*.txt`; do
    pip install -r $req;
  done
}
alias pip_install_all=pipInstallAll
alias pip_uninstall_all="pip freeze | xargs pip uninstall -y"

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
alias gdp='gd HEAD^1' #diff currect state against previous commit
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
alias rb='ruby'
alias sq='sqlite3'

# SublimeText
alias s='subl'

# Get my IP on WiFi (OSX)
alias my_ip='/sbin/ifconfig en1| grep "inet "| cut -d" " -f2'

# Vim
alias vim=$EDITOR
alias vi=vim
alias v=vim

# Time - print current unixtime
alias unixtime='date +%s'

# Daily tasks, timekeeping, ideas
alias t="vim ~/Dropbox\ \(Personal\)/today.md ~/Dropbox\ \(Personal\)/dailylog.md ~/Dropbox\ \(Personal\)/ideas.md"

##############################################################################
# 03. Theme/Colors                                                           #
##############################################################################

# (Switched to zsh)

##############################################################################
# 04. Bash Auto-completion
##############################################################################

# TODO: Do other autocompletion scripts if zsh

if [[ $SHELL == "/bin/bash" ]]; then

  # Bash... itself
  if [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
  fi

  # Fabric
  if [ -f ~/.fab-completion.bash ]; then
    source ~/.fab-completion.bash
  fi

  # Pip (python package manager)
  if [ -f ~/.pip-completion.bash ]; then
    source ~/.pip-completion.bash
  fi

  # Heroku
  if [ -f ~/.heroku-completion.bash ]; then
    source ~/.heroku-completion.bash
  fi

  # Homebrew
  if [[ -n `which brew` ]]; then
    # Add Homebrew completions and homebrew sourced completions
    source $(brew --repo)/Library/Contributions/brew_bash_completion.sh
    for comp in \
      $(brew --prefix)/etc/bash_completion \
      $(brew --prefix)/etc/bash_completion.d/git-completion.bash
    do
      [[ -e $comp ]] && source $comp
  done
  fi

  # Vagrant
  if [ -f `brew --prefix`/etc/bash_completion.d/vagrant ]; then
    source `brew --prefix`/etc/bash_completion.d/vagrant
  fi
  complete -W "$(echo `vagrant --help | awk '/box/,/up/ {print $1}'`;)" vagrant

  # Git
  source ~/.git-completion.bash

  # Autocomplete for 'g' as well
  alias g='git'
  complete -o default -o nospace -F _git g

  ## Tab Completion - overall settings
  set completion-ignore-case On

  ### Experimental
  # Coffee
  complete -o default -o nospace -F coffee g # Autocomplete for coffee?? but for what?

fi

##############################################################################
# 05. Experimental (TBD if useful)
##############################################################################

# TODO: Add a 'list commands' for bash that will tell me all my private aliases in a beautiful way
# TODO: Move methods out of here and include from separate files

# use Hub, light wrapper on git https://github.com/defunkt/hub for GitHub connection
# eval "$(hub alias -s)"

# Checkout a remote branch and begin tracking it
# git checkout -b test origin/test

# Compress the cd, ls -l series of commands.
alias lc="cl"
function cl () {
   if [ $# = 0 ]; then
      cd && ll
   else
      cd "$*" && ll
   fi
}

# TODO: This belongs somewhere else, otherwise cant be invoked by sudo user
allcrons(){
  for user in $(cut -f1 -d: /etc/passwd); do crontab -u $user -l; done
}


## Golang: Brew installed
export GOPATH=$HOME/go
#export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# Git aliases
alias grs="git reset --soft 'HEAD^'" # undo last commit, but keep all changes
alias grsp='git reset --soft HEAD~1'

alias bash_analyze='cut -f1 -d" " .bash_history | sort | uniq -c | sort -nr | head -n 30'
alias lt="ls -AGlFTtr" # alias of ls that puts recently modified files at the bottom
alias mod="lt | tail"

alias bd="cd .."

# shorter!
#alias m="mv"
alias c="cp"
alias f="fg"
alias xx="exit"

# try out the Silver Searcher: https://github.com/ggreer/the_silver_searcher
#alias grep='ag'

# error running godoc directly due to path/env mumbo jumbo https://github.com/moovweb/gvm/issues/45
alias godocumentation="$GOROOT/bin/godoc -http=:8080"

# Get UTC date
alias utc="date -u"

# TODO: How to pass creds even further, via mosh?
# Reuse existing SSH auth, so credentials get passed correctly to tmux
if [[ -S "$SSH_AUTH_SOCK" && ! -h "$SSH_AUTH_SOCK" ]]; then
  ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock;
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock;

# Connect to default tmux session
alias st="tmux attach -t base || tmux new -s base"

# Home dir for Glide, go version manager
# https://github.com/Masterminds/glide
export GLIDE_HOME=~/.glide
# Use Go1.5 vendoring
export GO15VENDOREXPERIMENT=1

alias got="go test"
alias gob="go build"
alias m="make"
alias mt="make test"

# if `hub` exists, add it as a Git alias
if `which hub > /dev/null`; then
  eval "$(hub alias -s)"
fi

alias sz="source ~/.zshrc"

##############################################################################
# 06. Private Bash - may things in existing bash, too
##############################################################################

### Private Bash Profile: API Keys, etc
if [ -f ~/.bash_profile_private ]; then
  source $HOME/.bash_profile_private
else
  echo "Could not find $HOME/.bash_profile_private. You may be missing API Keys, etc"
fi
