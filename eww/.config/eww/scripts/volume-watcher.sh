#!/usr/bin/env bash

last_state=""

while true; do
    output=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)

    volume=$(echo "$output" | awk '{printf "%d", $2 * 100}')

    if echo "$output" | grep -q '\[MUTED\]'; then
        muted="true"
    else
        muted="false"
    fi

    state="${volume}:${muted}"

    if [[ "$state" != "$last_state" ]]; then
        last_state="$state"

        # Update EWW values
        eww update volume="$volume"
        eww update volume_muted="$muted"

        # Show OSD
        eww update volume_osd_visible=true

        # Reset hide timer
        pkill -f "volume-osd-hide" 2>/dev/null

        (
            exec -a volume-osd-hide bash -c '
                sleep 2
                eww update volume_osd_visible=false
            '
        ) &
    fi

    sleep 0.1
done