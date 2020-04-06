# Source Prezto.
#if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
#  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
#fi

# Include bash_profile (which includes bashrc)
source ~/.bash_profile

# Plugins
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source /Users/NathanLeiby/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source /Users/NathanLeiby/.zsh/history.zsh
source /Users/NathanLeiby/.zsh/vi-mode.plugin.zsh

eval "$(starship init zsh)"
