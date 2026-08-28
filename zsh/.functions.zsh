function emptyfile() {
  :>! $1
  notify-send --urgency=low --app-name=zsh --icon=kitty "Archivo vaciado"
}

function -(){
 cd -;
}

update(){
  noctalia msg caffeine-enable &>/dev/null
  trap 'noctalia msg caffeine-disable &>/dev/null' EXIT
  ssdctl mount 2T
  paru --sync --refresh --sysupgrade
  mise upgrade
  go-global-update
  bun update --global
}

fzf-preview(){
  fzf --preview 'bat --style=numbers --color=always --line-range :500 {}';
}

zel() {
  ZJ_SESSIONS=$(zellij list-sessions)
  NO_SESSIONS=$(echo "${ZJ_SESSIONS}" | wc --lines)

  if [ "${NO_SESSIONS}" -ge 2 ]; then
    echo "${ZJ_SESSIONS}" | fzf --bind 'enter:become(zellij attach {})' >&2
  else
    zellij attach --create
  fi
}

y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm --force -- "$tmp"
}

reload() {
  source $ZDOTDIR/.aliases.zsh;
  source $ZDOTDIR/.functions.zsh
}

exit_zsh() { exit }

clear-screen-and-scrollback() {
  printf '\x1Bc'
  zle clear-screen
}
