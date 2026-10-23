#!/usr/bin/env bash

ans=$(echo 'no,yes' | rofi -sep ',' -dmenu -p "$1 " -l 2)

if [[ "$ans" == "yes" ]]; then
  exit 0
fi

exit 1
