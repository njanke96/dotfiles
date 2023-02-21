#!/bin/bash

# This script will monitor battery status and set the refresh rate to 60 while on bat,
# otherwise 120.
#
# This aims to recreate the behavior of the ASUS refresh rate service on Windows

LAST_REFRESH_RATE="0"

function get_rr {
    LAST_REFRESH_RATE=$(hyprctl monitors | sed -n '2s/.*@\([0-9]\+\)\.[0-9]\+ at 0x0/\1/p')
}

function set_rr_60 {
    echo "Setting refresh rate to 60..."
    hyprctl keyword monitor eDP-1,2560x1440@60,0x0,1.5
}

function set_rr_120 {
    echo "Setting refresh rate to 120..."
    hyprctl keyword monitor eDP-1,2560x1440@120,0x0,1.5
}

while true; do
    if [ $(cat /sys/class/power_supply/BAT0/status) == "Discharging" ]
    then
        get_rr
        if [ "$LAST_REFRESH_RATE" != "60" ]
        then
            set_rr_60
        fi
    else
        get_rr
        if [ "$LAST_REFRESH_RATE" != "120" ]
        then
            set_rr_120
        fi
    fi

    sleep 1
done

