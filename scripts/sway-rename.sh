#!/bin/sh

new_name=$(rofi -dmenu -l 1 -p "Rename ")
swaymsg title_format "$new_name"
