#!/bin/bash

# Массив возможных разрешений
resolutions=("1920x1080" "1366x768" "1280x1024" "1024x768" "800x600")

# Массив возможных ориентаций
rotations=("normal" "left" "right" "inverted")

# Получение имени экрана
screen=$(xrandr | grep " connected" | cut -d ' ' -f1)

# Проверка, найден ли экран
if [ -z "$screen" ]; then
  echo "Экран не найден!"
  exit 1
fi

echo "Будет разыгран экран: $screen"
echo "Для остановки скрипта нажмите Ctrl+C"

# Бесконечный цикл изменения разрешения и ориентации
while true; do
  # Выбор случайного разрешения
  res=${resolutions[$RANDOM % ${#resolutions[@]}]}

  # Выбор случайной ориентации
  rot=${rotations[$RANDOM % ${#rotations[@]}]}

  # Применение
  xrandr --output "$screen" --mode "$res" --rotate "$rot"
done
