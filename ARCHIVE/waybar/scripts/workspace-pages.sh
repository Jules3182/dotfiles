#!/bin/bash

active=$(hyprctl activeworkspace -j | jq '.id')

if [ "$active" -le 5 ]; then
    start=1; end=5
elif [ "$active" -le 10 ]; then
    start=6; end=10
else
    start=11; end=15
fi

text=""

for i in $(seq $start $end); do
    if [ "$i" -eq "$active" ]; then
        text+="  <b>$i</b>  "
    else
        # echo "{\"class\":\"normal\"}"
        text+="  <span>$i</span>  "
    fi
done

echo "{\"text\":\"$text\",\"class\":\"items\"}"