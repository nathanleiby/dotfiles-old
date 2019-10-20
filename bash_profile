if [ -f ~/.clever_bash ]; then source ~/.clever_bash; else echo "ERROR: Could not find ~/.clever_bash"; fi
if [ -f ~/.bashrc ]; then source ~/.bashrc; else echo "ERROR: Could not find ~/.bashrc"; fi

export PATH="$HOME/.cargo/bin:$PATH"
#[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn
export PATH="/usr/local/opt/gettext/bin:$PATH"
