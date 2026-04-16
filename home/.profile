if [ -z "$_PROFILE_LOADED" ]; then
  export _PROFILE_LOADED=1

  if systemctl --quiet --user is-system-running; then
    while IFS= read -r line; do
      export "${line?}"
    done < <(systemctl --user show-environment 2>/dev/null)
  fi

  GPG_TTY=$(tty)

  export PATH="$HOME/.local/bin:$PATH"
  export GPG_TTY
  gpg-connect-agent updatestartuptty /bye >/dev/null
fi
