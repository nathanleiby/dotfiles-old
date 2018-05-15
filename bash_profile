if [ -f ~/.clever_bash ]; then source ~/.clever_bash; else echo "ERROR: Could not find ~/.clever_bash"; fi
if [ -f ~/.bashrc ]; then source ~/.bashrc; else echo "ERROR: Could not find ~/.bashrc"; fi

export PATH="$HOME/.cargo/bin:$PATH"
