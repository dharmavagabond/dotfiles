 [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

. $HOME/.env
. $HOME/.conf

 . /usr/local/bin/virtualenvwrapper.sh

if [ -f $HOME/.bashrc ];  then
  . $HOME/.bashrc
fi

