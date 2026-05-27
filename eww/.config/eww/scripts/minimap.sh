#!/bin/bash

PIDFILE="/tmp/eww-minimap.pid"

# Opens only if closed
eww windows | grep -q minimap || hyprctl eval 'hl.layer_rule({ match = { namespace = "gtk-layer-shell" }, blur = true, ignore_alpha = 0.1, animation = "none"})' && eww open minimap


# Resets timer
if [ -f "$PIDFILE" ]; then
    kill "$(cat "$PIDFILE")" 2>/dev/null
fi

(
    sleep 0.6
    eww close minimap
    # Resets the animations to slide
    sleep 0.6
    hyprctl eval 'hl.layer_rule({
        match        = { namespace = "gtk-layer-shell" },
        blur         = true,
        ignore_alpha = 0.1,
        animation = "slide top",
        })'
) &

echo $! > "$PIDFILE"