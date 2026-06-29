#!/bin/bash
export PATH="$PATH:$HOME/.local/bin"

read -p "Name your note:" notename

obsidian create name="$notename"

hyprctl notify 1 4000 "rgb(7E1DFB)" "Created New Note:  $notename"
