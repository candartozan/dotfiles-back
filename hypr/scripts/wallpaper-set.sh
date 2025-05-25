#!/bin/bash

if [ $# -eq 0 ]; then
  echo "Usage: $0 <path_to_image>"
  exit 1
fi

IMAGE="$1"

notify-send "Changing Theme" "Applying new wallpaper and updating colors, please wait until confirmation..."

# Set wallpaper
magick $IMAGE -blur 0x8 ~/.config/hypr/wallpapers/blurred/blurred.${IMAGE##*.}
hyprctl hyprpaper reload ,"~/.config/hypr/wallpapers/$IMAGE"
echo "preload = ~/.config/hypr/wallpapers/$IMAGE" >~/.config/hypr/hyprpaper.conf
echo "wallpaper = , ~/.config/hypr/wallpapers/$IMAGE" >>~/.config/hypr/hyprpaper.conf
echo "splash = false" >>~/.config/hypr/hyprpaper.conf
sed -i "15s|.*|  path = ~/.config/hypr/wallpapers/blurred/blurred.${IMAGE##*.}|" ~/.config/hypr/hyprlock.conf

# Use matugen
matugen image "$IMAGE"

# Refresh waybar
pkill waybar
waybar >/dev/null 2>&1 &

notify-send "Theme Applied" "Wallpaper and theme updated."
