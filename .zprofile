. $HOME/.conf
. $(brew --prefix nvm)/nvm.sh

if which pyenv > /dev/null; then
  eval "$(pyenv init -)";
  pyenv virtualenvwrapper;
fi

if which rbenv > /dev/null; then
  eval "$(rbenv init -)";
fi

# Function to get help on zsh functions and builtins
unalias run-help
autoload run-help
