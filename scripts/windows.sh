#!/bin/bash
#

# ask for confirmation
zenity --question --title="Reboot to Windows?" --text="Are you sure you want to leave Glorious Void?"

response=$?

if ! [ $response -eq 0 ]; then
  exit 0
fi

# set default to windows
sudo efibootmgr -n 0000

# reboot
loginctl reboot
