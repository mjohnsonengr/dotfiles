. ~/.profile

# http://go/soverflow/791765 disable XON/XOFF
# disable CTRL-S behavior so it doesn't freeze things like vim or man.
stty -ixon

if [ -e /home/mej/.nix-profile/etc/profile.d/nix.sh ]; then . /home/mej/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
