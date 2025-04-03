#!/bin/bash

OUTPUT_FILE="/home/matipan/Videos/$(date +%Y-%m-%d-%T).mp4"

if pgrep -x "wf-recorder" > /dev/null; then
    # If wf-recorder is running, stop it
    pkill -SIGINT wf-recorder
    sleep 0.3  # Wait for 300ms
    notify-send "Screen Recording" "Saved recording to $OUTPUT_FILE"
else
    # If wf-recorder is not running, start it
    GEOMETRY=$(slurp)
    if [ -n "$GEOMETRY" ]; then
        wf-recorder -g "$GEOMETRY" -f "$OUTPUT_FILE" &
    else
        notify-send "Screen Recording" "Selection cancelled"
    fi
fi
