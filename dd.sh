#!/bin/bash

resolutions=("1920x1080" "1366x768" "1280x1024" "1024x768" "800x600")
rotations=("normal" "left" "right" "inverted")
screen=$(xrandr | grep " connected" | cut -d ' ' -f1)

if [ -z "$screen" ]; then
  echo "Экран не найден!"
  exit 1
fi

echo "Будет разыгран экран: $screen"
echo "Для остановки скрипта нажмите Ctrl+C"

while true; do
  res=${resolutions[$RANDOM % ${#resolutions[@]}]}
  rot=${rotations[$RANDOM % ${#rotations[@]}]}
  xrandr --output "$screen" --mode "$res" --rotate "$rot"
done
