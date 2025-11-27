#!/bin/bash

until sway-audio-idle-inhibit; do
  if [[ $(pgrep -f sway-audio-idle-inhibit) != 0 ]]; then
    echo "sway-audio-idle-inhibit is running, exiting saii.sh" >&2
    exit 0
  fi
  echo "sway-audio-idle-inhibit exited with code $? and will respawn" >&2
  sleep 1
done 
