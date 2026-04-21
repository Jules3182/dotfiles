#!/bin/bash

STATE_FILE="$HOME/.config/hypr/.wallpaper_state"

if [ ! -f "$STATE_FILE" ]; then
  echo ""
  exit
fi

STATE=$(cat "$STATE_FILE")

if [ "$STATE" = "snow" ]; then
  echo ""
else
  echo ""
fi

