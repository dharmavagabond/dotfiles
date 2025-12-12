mkdir -p "$HOME/.local/share/zsh"

stow -Rv -t "$HOME" home
stow -Rv -t "$HOME/.local/share/zsh" zsh
stow -Rv -t "$HOME/.config" .config
