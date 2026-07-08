#!/bin/bash

COUNTER="$HOME/.local/share/waybar/counter"

value=$(cat "$COUNTER")
echo $((value + 1)) > "$COUNTER"

pkill -SIGRTMIN+8 waybar