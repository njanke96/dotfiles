#!/bin/sh

# lock screen when inactive for more than 5 minutes
# turn off screen when inactive for more than 10 minutes
# (uncomment to) suspend after 15 minutes

lock="$HOME/.config/hypr/scripts/lock.sh"

swayidle -w \
        before-sleep "$lock" \
		timeout 300 "$lock" \
		timeout 600 "systemctl suspend" \
			resume "hyprctl dispatch dpms on" \

