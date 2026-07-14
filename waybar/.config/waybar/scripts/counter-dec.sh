#!/bin/bash

COUNTER="$HOME/.local/share/waybar/counter"

value=$(cat "$COUNTER")
new=$((value - 1))
echo "$new" > "$COUNTER"

# Interpolates notification color from green to red between 0 and 30
r=$((64 + ((28 - 64) * new / 30)))
g=$((1 + ((216 - 1) * new / 30)))
b=$((1 + ((40 - 1) * new / 30)))

color="#$(printf '%02X' $r)$((g < 256 ? g : 0))$((b < 256 ? b : 0))"
hyprctl notify 1 2000 "rgb($((r<256?r:0)),$((g<256?g:0)),$((b<256?b:0)))" "$new"

pkill -SIGRTMIN+8 waybar