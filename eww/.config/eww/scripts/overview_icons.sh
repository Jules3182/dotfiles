#!/bin/bash

clients=$(hyprctl clients -j)

for ws in $(seq 1 15); do

    icons=""

    classes=$(echo "$clients" | jq -r \
        ".[] | select(.workspace.id == $ws) | .class")

    for class in $classes; do

        class=$(echo "$class" | tr '[:upper:]' '[:lower:]')

        case "$class" in
            brave-browser)
                icon="󰖟"
                ;;
            com.mitchellh.ghostty)
                icon=""
                ;;
            org.gnome.nautilus)
                icon=""
                ;;
            brave-localhost__-default)
                icon="󰨞"
                ;;
            discord)
                icon=""
                ;;
            steam)
                icon=""
                ;;
            blender)
                icon=""
                ;;
            obsidian)
                icon="󰎚"
                ;;
            artix*)
                icon="󰞇"
                ;;
            blueman*)
                icon="󰂯"
                ;;
            mullvad*)
                icon=""
                ;;
            *)
                icon="󰘔"
                ;;
        esac

        icons="${icons}${icon}"

    done

    eww update ws${ws}icons="$icons"

done