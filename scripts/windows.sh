#!/bin/bash
#

# ask for confirmation
zenity --question --title="Reboot to Windows?" --text="Are you sure you want to leave Glorious Void?"

response=$?

if ! [ $response -eq 0 ]; then
  exit 0
fi

# find the id of windows
windows_id=$(sudo efibootmgr | grep -i "Windows Boot" | sed -e 's/\s.*$//' -e 's/^Boot//' -e 's/\*$//' | tail -n 1)

# set default to windows
sudo efibootmgr -n "$windows_id"

# reboot
loginctl reboot
