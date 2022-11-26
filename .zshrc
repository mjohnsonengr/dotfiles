# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Timestamp format in history file. See 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

if [ -f ~/.local_config/local.omz ]; then
    . ~/.local_config/local.omz
else
  # Path to your oh-my-zsh installation.
  export ZSH="$HOME/.oh-my-zsh"

  # Set name of the theme to load
  # See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
  ZSH_THEME="powerlevel10k/powerlevel10k"

  # Which plugins would you like to load?
  # Standard plugins can be found in $ZSH/plugins/
  # Custom plugins may be added to $ZSH_CUSTOM/plugins/
  # Example format: plugins=(rails git textmate ruby lighthouse)
  # Add wisely, as too many plugins slow down shell startup.
  plugins=(autojump git zsh-autosuggestions zsh-syntax-highlighting keychain)

  zstyle ':omz:update' mode auto      # update automatically without asking
  zstyle :omz:plugins:keychain agents ssh
  zstyle :omz:plugins:keychain identities id_ed25519
  zstyle :omz:plugins:keychain options --quiet

  source $ZSH/oh-my-zsh.sh
fi

# User configuration

# autoload custom functions
autoload -Uk core  # wrapper to preserve 2 physical cores for CPU-intense scripts

# Eternal history.
# ----------------
# Some of this copied from bashrc with no idea if its needed here.
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.zsh_eternal_history
# unlimited doesn't work on zsh
# https://unix.stackexchange.com/q/273861
export HISTSIZE=100000000
export SAVEHIST=100000000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
unsetopt INC_APPEND_HISTORY      # Don't incrementally write to history file.
setopt SHARE_HISTORY             # Share (live-sync) history between sessions.
setopt APPEND_HISTORY            # Write to the history file when the shell exits.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.

DEFAULT_USER=mej
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=10"

# Intellij Stable at front of path
export PATH=/opt/intellij-ce-stable/bin:$PATH
export PATH=$HOME/bin:$PATH

# Editor
export EDITOR=nvim
export VISUAL=nvim

# dircolors
eval `dircolors ~/.dircolors`

# direnv (for lorri)
if command -v direnv &> /dev/null
then
  eval "$(direnv hook zsh)"
fi

# Setup fzf
source /usr/share/doc/fzf/examples/key-bindings.zsh
if [[ -f /usr/share/doc/fzf/examples/completion.zsh ]]; then
  source /usr/share/doc/fzf/examples/completion.zsh
fi

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.local_config/local.aliases ]; then
    . ~/.local_config/local.aliases
fi

if [ -f ~/.local_config/local.zshrc ]; then
    . ~/.local_config/local.zshrc
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[[ ! -f ~/.local_config/local.p10k.zsh ]] || source ~/.local_config/local.p10k.zsh ]]

[ -f "/home/mej/.ghcup/env" ] && source "/home/mej/.ghcup/env" # ghcup-env
if [ -e /home/mej/.nix-profile/etc/profile.d/nix.sh ]; then . /home/mej/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/mej/opt/google-cloud-sdk/path.zsh.inc' ]; then . '/home/mej/opt/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/mej/opt/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/mej/opt/google-cloud-sdk/completion.zsh.inc'; fi

# The next line enables shell command completion for kubectl
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)

# GKE gcloud auth plugin for kubectl
export USE_GKE_GCLOUD_AUTH_PLUGIN=True
