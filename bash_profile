# Call ~/.bashrc from ~/.bash_profile, to keep all setup in one place
# Normally, bash_profile is only loaded on login
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi
source ~/.clever_bash
. ~/nvm/nvm.sh
source /usr/local/bin/virtualenvwrapper.sh
