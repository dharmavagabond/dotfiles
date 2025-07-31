#!/bin/bash

start_mpvpaper() {
  mpvpaper -s -o "no-audio loop=4 hwdec=auto gpu-api=vulkan loop-playlist=inf shuffle" HDMI-A-1 ~/Videos/wallpapers
}

kill_mpvpaper() {
  killall mpvpaper
}

while true; do
  start_mpvpaper
  sleep 3m
  kill_mpvpaper
  sleep 1
done
