. $HOME/.conf
. $(brew --prefix nvm)/nvm.sh

if which pyenv > /dev/null; then
  eval "$(pyenv init -)";
  pyenv virtualenvwrapper;
fi

if which rbenv > /dev/null; then
  eval "$(rbenv init -)";
fi
