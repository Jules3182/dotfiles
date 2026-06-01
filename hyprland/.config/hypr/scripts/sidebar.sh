#!/bin/bash

PID=""

show_bar() {
    if [ -z "$PID" ] || ! kill -0 "$PID" 2>/dev/null; then
        waybar -c "$HOME/.config/waybar/sidebar.jsonc" &
        PID=$!
    fi
}

hide_bar() {
    if [ -n "$PID" ]; then
        kill "$PID" 2>/dev/null
        PID=""
    fi
}

VISIBLE=0
EDGE=3
WIDTH=250

while true; do
    X=$(hyprctl cursorpos -j | jq -r '.x')

    if (( X <= EDGE )) && (( VISIBLE == 0 )); then
        show_bar
        VISIBLE=1
    fi

    if (( X > WIDTH )) && (( VISIBLE == 1 )); then
        hide_bar
        VISIBLE=0
    fi

    sleep 0.05
done