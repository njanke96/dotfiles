#!/bin/bash

if [[ "$1" == "up" ]]; then
  # get the default sink volume
  VOLUME=$(pactl list sinks | grep 'Volume: front-left:' | awk '{print $5}' | sed 's/[%|,]//g')

  if [ $VOLUME -lt 100 ]; then
    # increment the VOLUME by 5%
    pactl set-sink-volume @DEFAULT_SINK@ +5%
  fi
elif [[ "$1" == "down" ]]; then
  # get the default sink volume
  VOLUME=$(pactl list sinks | grep 'Volume: front-left:' | awk '{print $5}' | sed 's/[%|,]//g')

  if [ $VOLUME -gt 0 ]; then
    # decrement the VOLUME by 5%
    pactl set-sink-volume @DEFAULT_SINK@ -5%
  fi
else
  echo "Invalid argument. Please use 'up' or 'down'."
fi

