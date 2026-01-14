#!/bin/sh

# temporary fix for https://github.com/swaywm/swayidle/issues/198
(/home/nathan/scripts/can-idle.nu && loginctl suspend) || exit 0

