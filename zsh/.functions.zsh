function mozjpg() {
  mozjpeg -q $1 $2.jpg > $2-$1.jpg
}

function merge-mp4-m4a() {
  ffmpeg -i $1.mp4 -i $1.m4a -acodec copy -vcodec copy output.mp4
}

function git-addremove() {
  git ls-files --deleted | xargs git rm
  git add .
}

function thumbs() {
  mkdir thumbs && parallel "djpeg -scale 1/$1 -ppm {} | pnmscale -pixels 50246 | cjpeg -optimize -progressive > thumbs/{}" ::: *.jpg
}

function mdir() {
  mkdir -p $1 && cd $1
}

function pman() {
  ps=`mktemp -t manpageXXXX`.ps && man -t $@ > "$ps" && open "$ps"
}

function emptyfile() {
  :> $1  # cat /dev/null > $1
  noti -t "Archivo vaciado"
}

function -(){
 cd -;
}

function update(){
  brew update && brewu && brewc -s;
  mise upgrade;
  go-global-update;
  bun update -g;
  noti -t "Actualizar brew, mise, go y bun";
}

function fzf-preview(){
  fzf --preview 'bat --style=numbers --color=always --line-range :500 {}';
}

function zel() {
  ZJ_SESSIONS=$(zellij list-sessions)
  NO_SESSIONS=$(echo "${ZJ_SESSIONS}" | wc -l)

  if [ "${NO_SESSIONS}" -ge 2 ]; then
    zellij attach \
    "$(echo "${ZJ_SESSIONS}" | sk)"
  else
    zellij attach -c
  fi
}

function flush-dns() {
  sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder
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
 . $HOME/.aliases.zsh;
 . $HOME/.functions.zsh
}

function aero() {
  aerospace list-windows --all | fzf --bind 'enter:become(zsh -c "aerospace focus --window-id {1}")+abort'
}
