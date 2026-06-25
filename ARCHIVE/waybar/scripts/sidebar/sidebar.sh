#!/bin/bash

PID_LEFT=""
PID_RIGHT=""

VISIBLE_LEFT=0
VISIBLE_RIGHT=0

EDGE=3
WIDTH=250


show_bar_left() {
    if [ -z "$PID_LEFT" ] || ! kill -0 "$PID_LEFT" 2>/dev/null; then
        waybar -c "$HOME/.config/waybar/sidebar-left.jsonc" &
        PID_LEFT=$!
    fi
}

hide_bar_left() {
    if [ -n "$PID_LEFT" ]; then
        kill "$PID_LEFT" 2>/dev/null
        PID_LEFT=""
    fi
}

show_bar_right() {
    echo "SHOW RIGHT"
    if [ -z "$PID_RIGHT" ] || ! kill -0 "$PID_RIGHT" 2>/dev/null; then
        waybar -c "$HOME/.config/waybar/sidebar-right.jsonc" &
        PID_RIGHT=$!
        echo "PID_RIGHT=$PID_RIGHT"
    fi
}

hide_bar_right() {
    if [ -n "$PID_RIGHT" ]; then
        kill "$PID_RIGHT" 2>/dev/null
        PID_RIGHT=""
    fi
}

while true; do
    X=$(hyprctl cursorpos -j | jq -r '.x')
    SCREEN_WIDTH=2560

    RIGHT_SHOW=$((SCREEN_WIDTH - EDGE))
    RIGHT_HIDE=$((SCREEN_WIDTH - WIDTH))

    # LEFT SIDE
    if (( X <= EDGE )) && (( VISIBLE_LEFT == 0 )); then
        show_bar_left
        VISIBLE_LEFT=1
    fi

    if (( X > WIDTH )) && (( VISIBLE_LEFT == 1 )); then
        hide_bar_left
        VISIBLE_LEFT=0
    fi

    # RIGHT SIDE
    if (( X >= RIGHT_SHOW )) && (( VISIBLE_RIGHT == 0 )); then
        show_bar_right
        VISIBLE_RIGHT=1
    fi

    if (( X < RIGHT_HIDE )) && (( VISIBLE_RIGHT == 1 )); then
        hide_bar_right
        VISIBLE_RIGHT=0
    fi

    sleep 0.05
done