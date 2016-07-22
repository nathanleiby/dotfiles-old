## ----------------------------- ##
## Package Manager #1: oh-my-zsh ##
## ----------------------------- ##

##export ZSH=$HOME/.oh-my-zsh
#ZSH_THEME="robbyrussell"
#source $ZSH/oh-my-zsh.sh

## Add wisely, as too many plugins slow down shell startup.
#plugins=(git)


## Vi Mode
#bindkey -v

#bindkey '^P' up-history
#bindkey '^N' down-history
#bindkey '^?' backward-delete-char
#bindkey '^h' backward-delete-char
#bindkey '^w' backward-kill-word
#bindkey '^r' history-incremental-search-backward

#function zle-line-init zle-keymap-select {
    #VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
    #RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
    #zle reset-prompt
#}

#zle -N zle-line-init
#zle -N zle-keymap-select
#export KEYTIMEOUT=1


## ----------------------------- ##
## Package Manager #2: Prezto    ##
## ----------------------------- ##
# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi


## ----------------------------- ##
## General ZSH configuration     ##
## ----------------------------- ##

#export PATH="/home/vagrant/nvm/v0.10.29/bin:/usr/local/share/npm/bin:/usr/local/heroku/bin:/usr/local/packer:/usr/local/bin:/usr/local/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/local/bin/scripts:/home/vagrant/go/bin:/usr/local/opt/go/libexec/bin"

# History
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory

# Include my bash profile, too
source $HOME/.bash_profile

# Add Hub auto-complete
fpath=(~/.zsh/completions $fpath)
autoload -U compinit && compinit
