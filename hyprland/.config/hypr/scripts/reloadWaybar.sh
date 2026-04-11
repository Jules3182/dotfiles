#!/bin/bash

killall -9 waybar
killall -9 swaync

waybar &
waybar -c ~/.config/waybar/config-bottom.jsonc
swaync