function emptyfile() {
  :>! $1
  notify-send --app-name=zsh --icon=kitty "Archivo vaciado"
}

function -(){
 cd -;
}

function update(){
  mount-ssd 2T
  systemctl --user stop hypridle.service;
  paru --sync --refresh --sysupgrade;
  mise upgrade;
  go-global-update;
  bun update --global;
  systemctl --user start hypridle.service;
}

function fzf-preview(){
  fzf --preview 'bat --style=numbers --color=always --line-range :500 {}';
}

function zel() {
  ZJ_SESSIONS=$(zellij list-sessions)
  NO_SESSIONS=$(echo "${ZJ_SESSIONS}" | wc --lines)

  if [ "${NO_SESSIONS}" -ge 2 ]; then
    echo "${ZJ_SESSIONS}" | fzf --bind 'enter:become(zellij attach {})'
  else
    zellij attach --create
  fi
}

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm --force -- "$tmp"
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

pbcopy() {
    local content

    if [ ! -t 0 ]; then
        content=$(cat)
    else
        content="$1"
    fi

    [ -z "$content" ] && return 1

    printf "%s" "$content" | clipse -c
    printf "%s" "$content" | clipse -a
}

optim_jpg() {
  if [ $# -eq 0 ]; then
    echo "Uso: optimizar_jpegs <directorio>"
    return 1
  fi

  local directorio="$1"

  if [ ! -d "$directorio" ]; then
    echo "Error: El directorio '$directorio' no existe"
    return 1
  fi

  echo "Optimizando imágenes JPEG en: $directorio"

  fd \
    --extension jpg \
    --extension jpeg \
    --print0 \
    --type file \
    . "$directorio" | parallel --jobs 8 --null --bar --eta jpegoptim --overwrite --strip-all {}

  echo "Optimización completada"
}

optim_png() {
  if [ $# -eq 0 ]; then
    echo "Uso: optim_png <directorio>"
    return 1
  fi

  local directorio="$1"

  if [ ! -d "$directorio" ]; then
    echo "Error: El directorio '$directorio' no existe"
    return 1
  fi

  echo "Optimizando imágenes PNG en: $directorio"

  fd \
    --extension png \
    --print0 \
    --type file \
    . "$directorio" | parallel --jobs 8 --null --bar --eta trimage --file={}

  echo "Optimización completada"
}
