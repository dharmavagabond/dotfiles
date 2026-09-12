# fancy-ctrl-z
if [ -f $ZDOTDIR/ohmyzsh/plugins/fancy-ctrl-z/fancy-ctrl-z.plugin.zsh ]; then
  source $ZDOTDIR/ohmyzsh/plugins/fancy-ctrl-z/fancy-ctrl-z.plugin.zsh
fi

# systemd
if [ -f $ZDOTDIR/ohmyzsh/plugins/systemd/systemd.plugin.zsh ]; then
  source $ZDOTDIR/ohmyzsh/plugins/systemd/systemd.plugin.zsh
fi

# tmux
if [ -f $ZDOTDIR/ohmyzsh/plugins/tmux/tmux.plugin.zsh ]; then
  export ZSH_TMUX_AUTONAME_SESSION=1
  export ZSH_TMUX_UNICODE=1
  source $ZDOTDIR/ohmyzsh/plugins/tmux/tmux.plugin.zsh
fi
