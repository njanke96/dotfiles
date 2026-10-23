#!/bin/bash
#

# ask for confirmation
"$HOME/scripts/rofi-yn.sh" "Reboot to Windows?"

response=$?

if ! [ $response -eq 0 ]; then
  exit 0
fi

# find the id of windows
windows_id=$(efibootmgr | grep -i "Windows Boot" | sed -e 's/\s.*$//' -e 's/^Boot//' -e 's/\*$//' | tail -n 1)

# set default to windows
doas efibootmgr -n "$windows_id"

# reboot
loginctl reboot
