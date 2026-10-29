#!/bin/sh

tries=3
export SVDIR="$HOME/.config/service"

while [ "$tries" -gt 0 ]; do
	if sv check pipewire >/dev/null 2>&1; then
		exit 0
	fi
	tries=$((tries - 1))
	[ "$tries" -gt 0 ] && sleep 1
done

exit 1
