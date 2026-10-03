for f in "${XDG_DATA_HOME:-$HOME/.local/share}/zsh/hooks/"*.zsh(N); do
  source "$f"
done
