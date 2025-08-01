# Git extras
source /usr/share/doc/git-extras/git-extras-completion.zsh

# Forgit
source $XDG_DATA_HOME/zsh/forgit/forgit.plugin.zsh

# F-Sy-H
source $XDG_DATA_HOME/zsh/f-sy-h/F-Sy-H.plugin.zsh

# Mise
eval "$(mise activate zsh)"

# Carapace
export LS_COLORS=$(vivid generate catppuccin-mocha)
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
source <(carapace _carapace)

# FZF
source <(fzf --zsh)

# Atuin
export ZSH_AUTOSUGGEST_STRATEGY=(atuin history completion)
eval "$(atuin init zsh)"

# Zoxide
eval "$(zoxide init zsh)"

# Zellij
eval "$(zellij setup --generate-auto-start zsh)"
