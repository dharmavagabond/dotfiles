function emptyfile() {
  :>! $1
  notify-send --urgency=low --app-name=zsh --icon=kitty "Archivo vaciado"
}

function -(){
 cd -;
}

update(){
  noctalia msg caffeine-enable &>/dev/null
  trap 'noctalia msg caffeine-disable' EXIT
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

optim_jpg() {
  if [ $# -eq 0 ]; then
    echo "Uso: optim_jpg <directorio> [distancia] [subsampling]" >&2
    echo "  distancia: 1.0-3.0 (default: 2.0)" >&2
    echo "  subsampling: 444|440|422|420 (default: 420)" >&2
    return 1
  fi

  local directory="$1"
  local distance="${2:-2.0}"
  local subsampling="${3:-420}"
  local cores="$(nproc)"
  local cmd="cjpegli --distance=$distance --chroma_subsampling=$subsampling"

  if [ ! -d "$directory" ]; then
    echo "Error: El directorio '$directory' no existe" >&2
    return 1
  fi

  echo "Optimizando imágenes JPEG en: $directory" >&2
  echo "  Distancia: $distance, Submuestreo: $subsampling, Jobs: $cores" >&2

  fd \
    --extension jpg \
    --extension jpeg \
    --print0 \
    --type file \
    . "$directory" | parallel --jobs "$cores" --null --bar --eta \
      "$cmd {} {.}.tmp && mv {.}.tmp {} || rm -f {.}.tmp"
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
