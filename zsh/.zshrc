# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/prezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/prezto/init.zsh"
fi

# Customize to your needs...
source "${ZDOTDIR:-$HOME}/.aliases.zsh"
source "${ZDOTDIR:-$HOME}/.functions.zsh"
source "${ZDOTDIR:-$HOME}/.activations.zsh"
