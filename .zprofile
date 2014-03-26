. $HOME/.conf
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
pyenv virtualenvwrapper
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
