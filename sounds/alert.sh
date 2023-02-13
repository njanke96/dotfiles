#!/bin/sh

if pgrep -x "paplay" > /dev/null
then
	exit 0
else
	paplay /home/nathan/sounds/notif.ogg
fi

