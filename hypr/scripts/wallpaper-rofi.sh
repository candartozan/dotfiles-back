#!/bin/bash

WALL_DIR="/home/candar/.config/hypr/wallpapers"

CWD="$(pwd)"

cd "$WALL_DIR" || exit

IFS=$'\n'

SELECTED_WALL=$(for a in *.jpg *.jpeg *.png; do echo -en "$a\0icon\x1f$a\n"; done | rofi -dmenu -p "")

if [ -n "$SELECTED_WALL" ]; then
  ~/.config/hypr/scripts/wallpaper-set.sh "$SELECTED_WALL"
fi

cd "$CWD" || exit