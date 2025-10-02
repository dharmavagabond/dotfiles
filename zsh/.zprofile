#
# Executes commands at login pre-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
# Browser
#

if [[ -z "$BROWSER" && "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#

# if [[ -z "$EDITOR" ]]; then
#   export EDITOR='nano'
# fi
# if [[ -z "$VISUAL" ]]; then
#   export VISUAL='nano'
# fi
# if [[ -z "$PAGER" ]]; then
#   export PAGER='less'
# fi

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
  $HOME/{,s}bin(N)
  /opt/{homebrew,local}/{,s}bin(N)
  /usr/local/{,s}bin(N)
  $path
)

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X to enable it.
if [[ -z "$LESS" ]]; then
  export LESS='-g -i -M -R -S -w -X -z-4'
fi

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if [[ -z "$LESSOPEN" ]] && (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

##################
## USER DEFINED ##
##################

# Env
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache

export GOPATH="$XDG_DATA_HOME/go"
export ZDOTDIR="$XDG_DATA_HOME"/zsh

export PATH=$HOME/.local/bin:$PATH
export PATH=/usr/bin/core_perl:$PATH
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.cache/.bun/bin:$PATH"
export PATH="$PATH:$HOME/.lmstudio/bin"

export VISUAL="nvim"
export EDITOR="$VISUAL"
export GIT_EDITOR="$VISUAL"
export PAGER="moor"
export MANROFFOPT="-c"

# moor
export MOOR='-colors=auto -terminal-fg'

# k9s
export KUBE_EDITOR="$VISUAL"

# gpg
export GPG_TTY=$TTY

# fx
export FX_THEME=2

# rg
export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/ripgrep/.ripgreprc"

# LM Studio
export OPENAI_API_KEY=lm-studio

# Posting
export POSTING_PAGER_JSON=fx

# Stow
export STOW_DIR="$HOME/dotfiles"

# app2unit
export APP2UNIT_SLICES='a=app-graphical.slice b=background-graphical.slice s=session-graphical.slice'
