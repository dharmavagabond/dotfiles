. $HOME/.env
. $HOME/.conf

if [ -f $HOME/.bashrc ];  then
  . $HOME/.bashrc
fi

if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
