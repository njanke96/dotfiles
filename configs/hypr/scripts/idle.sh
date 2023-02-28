#!/bin/sh

# lock screen when inactive for more than 5 minutes
# turn off screen when inactive for more than 10 minutes
# (uncomment to) suspend after 15 minutes

lock="$HOME/.config/hypr/scripts/lock.sh"
suspendd="$HOME/.config/hypr/scripts/suspend.sh"

swayidle -w \
    after-resume "$lock" \
		timeout 300 "$lock" \
		timeout 600 "$suspendd" \
			resume "$lock; hyprctl dispatch dpms on" \

