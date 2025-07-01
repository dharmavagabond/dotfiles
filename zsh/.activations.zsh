eval "$(/opt/homebrew/bin/brew shellenv)"

# Forgit
source $XDG_DATA_HOME/zsh/forgit/forgit.plugin.zsh

# F-Sy-H
source $XDG_DATA_HOME/zsh/f-sy-h/F-Sy-H.plugin.zsh

# Homebrew Command Not Found
HB_CNF_HANDLER="$(brew --repository)/Library/Taps/homebrew/homebrew-command-not-found/handler.sh"
if [ -f "$HB_CNF_HANDLER" ]; then
  source "$HB_CNF_HANDLER";
fi

# Mise
eval "$(mise activate zsh)"

# Carapace
export LS_COLORS=$(vivid generate catppuccin-mocha)
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
source <(carapace _carapace)

# FZF
source <(fzf --zsh)

# Atuin
eval "$(atuin init zsh)"

# Zoxide
eval "$(zoxide init zsh)"
