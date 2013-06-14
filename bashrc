### TODO: Add a 'list commands' for bash that will tell me all my private aliases in a beautiful way

##############################################################################
# 01. General                                                                #
##############################################################################

## API Keys, etc
if [ -f ~/.bash_profile_private ]
then
    source ~/.bash_profile_private
else
    echo "Could not find ~/.bash_profile_private. You may be missing API Keys, etc"
fi

# Shell prompt
export PS1="\n\[\e[0;36m\]┌─[\[\e[0m\]\[\e[1;33m\]\u\[\e[0m\]\[\e[1;36m\] @ \[\e[0m\]\[\e[1;33m\]\h\[\e[0m\]\[\e[0;36m\]]─[\[\e[0m\]\[\e[1;34m\]\w\[\e[0m\]\[\e[0;36m\]]\[\e[0;36m\]─[\[\e[0m\]\[\e[0;31m\]\t\[\e[0m\]\[\e[0;36m\]]\[\e[0m\]\n\[\e[0;36m\]└─[\[\e[0m\]\[\e[1;37m\]\$\[\e[0m\]\[\e[0;36m\]]› \[\e[0m\]"

# use Hub, light wrapper on git https://github.com/defunkt/hub for GitHub connection
eval "$(hub alias -s)"

# Ruby: RVM "manager"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

### Python: Virtual Env
# Python: VirtualEnvWrapper
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# cache pip-installed packages to avoid re-downloading
export PIP_DOWNLOAD_CACHE=$HOME/Library/Caches/pip-downloads #osx path
#export PIP_DOWNLOAD_CACHE=$HOME/.pip_download_cache

# virtualenv should use Distribute instead of legacy setuptools
#export VIRTUALENV_DISTRIBUTE=true
# Centralized location for new virtual environments
#export PIP_VIRTUALENV_BASE=$HOME/Virtualenvs
# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true
syspip(){
   PIP_REQUIRE_VIRTUALENV="" pip "$@"
} # can use syspip command to install packages globally

### Path exports
export PS1="\u@\h\w$ "
export SENCHA_CMD_3_0_0="/Users/pika/bin/Sencha/Cmd/3.0.0.250"
export PATH=/Users/pika/bin/Sencha/Cmd/3.0.0.250:$PATH

# MAMP mysql at command line
export PATH=$PATH:/Users/pika/bin/


##############################################################################
# 02. Aliases                                                                #
##############################################################################
# Enable colors in "ls" command output
alias ls="ls -Glah"

### Grep
alias grep='grep --color'
alias fgrep='fgrep --color'
alias grep='grep --color'

### Git

### LS
# Show hidden files, colored
alias lsa='ls -FGa'
alias la='lsa'

# Show hidden files as list, colored
alias lsl='ls -FGal'
alias ll='lsl'

# Show regular files, colored
alias l='ls -FG'

### Commmon directories
alias d='cd ~/Downloads'
alias p='cd ~/Projects'
alias r='cd ~/Projects/Raxa-private'
alias c='cd ~/Projects/caris'
alias ce='cd ~/Projects/chuck_engine/engine/'

### Application shortcuts
# Python
alias py='python'

# iPython
alias ipy='ipython'

# Git
alias g='git'
source ~/.git-completion.bash 	# Tab completion for commands
complete -o default -o nospace -F _git g 	# Autocomplete for 'g' as well
alias gs='git status'
alias gst='git status -uno' #tracked files only
alias gss='git status -sb' # short status
alias gd='git diff'
alias gdw='git diff -w' #ignore whitespace
alias ga='git add'
alias gau='git add -u'
alias gb='git branch'
alias gc='git commit'
alias gcv='git commit --no-verify' #skips pre-commit hook (tests), e.g. for simple amend of message
alias gl='git log'
alias gls='git log --oneline --decorate' # short git log
alias gco='git checkout'

# Sqlite3
alias sq='sqlite3'

# SublimeText open folder shortcut
alias e='subl . &'


##############################################################################
# 03. Theme/Colors                                                           #
##############################################################################
# CLI Colors
export CLICOLOR=1
# Set "ls" colors
export LSCOLORS=Gxfxcxdxbxegedabagacad
