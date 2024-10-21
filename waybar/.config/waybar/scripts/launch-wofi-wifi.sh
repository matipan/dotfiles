#!/bin/bash

# Check if wofi-wifi-menu is running
if pgrep -x "wofi-wifi-menu" > /dev/null
then
    # If it's running, kill it
    pkill -x "wofi-wifi-menu"
else
    # If it's not running, start it
    wofi-wifi-menu
fi
