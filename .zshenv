# https://unix.stackexchange.com/a/71258/155777
# This should have variables and functions available to everything

if [ -f ~/.local_config/local.zshenv ]; then
  source ~/.local_config/local.zshenv
fi
. "$HOME/.cargo/env"
