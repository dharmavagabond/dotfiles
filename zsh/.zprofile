#
# Executes commands at login pre-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

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
export ZDOTDIR="$XDG_DATA_HOME/zsh"

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

# app2unit (uwsm integration)
export APP2UNIT_SLICES='a=app-graphical.slice b=background-graphical.slice s=session-graphical.slice'

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

path=('/usr/bin/core_perl/' $path)
path=("$HOME/.cargo/bin" $path)
path=("$XDG_CACHE_HOME/.bun/bin" $path)
path=("$HOME/.local/bin" $path)
path+=("$HOME/.lmstudio/bin")

# Set the list of directories that Zsh searches for programs.
path=(
  $HOME/.local/bin
  /opt/{homebrew,local}/{,s}bin(N)
  /usr/local/{,s}bin(N)
  $path
)
