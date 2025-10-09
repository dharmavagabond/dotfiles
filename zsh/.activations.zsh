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

# fast-syntax-highlighting
if [ -f $XDG_DATA_HOME/zsh/fsh/fast-syntax-highlighting.plugin.zsh ]; then
  source $XDG_DATA_HOME/zsh/fsh/fast-syntax-highlighting.plugin.zsh
fi

# Mise
if command -v mise &>/dev/null; then
  export MISE_NPM_BUN=true
  eval "$(mise activate zsh)"
fi

# Carapace
if command -v carapace &>/dev/null && command -v vivid &>/dev/null; then
  export LS_COLORS=$(vivid generate rose-pine)
  export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense'
  zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
  source <(carapace _carapace)
fi

# FZF
if command -v fzf &>/dev/null; then
  export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
  export FZF_DEFAULT_OPTS="
    --color=fg:#908caa,bg:#191724,hl:#ebbcba
    --color=fg+:#e0def4,bg+:#26233a,hl+:#ebbcba
    --color=border:#403d52,header:#31748f,gutter:#191724
    --color=spinner:#f6c177,info:#9ccfd8
    --color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
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
  export ZELLIJ_AUTO_EXIT=true
  export ZELLIJ_LOCK=("vim" "nvim")
  eval "$(zellij setup --generate-auto-start zsh)"
fi
