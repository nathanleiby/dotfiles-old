##############################################################################
# 01. General Env                                                            #
##############################################################################

### TODO:
### Scripts - installed by env setup script
export PATH=$PATH:/usr/local/bin/scripts

### Ruby: RVM "manager"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

### Python: Virtual Env

# Python: VirtualEnvWrapper
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# cache pip-installed packages to avoid re-downloading
if [[ `uname` == 'Darwin' ]]; then
  export PIP_DOWNLOAD_CACHE=$HOME/Library/Caches/pip-downloads #osx path
else
  export PIP_DOWNLOAD_CACHE=$HOME/.pip_download_cache #linux path
fi

# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true

### Heroku Toolbelt

export PATH="/usr/local/heroku/bin:$PATH"

### NodeJS

# node version manager
. ~/nvm/nvm.sh
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh # This loads NVM

# node package manager - have npm-installed binaries picked up
# export PATH=/usr/local/share/npm/bin:$PATH
# export PATH=$NVM_BIN:$PATH

### Homebrew
# make sure that any files Homebrew installs will be in your system path
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

### Packer
export PATH=/usr/local/packer:$PATH

# export EDITOR='vim'
export EDITOR='subl -w'

## Homebrew
export HOMEBREW_NO_EMOJI='1'
export HOMEBREW_DEVELOPER='1'

### Bash History
HISTFILESIZE=1000000000
HISTSIZE=1000000

# append to history
shopt -s histappend

# Z search: https://github.com/rupa/z
source ~/dotfiles/z/z.sh

# Must press Ctrl+D twice before you exit shell
export IGNOREEOF=1

# Support for bazaar
# https://github.com/Homebrew/homebrew/issues/316
export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH

##############################################################################
# 02. Aliases                                                                #
##############################################################################

### Bash Profile
alias bp="subl ~/.bashrc ~/.bash_profile_private ~/.bash_profile"
alias sbp="source ~/.bashrc"

### Python (PIP)
pipInstallAll() {
  for req in `ls requirements*.txt`; do
    pip install -r $req;
  done
}
alias pip_install_all=pipInstallAll
alias pip_uninstall_all="pip freeze | xargs pip uninstall -y"

### CoffeeScript
alias c='coffee'

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
alias gaa='git add -p -A'
alias gb='git branch'
alias gc='git commit'
alias gca='git commit --amend'
alias gcv='git commit --no-verify' #skips pre-commit hook (tests), e.g. for simple amend of message
alias gcav='git commit --amend --no-verify' #I like to live dangerously

alias gl='git lg'
alias gls='git log --oneline --decorate' # short git log
alias gco='git checkout'
alias gpp='git pull && git push'
alias gp='git pull'
alias gr='git reset'
alias groll='git checkout HEAD~1' #rollback 1 commit

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
alias v='vim'

# Time - print current unixtime
alias unixtime='date +%s'

##############################################################################
# 03. Theme/Colors                                                           #
##############################################################################

### Shell prompt

#export PS1="\n\[\e[0;36m\]┌─[\[\e[0m\]\[\e[1;33m\]\u\[\e[0m\]\[\e[1;36m\] @ \[\e[0m\]\[\e[1;33m\]\h\[\e[0m\]\[\e[0;36m\]]─[\[\e[0m\]\[\e[1;34m\]\w\[\e[0m\]\[\e[0;36m\]]\[\e[0;36m\]─[\[\e[0m\]\[\e[0;31m\]\t\[\e[0m\]\[\e[0;36m\]]\[\e[0m\]\n\[\e[0;36m\]└─[\[\e[0m\]\[\e[1;37m\]\$\[\e[0m\]\[\e[0;36m\]]› \[\e[0m\]"
#export PS1="\u@\h\w$ "

# CLI Colors
export CLICOLOR=1

# Set "ls" colors
export LSCOLORS=Gxfxcxdxbxegedabagacad

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

LIGHTNING_BOLT="*"
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

##############################################################################
# 04. Auto-completion
##############################################################################

# Bash... itself
source /etc/bash_completion

# Fabric
source ~/.fab-completion.bash

# Pip (python package manager)
source ~/.pip-completion.bash

# Heroku
source ~/.heroku-completion.bash

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

##############################################################################
# 05. Experimental (TBD if useful)
##############################################################################

# TODO: Add a 'list commands' for bash that will tell me all my private aliases in a beautiful way
# TODO: Move methods out of here and include from separate files

## Not sure...

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

# TODO: This belong somewhere else, otherwise cant be invoked by sudo user
allcrons(){
  for user in $(cut -f1 -d: /etc/passwd); do crontab -u $user -l; done
}

# Coffee
complete -o default -o nospace -F coffee g # Autocomplete for coffee?? but for what?

# ## Go Version Manager (gvm)
# if [[ -s $HOME/.gvm/scripts/gvm ]]; then
#     source $HOME/.gvm/scripts/gvm
# fi

alias grsp='git reset --soft HEAD~1'
alias bash_analyze='cut -f1 -d" " .bash_history | sort | uniq -c | sort -nr | head -n 30'
alias lt="ls -AGlFTtr" # alias of ls that puts recently modified files at the bottom
alias mod="lt | tail"
alias grs="git reset --soft 'HEAD^'" # undo last commit, but keep all changes

# Probably not...

alias vundle="vim +PluginInstall +qall" # install all vundle bundles/plugins
# error running godoc directly due to path/env mumbo jumbo https://github.com/moovweb/gvm/issues/45
alias godocumentation="$GOROOT/bin/godoc -http=:8080"

##############################################################################
# 06. Private Bash - may things in existing bash, too
##############################################################################

### Private Bash Profile: API Keys, etc
if [ -f ~/.bash_profile_private ]; then
  source $HOME/.bash_profile_private
else
  echo "Could not find $HOME/.bash_profile_private. You may be missing API Keys, etc"
fi
