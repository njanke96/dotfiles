#!/bin/bash
#

# ask for confirmation
zenity --question --title="Log out?" --text="Are you sure you want to log out?"

response=$?

if ! [ $response -eq 0 ]; then
  exit 0
fi

swaymsg exit
