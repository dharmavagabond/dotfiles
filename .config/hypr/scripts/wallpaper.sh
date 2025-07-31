#!/bin/bash

# Monitor
display="${1:-DP-1}"

# Images folder
imgs="${2:anime}"

# Set the path to the wallpapers directory
wallpapersDir="$HOME/Pictures/walls/$imgs"

# Start an infinite loop
while true; do
  waypaper --backend swww --fill fill --folder "$wallpapersDir" --random --monitor "$display"
  sleep 30s
done
