#!/usr/bin/bash

WALLPAPER_DIR="$HOME/.config/wallpapers"
WALLPAPERS=($(ls -d "$WALLPAPER_DIR"/*.jpg))
WALLPAPER=${WALLPAPERS[$RANDOM % ${#WALLPAPERS[@]}]}

hyprctl hyprpaper wallpaper ,$WALLPAPER,
