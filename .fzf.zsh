# Setup fzf
# ---------
if [[ ! "$PATH" == */usr/local/google/home/johnsonmarcus/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/usr/local/google/home/johnsonmarcus/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/usr/local/google/home/johnsonmarcus/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/usr/local/google/home/johnsonmarcus/.fzf/shell/key-bindings.zsh"
