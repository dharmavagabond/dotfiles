# fancy-ctrl-z
if [ -f $XDG_DATA_HOME/zsh/ohmyzsh/plugins/fancy-ctrl-z/fancy-ctrl-z.plugin.zsh ]; then
  source $XDG_DATA_HOME/zsh/ohmyzsh/plugins/fancy-ctrl-z/fancy-ctrl-z.plugin.zsh
fi

# systemd
if [ -f $XDG_DATA_HOME/zsh/ohmyzsh/plugins/systemd/systemd.plugin.zsh ]; then
  source $XDG_DATA_HOME/zsh/ohmyzsh/plugins/systemd/systemd.plugin.zsh
fi

# tmux
if [ -f $XDG_DATA_HOME/zsh/ohmyzsh/plugins/tmux/tmux.plugin.zsh ]; then
  export ZSH_TMUX_AUTONAME_SESSION=1
  export ZSH_TMUX_UNICODE=1
  source $XDG_DATA_HOME/zsh/ohmyzsh/plugins/tmux/tmux.plugin.zsh
fi
