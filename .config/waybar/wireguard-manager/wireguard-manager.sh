#!/usr/bin/env bash

SERVICE_NAME="wg-quick@MX-20"
STATUS_CONNECTED_STR='{"text":"Connected","class":"connected","alt":"connected"}'
STATUS_DISCONNECTED_STR='{"text":"Disconnected","class":"disconnected","alt":"disconnected"}'

function askpass() {
  fuzzel --dmenu --password --prompt-only="Sudo password:"
}

function status_wireguard() {
  systemctl is-active $SERVICE_NAME >/dev/null 2>&1
  return $?
}

function toggle_wireguard() {
  (status_wireguard && systemctl stop $SERVICE_NAME) || systemctl start $SERVICE_NAME
}

case $1 in
-s | --status)
  status_wireguard && echo "$STATUS_CONNECTED_STR" || echo "$STATUS_DISCONNECTED_STR"
  ;;
-t | --toggle)
  toggle_wireguard
  ;;
*)
  askpass
  ;;
esac
