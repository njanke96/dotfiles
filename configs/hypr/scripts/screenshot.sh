#!/bin/sh

mkdir -p $HOME/Pictures/grim
slurp | grim -g - - | wl-copy && wl-paste > $HOME/Pictures/grim/$(date +'%Y-%m-%d-%H%M%S_grim.png')

