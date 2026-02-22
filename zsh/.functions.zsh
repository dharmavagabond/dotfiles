function emptyfile() {
  :>! $1
  notify-send -a zsh -i kitty "Archivo vaciado"
}

function -(){
 cd -;
}

function update(){
  paru -Syu;
  mise upgrade;
  go-global-update;
  bun update -g;
}

function fzf-preview(){
  fzf --preview 'bat --style=numbers --color=always --line-range :500 {}';
}

function zel() {
  ZJ_SESSIONS=$(zellij list-sessions)
  NO_SESSIONS=$(echo "${ZJ_SESSIONS}" | wc -l)

  if [ "${NO_SESSIONS}" -ge 2 ]; then
    echo "${ZJ_SESSIONS}" | fzf --bind 'enter:become(zellij attach {})'
  else
    zellij attach -c
  fi
}

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

function reload() {
  source $ZDOTDIR/.aliases.zsh;
  source $ZDOTDIR/.functions.zsh
}

exit_zsh() { exit }

clear-screen-and-scrollback() {
  printf '\x1Bc'
  zle clear-screen
}
