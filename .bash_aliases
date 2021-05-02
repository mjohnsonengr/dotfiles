# Various shortcuts
alias intellij="/opt/intellij-ce-stable/bin/idea.sh"
alias nv=nvim
alias term=gnome-terminal
alias vimdiff='nvim -d'

# ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# tmux
alias tn="tmx2 new-session -t"
alias ta="tmx2 attach -t"
alias tls="tmx2 list-s"

# Config file shortcuts
alias vimalias="nv ~/.bash_aliases"
alias sourcealias="source ~/.bash_aliases"
alias vimpath="nv ~/.path_aliases"
alias sourcepath="source ~/.path_aliases"
