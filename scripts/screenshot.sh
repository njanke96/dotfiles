#!/bin/sh
#
grim -g "$(slurp)" -t png - | wl-copy -t image/png; wl-paste > "$HOME/Pictures/screenshot.png"
