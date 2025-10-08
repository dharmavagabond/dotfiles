#!/usr/bin/env bash

SERVICE_NAME="MX-20"

function status_wireguard() {
  networkctl status "$SERVICE_NAME" --json=short | jq -rc '
  {
    text: .OnlineState | (if . == "online" then "Connected" else "Disconnected" end),
    class: .OnlineState | (if . == "online" then "connected" else "disconnected" end),
    alt: .OnlineState | (if . == "online" then "connected" else "disconnected" end),
  }'
}

function toggle_wireguard() {
  STATUS=$(networkctl status "$SERVICE_NAME" --json=short | jq -r .OnlineState)
  if [ "$STATUS" == "online" ]; then
    pkexec sudo networkctl down "$SERVICE_NAME"
  else
    pkexec sudo -A networkctl up "$SERVICE_NAME"
  fi
}

case $1 in
-s | --status)
  status_wireguard
  ;;
-t | --toggle)
  toggle_wireguard
  ;;
esac
