### API Keys, etc
if [ -f ~/.bash_profile_private ]
then
    source ~/.bash_profile_private
else
    echo "Could not find ~/.bash_profile_private. You may be missing API Keys, etc"
fi

##############################################################################
# 01. General                                                                #
##############################################################################

### Shell prompt

export PS1="\n\[\e[0;36m\]┌─[\[\e[0m\]\[\e[1;33m\]\u\[\e[0m\]\[\e[1;36m\] @ \[\e[0m\]\[\e[1;33m\]\h\[\e[0m\]\[\e[0;36m\]]─[\[\e[0m\]\[\e[1;34m\]\w\[\e[0m\]\[\e[0;36m\]]\[\e[0;36m\]─[\[\e[0m\]\[\e[0;31m\]\t\[\e[0m\]\[\e[0;36m\]]\[\e[0m\]\n\[\e[0;36m\]└─[\[\e[0m\]\[\e[1;37m\]\$\[\e[0m\]\[\e[0;36m\]]› \[\e[0m\]"
export PS1="\u@\h\w$ "

### Ruby: RVM "manager"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

### Python: Virtual Env

# Python: VirtualEnvWrapper
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# cache pip-installed packages to avoid re-downloading
export PIP_DOWNLOAD_CACHE=$HOME/Library/Caches/pip-downloads #osx path
#export PIP_DOWNLOAD_CACHE=$HOME/.pip_download_cache #linux path

# virtualenv should use Distribute instead of legacy setuptools
#export VIRTUALENV_DISTRIBUTE=true
# Centralized location for new virtual environments
#export PIP_VIRTUALENV_BASE=$HOME/Virtualenvs
# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true
syspip(){
   PIP_REQUIRE_VIRTUALENV="" pip "$@"
} # can use syspip command to install packages globally

### Heroku Toolbelt

export PATH="/usr/local/heroku/bin:$PATH"

### NodeJS
# node package manager - have npm-installed binaries picked up
export PATH=/usr/local/share/npm/bin:$PATH

# node version manager
. ~/nvm/nvm.sh

### Homebrew
# make sure that any files Homebrew installs will be in your system path
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

##############################################################################
# 02. Aliases                                                                #
##############################################################################

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

### Git

# Tab completion for commands
source ~/.git-completion.bash

# Autocomplete for 'g' as well
alias g='git'
complete -o default -o nospace -F _git g

# Aliases
alias gs='git status'
alias gst='git status -uno' #tracked files only
alias gss='git status -sb' # short status
alias gd='git diff'
alias gdw='git diff -w' #ignore whitespace
alias ga='git add'
alias gau='git add -u'
alias gaa='git add -A'
alias gb='git branch'
alias gc='git commit'
alias gcv='git commit --no-verify' #skips pre-commit hook (tests), e.g. for simple amend of message
alias gl='git log'
alias gls='git log --oneline --decorate' # short git log
alias gco='git checkout'
alias gpp='git pull && git push'
alias gr='git checkout HEAD~1' #rollback 1 commit

### Other

# Application shortcuts
alias py='python'
alias ipy='ipython'
alias rb='ruby'
alias sq='sqlite3'

# SublimeText open folder shortcut
alias e='subl . &'

# Json Pretty Printing
prettyprintjson() {
    $@ | python -mjson.tool
    #for type in "$@"; do
    #    echo $type
    #done
}
alias pprint=prettyprintjson

# Useful directory aliases
alias d='cd ~/Downloads'

# Get my IP on WiFi (OSX)
alias my_ip='/sbin/ifconfig en1| grep "inet "| cut -d" " -f2'

##############################################################################
# 03. Theme/Colors                                                           #
##############################################################################
# CLI Colors
export CLICOLOR=1

# Set "ls" colors
export LSCOLORS=Gxfxcxdxbxegedabagacad

##############################################################################
# 04. Experimental (TBD if useful)
##############################################################################

# TODO: Add a 'list commands' for bash that will tell me all my private aliases in a beautiful way

# use Hub, light wrapper on git https://github.com/defunkt/hub for GitHub connection
# eval "$(hub alias -s)"