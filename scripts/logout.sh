#!/bin/bash
#

# ask for confirmation
"$HOME/scripts/rofi-yn.sh" "Log out?"

response=$?

if ! [ $response -eq 0 ]; then
  exit 0
fi

loginctl terminate-session "$XDG_SESSION_ID"
