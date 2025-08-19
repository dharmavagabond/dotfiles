#!/bin/sh
# Changes the wallpaper to a randomly chosen image in a given directory
# at a set interval.

DEFAULT_INTERVAL=30 # In seconds
imgs=~/Pictures/walls/"${1}"
monitor="${2:-DP-1}"

if [ $# -lt 1 ] || [ ! -d "$imgs" ]; then
  printf "Usage:\n\t\e[1m%s\e[0m \e[4mDIRECTORY\e[0m [\e[4mMONITOR\e[0m] [\e[4mINTERVAL\e[0m]\n" "$0"
  printf "\tChanges the wallpaper to a randomly chosen image in DIRECTORY every\n\tINTERVAL seconds (or every %d seconds if unspecified)." "$DEFAULT_INTERVAL"
  exit 1
fi

# See swww-img(1)
RESIZE_TYPE="crop"
export SWWW_TRANSITION_FPS="${SWWW_TRANSITION_FPS:-60}"
export SWWW_TRANSITION="${SWWW_TRANSITION:-grow}"

while true; do
  find "$imgs" -type f |
    while read -r img; do
      echo "$(</dev/urandom tr -dc a-zA-Z0-9 | head -c 8):$img"
    done |
    sort -n | cut -d':' -f2- |
    while read -r img; do
      swww img --resize="$RESIZE_TYPE" "$img" -o "$monitor"
      sleep "${3:-$DEFAULT_INTERVAL}"
    done
done
