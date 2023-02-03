#!/bin/sh

# lock screen when inactive for more than 3 minutes
# turn off screen when inactive for more than 10 minutes
# (uncomment to) suspend after 15 minutes

lock="pkill -o swaylock; swaylock -f -C $HOME/.config/hypr/swaylock.conf"

swayidle -w \
        before-sleep "$lock" \
		timeout 180 "$lock" \
		timeout 600 "hyprctl dispatch dpms off" \
			resume "hyprctl dispatch dpms on" # \
#		timeout 900 "systemctl suspend" \
#			resume "hyperctl dispatch dpms on"
