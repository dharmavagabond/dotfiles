# fast-syntax-highlighting
if [ -f $XDG_DATA_HOME/zsh/fsh/fast-syntax-highlighting.plugin.zsh ]; then
  source $XDG_DATA_HOME/zsh/fsh/fast-syntax-highlighting.plugin.zsh
fi

# fzf-tab
if [ -f $XDG_DATA_HOME/zsh/fzf-tab/fzf-tab.plugin.zsh ]; then
  source $XDG_DATA_HOME/zsh/fzf-tab/fzf-tab.plugin.zsh
fi

# Prezto
if [ -f $XDG_DATA_HOME/zsh/prezto/init.zsh ]; then
  ZSH_COMPDUMP="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump-$ZSH_VERSION"
  source $XDG_DATA_HOME/zsh/prezto/init.zsh
fi

# Forgit
if [ -f /usr/share/zsh/plugins/forgit/forgit.plugin.zsh ]; then
  source /usr/share/zsh/plugins/forgit/forgit.plugin.zsh
fi

# Oh my zsh plugins
source $ZDOTDIR/.ohmyzsh-plugins.zsh

# zsh-vi-mode
if [ -f /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh ]; then
  source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

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
    zvm_after_init_commands+=('source <(fzf --zsh)')
  fi
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

# Atuin
if command -v atuin &>/dev/null; then
  export ZSH_AUTOSUGGEST_STRATEGY=(atuin history completion)
  eval "$(atuin init zsh)"
fi

# Zoxide
if command -v zoxide &>/dev/null; then
  eval "$(zoxide init zsh)"
fi

# Batman
if command -v batman &>/dev/null; then
  eval "$(batman --export-env)"
fi

# fastfetch
if command -v fastfetch &>/dev/null; then
  fastfetch
fi

# Oh my posh
if command -v oh-my-posh &>/dev/null; then
  eval "$(oh-my-posh init zsh --config $XDG_CONFIG_HOME/oh-my-posh/config.toml)"
fi
