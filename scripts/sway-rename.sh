#!/bin/sh

new_name=$(rofi -dmenu -p "Rename ")
swaymsg title_format "$new_name"
