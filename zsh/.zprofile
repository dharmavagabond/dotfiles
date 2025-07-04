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

# Keychain
/usr/bin/ssh-add --apple-load-keychain

# Env
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export GOPATH="$HOME/go"
export BUN_INSTALL="$HOME/.bun"
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/bin:$PATH
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH=$PATH:$GOPATH/bin
export PATH=$BUN_INSTALL/bin:$PATH
export PATH=".cargo/bin:$PATH"
export PATH="$PATH:$HOME/.lmstudio/bin"

export VISUAL="nvim"
export EDITOR="$VISUAL"
export GIT_EDITOR="$VISUAL"

# man
export MANPAGE="sh -c 'col -bx | bat -l man -p'"

# k9s
export KUBE_EDITOR="$VISUAL"

# gpg
export GPG_TTY=$TTY

#  Homebrew
export HOMEBREW_NO_ANALYTICS=1

# fx
export FX_THEME=2

# rg
export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/ripgrep/.ripgreprc"

# Zellij
export ZELLIJ_AUTO_EXIT=true
export ZELLIJ_AUTO_ATTACH=true
export ZELLIJ_LOCK=("vim" "nvim")

# Mise
export MISE_NPM_BUN=true

# Added by LM Studio CLI (lms)
export OPENAI_API_KEY=lm-studio

# ZSH help
export HELPDIR=/usr/local/share/zsh/help

# fzf
export FZF_DEFAULT_COMMAND='fd --type f --color=always --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS="--ansi"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Carapace
export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense'

# Posting
export POSTING_PAGER_JSON=fx

# Stow
export STOW_DIR="$HOME/.dotfiles"
