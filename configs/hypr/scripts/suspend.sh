#!/bin/bash

# This script will suspend only while on bat

if [ $(cat /sys/class/power_supply/BAT0/status) == "Discharging" ]
then
    systemctl suspend
fi

