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
    hyprctl hyprpaper reload "$WALLPAPER2"
    echo "moon" > "$STATE_FILE"
    
    eww update wallpaper_mode="moon"
    eww open wallpaper_popup
    hyprctl hyprpaper wallpaper "DP-3, $WALLPAPER2"
    hyprctl hyprpaper wallpaper "HDMI-A-1,$WALLPAPER2"


    sleep 2
    eww close wallpaper_popup

else
    hyprctl hyprpaper reload "$WALLPAPER1"
    echo "snow" > "$STATE_FILE"

    eww update wallpaper_mode="snow"
    eww open wallpaper_popup
    hyprctl hyprpaper wallpaper "DP-3, $WALLPAPER1"
    hyprctl hyprpaper wallpaper "HDMI-A-1,$WALLPAPER1"

    sleep 2
    eww close wallpaper_popup
fi
