# locale
unset LANG
source /etc/profile.d/locale.sh

# Git extras
if [ -f /usr/share/doc/git-extras/git-extras-completion.zsh ]; then
  source /usr/share/doc/git-extras/git-extras-completion.zsh
fi

# Forgit
if [ -f $XDG_DATA_HOME/zsh/forgit/forgit.plugin.zsh ]; then
  source $XDG_DATA_HOME/zsh/forgit/forgit.plugin.zsh
fi

# F-Sy-H
if [ -f $XDG_DATA_HOME/zsh/f-sy-h/F-Sy-H.plugin.zsh ]; then
  source $XDG_DATA_HOME/zsh/f-sy-h/F-Sy-H.plugin.zsh
fi

# Mise
if command -v mise &>/dev/null; then
  eval "$(mise activate zsh)"
fi

# Carapace
if command -v carapace &>/dev/null && command -v vivid &>/dev/null; then
  export LS_COLORS=$(vivid generate rose-pine)
  zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
  source <(carapace _carapace)
fi

# FZF
if command -v fzf &>/dev/null; then
  source <(fzf --zsh)
fi

# Atuin
if command -v fzf &>/dev/null; then
  export ZSH_AUTOSUGGEST_STRATEGY=(atuin history completion)
  eval "$(atuin init zsh)"
fi


# Zoxide
if command -v zoxide &>/dev/null; then
  eval "$(zoxide init zsh)"
fi

# Zellij
if command -v zellij &>/dev/null; then
  eval "$(zellij setup --generate-auto-start zsh)"
fi
