#!/bin/bash

# This does not:
# 1. Install Tailscale
# 2. Setup SSH key

mkdir -p $HOME/src/cloned
mkdir $HOME/bin
mkdir -p $HOME/.local/share/fonts
mkdir -p $HOME/.config/nvim/bundle
mkdir -p $HOME/.config/autostart

# Install oh-my-zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Add ghar and use it to install dotfiles
git clone https://github.com/philips/ghar.git $HOME/src/ghar
rm $HOME/.profile $HOME/.bashrc $HOME/.zshrc
$HOME/src/ghar/bin/ghar install

# TODO: Install common utilities I like to use?
# bat, fd-find, fzf, ripgrep, git-crecord
# zoxide, broot
# neovim (and related setup)