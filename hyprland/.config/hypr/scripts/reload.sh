#!/bin/bash

killall -9 waybar
killall -9 swaync
killall -9 hyprpaper
killall -9 eww

waybar &
waybar -c ~/.config/waybar/config-bottom.jsonc &
swaync &
hyprpaper &
eww daemon &

hyprctl notify 1 2000 "rgb(ffffff)" "Reloaded Hyprland Accessories! "

# NOT WORKING PROPERLY
# sleep 2
#
#notify-send -u critical -i /usr/share/icons/HighContrast/256x256/actions/view-refresh.png "Reloaded Hyprland Accessories!"