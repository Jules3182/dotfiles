#!/bin/bash

killall -9 waybar

waybar &
waybar -c ~/.config/waybar/config-bottom.jsonc
