#!/bin/sh

# ignore slack
if [ $DUNST_DESKTOP_ENTRY == "Slack" ]; then
	exit 0
fi

if pgrep -x "paplay" > /dev/null
then
	exit 0
else
	paplay /home/nathan/sounds/notif.ogg
fi

