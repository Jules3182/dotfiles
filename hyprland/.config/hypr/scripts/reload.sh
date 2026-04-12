#!/bin/bash

killall -9 waybar
killall -9 swaync
killall -9 hyprpaper

waybar &
waybar -c ~/.config/waybar/config-bottom.jsonc
swaync
hyprpaper