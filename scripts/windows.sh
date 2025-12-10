#!/bin/bash
#

# set default to windows
sudo efibootmgr -n 0000

# reboot
loginctl reboot
