. $HOME/.conf
. $(brew --prefix nvm)/nvm.sh

# Function to get help on zsh functions and builtins
unalias run-help
autoload run-help

# Added by Nix installer
if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi
