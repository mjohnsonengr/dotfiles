# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
  # include .bashrc if it exists
  if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
  fi
fi

# source local.profile
if [ -f "$HOME/.local_config/local.profile" ]; then
  . "$HOME/.local_config/local.profile"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes .local/bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
  PATH="$HOME/.local/bin:$PATH"
fi

# set PATH so it includes bin/scritps and bin/links if they exist.
if [ -d "$HOME/bin/scripts" ] ; then
  PATH="$HOME/bin/scripts:$PATH"
fi
if [ -d "$HOME/bin/links" ] ; then
  PATH="$HOME/bin/links:$PATH"
fi

# set PATH so it includes local rubies.
if which ruby >/dev/null && which gem >/dev/null; then
  PATH="$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi

# disable CTRL-S behavior so it doesn't freeze things like vim or man.
stty -ixon

eval `dircolors "$HOME/.dircolors"`
