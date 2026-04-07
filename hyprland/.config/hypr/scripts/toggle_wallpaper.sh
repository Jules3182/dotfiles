#!/bin/bash

STATE_FILE="$HOME/.config/hypr/.wallpaper_state"

WALLPAPER1="$HOME/wallpapers/snow.jpg"
WALLPAPER2="$HOME/wallpapers/moon.jpg"

# Default state
if [ ! -f "$STATE_FILE" ]; then
  echo "snow" > "$STATE_FILE"
fi

STATE=$(cat "$STATE_FILE")

if [ "$STATE" = "snow" ]; then
  hyprctl hyprpaper preload "$WALLPAPER2"
  hyprctl hyprpaper wallpaper "DP-3,$WALLPAPER2"
  hyprctl hyprpaper wallpaper "HDMI-A-1,$WALLPAPER2"
  echo "moon" > "$STATE_FILE"
else
  hyprctl hyprpaper preload "$WALLPAPER1"
  hyprctl hyprpaper wallpaper "DP-3,$WALLPAPER1"
  hyprctl hyprpaper wallpaper "HDMI-A-1,$WALLPAPER1"
  echo "snow" > "$STATE_FILE"
fi


