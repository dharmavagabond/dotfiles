. $HOME/.conf
. $(brew --prefix nvm)/nvm.sh
. `brew --prefix`/etc/profile.d/z.sh

# Function to get help on zsh functions and builtins
unalias run-help
autoload run-help
