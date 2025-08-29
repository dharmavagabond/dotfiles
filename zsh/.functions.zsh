function mdir() {
  mkdir -p $1 && cd $1
}

function emptyfile() {
  :> $1  # cat /dev/null > $1
  noti -t "Archivo vaciado"
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
  source $HOME/.aliases.zsh;
  source $HOME/.functions.zsh
}

# Create a desktop launcher for a web app
function web2app() {
  if [ "$#" -ne 3 ]; then
    echo "Usage: web2app <AppName> <AppURL> <IconURL> (IconURL must be in PNG -- use https://dashboardicons.com)"
    return 1
  fi


  local APP_NAME="$1"
  local APP_URL="$2"
  local ICON_URL="$3"
  local ICON_DIR="$HOME/.local/share/applications/icons"
  local DESKTOP_FILE="$HOME/.local/share/applications/${APP_NAME}.desktop"
  local ICON_PATH="${ICON_DIR}/${APP_NAME}.png"


  mkdir -p "$ICON_DIR"


  if ! curl -sL -o "$ICON_PATH" "$ICON_URL"; then
    echo "Error: Failed to download icon."
    return 1
  fi


  cat > "$DESKTOP_FILE" <<EOF
[Desktop Entry]
Version=1.0
Name=$APP_NAME
Comment=$APP_NAME
Exec=brave --new-window --ozone-platform=wayland --app=$APP_URL --name=$APP_NAME --class=$APP_NAME
Terminal=false
Type=Application
Icon=$ICON_PATH
StartupNotify=true
EOF


  chmod +x "$DESKTOP_FILE"
}
