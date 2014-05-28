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

alias pip_install_requirements="pip install -r requirements.txt"
alias pip_uninstall_all="pip freeze | xargs pip uninstall -y"

### Heroku Toolbelt

export PATH="/usr/local/heroku/bin:$PATH"

### NodeJS
# node package manager - have npm-installed binaries picked up
export PATH=/usr/local/share/npm/bin:$PATH

# node version manager
. ~/nvm/nvm.sh
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh # This loads NVM

### Homebrew
# make sure that any files Homebrew installs will be in your system path
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

##############################################################################
# 02. Aliases                                                                #
##############################################################################

### CoffeeScript
alias c='coffee'
complete -o default -o nospace -F coffee g

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

# Tab completion for commands
source ~/.git-completion.bash # Git

# Autocomplete for 'g' as well
alias g='git'
complete -o default -o nospace -F _git g

# Aliases
# TODO: Add these to gitconfig instead
alias gs='git status'
alias gst='git status -uno' #tracked files only
alias gss='git status -sb' # short status
alias gd='git diff' #ignore whitespace
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

alias gl='git log'
alias gls='git log --oneline --decorate' # short git log
alias gco='git checkout'
alias gpp='git pull && git push'
alias gr='git reset'
alias groll='git checkout HEAD~1' #rollback 1 commit

gitstashcheckoutpop() {
    # Git checkout, with stash+pop
    git stash
    git checkout $1
    git stash pop
}
alias gcs=gitstashcheckoutpop

### Dotfiles
alias dot='cd ~/dotfiles'

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

alias bp="vim ~/.bashrc ~/.bash_profile_private ~/.bash_profile"
alias sb="source ~/.bashrc"
alias sbp="source ~/.bashrc"
alias mou="open /Applications/Mou.app"

# Checkout a remote branch and begin tracking it
# git checkout -b test origin/test

alias ~="cd ~"
alias dev="cd ~/dev"
alias p="cd ~/Projects"

source ~/.fab-completion.bash
source ~/.pip-completion.bash

## Homebrew
export HOMEBREW_NO_EMOJI='1'
export HOMEBREW_DEVELOPER='1'

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

## Tab Completions
set completion-ignore-case On


## Custom prompt
# Colors
       RED="\[\033[0;31m\]"
      PINK="\[\033[1;31m\]"
    YELLOW="\[\033[1;33m\]"
     GREEN="\[\033[0;32m\]"
  LT_GREEN="\[\033[1;32m\]"
      BLUE="\[\033[0;34m\]"
     WHITE="\[\033[1;37m\]"
    PURPLE="\[\033[1;35m\]"
      CYAN="\[\033[1;36m\]"
     BROWN="\[\033[0;33m\]"
COLOR_NONE="\[\033[0m\]"

LIGHTNING_BOLT="⚡"
      UP_ARROW="↑"
    DOWN_ARROW="↓"
      UD_ARROW="↕"
      FF_ARROW="→"
       RECYCLE="♺"
        MIDDOT="•"
     PLUSMINUS="±"

function parse_git_branch {
  remote_pattern_ahead="Your branch is ahead of"
  remote_pattern_behind="Your branch is behind"
  remote_pattern_ff="Your branch (.*) can be fast-forwarded."
  diverge_pattern="Your branch and (.*) have diverged"

  branch=$(git symbolic-ref --short HEAD 2>/dev/null)

  [[ -z $branch ]] && return

  git_status="$(git status 2> /dev/null)"
  # if [[ ! ${git_status} =~ ${branch_pattern} ]]; then
  #   # Rebasing?
  #   toplevel=$(git rev-parse --show-toplevel 2> /dev/null)
  #   [[ -z "$toplevel" ]] && return

  #   [[ -d "$toplevel/.git/rebase-merge" || -d "$toplevel/.git/rebase-apply" ]] && {
  #     sha_file="$toplevel/.git/rebase-merge/stopped-sha"
  #     [[ -e "$sha_file" ]] && {
  #       sha=`cat "${sha_file}"`
  #     }
  #     echo "${PINK}(rebase in progress)${COLOR_NONE} ${sha}"
  #   }
  #   return
  # fi

  # Dirty?
  if [[ ! ${git_status} =~ "working directory clean" ]]; then
    [[ ${git_status} =~ "modified:" ]] && {
      git_is_dirty="${RED}${LIGHTNING_BOLT}"
    }

    [[ ${git_status} =~ "Untracked files" ]] && {
      git_is_dirty="${git_is_dirty}${WHITE}${MIDDOT}"
    }

    [[ ${git_status} =~ "new file:" ]] && {
      git_is_dirty="${git_is_dirty}${LT_GREEN}+"
    }

    [[ ${git_status} =~ "deleted:" ]] && {
      git_is_dirty="${git_is_dirty}${RED}-"
    }

    [[ ${git_status} =~ "renamed:" ]] && {
      git_is_dirty="${git_is_dirty}${YELLOW}→"
    }
  fi

  # Are we ahead of, beind, or diverged from the remote?
  if [[ ${git_status} =~ ${remote_pattern_ahead} ]]; then
    remote="${YELLOW}${UP_ARROW}"
  elif [[ ${git_status} =~ ${remote_pattern_ff} ]]; then
    remote_ff="${WHITE}${FF_ARROW}"
  elif [[ ${git_status} =~ ${remote_pattern_behind} ]]; then
    remote="${YELLOW}${DOWN_ARROW}"
  elif [[ ${git_status} =~ ${diverge_pattern} ]]; then
    remote="${YELLOW}${UD_ARROW}"
  fi

  echo "${remote}${remote_ff}${GREEN}(${branch})${COLOR_NONE}${git_is_dirty}${COLOR_NONE}"
}

function setWindowTitle {
  case $TERM in
    *xterm*|ansi)
      echo -n -e "\033]0;$*\007"
      ;;
  esac
}

function set_prompt {
  # Whenever displaying the prompt, write the previous line to disk:
  history -a

  [[ -n $HOMEBREW_DEBUG_INSTALL ]] && \
    homebrew_prompt="${BROWN}Homebrew:${COLOR_NONE} debugging ${HOMEBREW_DEBUG_INSTALL}\n"

  git_prompt="$(parse_git_branch)"

  PS1="[\w] ${git_prompt}${COLOR_NONE}\n${homebrew_prompt}\$ "

  # Include VirtualEnv in Git-aware prompt
  if [ -z "$VIRTUAL_ENV_DISABLE_PROMPT" ] ; then
      _OLD_VIRTUAL_PS1="$PS1"
      if [ "x" != x ] ; then
          PS1="$PS1"
      else
      if [ "`basename \"$VIRTUAL_ENV\"`" = "__" ] ; then
          # special case for Aspen magic directories
          # see http://www.zetadev.com/software/aspen/
          PS1="[`basename \`dirname \"$VIRTUAL_ENV\"\``] $PS1"
      else
          PS1="(`basename \"$VIRTUAL_ENV\"`)$PS1"
      fi
      fi
  fi

  export PS1
  setWindowTitle "${PWD/$HOME/~}"
}
export PROMPT_COMMAND=set_prompt


function git-root {
  root=$(git rev-parse --git-dir 2> /dev/null)
  [[ -z "$root" ]] && root="."
  dirname $root
}


# Reveal current or provided folder in Path Finder
function pf {
  target_path="$(cd ${1:-"$PWD"} && PWD)"
  osascript<<END
tell app "Path Finder"
  reveal POSIX file("$target_path")
  activate
end tell
END
}

# Open a manpage in Preview, which can be saved to PDF
function pman {
   man -t "${1}" | open -f -a /Applications/Preview.app
}

# Open a manpage in the browser
function bman {
  man "${1}" | man2html | browser
}

function pgrep {
  local exclude="\.svn|\.git|\.swp|\.coverage|\.pyc|_build"
  find . -maxdepth 1 -mindepth 1 | egrep -v "$exclude" | xargs egrep -lir "$1" | egrep -v "$exclude" | xargs egrep -Hin --color "$1"
}

export EDITOR='vim'
#export EDITOR='subl -w'

# TODO: This belong somewhere else, otherwise cant be invoked by sudo user
allcrons(){
    for user in $(cut -f1 -d: /etc/passwd); do crontab -u $user -l; done
}

# Vagrant autocompletion
if [ -f `brew --prefix`/etc/bash_completion.d/vagrant ]; then
    source `brew --prefix`/etc/bash_completion.d/vagrant
fi
# complete -W "$(echo `vagrant --help | awk '/box/,/up/ {print $1}'`;)" vagrant

# Go Version Manager (gvm)
if [[ -s $HOME/.gvm/scripts/gvm ]]; then
    source $HOME/.gvm/scripts/gvm
fi

export PATH=/usr/local/packer:$PATH

nis() {
  npm install $@ --save
}

# Support for bazaar
# https://github.com/Homebrew/homebrew/issues/316
export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH

alias grsp='git reset --soft HEAD~1'
alias v='vim'

## EXPERIMENTAL

#alias npml='npm --registry http://npmjs.intranet:1337/'
# npm install --save(-dev)

HISTFILESIZE=1000000000
HISTSIZE=1000000

# append to history
shopt -s histappend

alias bash_analyze='cut -f1 -d" " .bash_history | sort | uniq -c | sort -nr | head -n 30'

# Compress the cd, ls -l series of commands.
alias lc="cl"
function cl () {
   if [ $# = 0 ]; then
      cd && ll
   else
      cd "$*" && ll
   fi
}

alias lt="ls -AGlFTtr" # alias of ls that puts recently modified files at the bottom
alias mod="lt | tail"
CDPATH='~/dev:~/Downloads'

# autocompletion for bash commands
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Press Ctrl+D twice before you exit shell...
export IGNOREEOF=1

alias grs="git reset --soft 'HEAD^'" # undo last commit, but keep all changes

# Consider starting mongodb with a different data path
#mongod --dbpath

export PATH=$PATH:/usr/local/bin/scripts

### API Keys, etc
if [ -f ~/.bash_profile_private ]
then
    source $HOME/.bash_profile_private
else
    echo "Could not find $HOME/.bash_profile_private. You may be missing API Keys, etc"
fi

