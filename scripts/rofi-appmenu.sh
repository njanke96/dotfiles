#!/usr/bin/env bash

# Friendly Name | Standard Unfriendly Name | System Icon
MENU_MAPPING="Accessories|Utility|applications-accessories
Development|Development|applications-development
Education|Education|applications-education
Games|Game|applications-games
Graphics|Graphics|applications-graphics
Internet|Network|applications-internet
Multimedia|AudioVideo|applications-multimedia
Office|Office|applications-office
Settings|Settings|preferences-system
System|System|applications-system"

DMENU_INPUT=$(echo "$MENU_MAPPING" | awk -F '|' '{printf "%s\\0icon\\x1f%s\n", $1, $3}')

while true; do

    # 
    SELECTION=$(echo -e "$DMENU_INPUT" | rofi -dmenu -i -p "Applications" -show-icons)

    # Exit on no selection
    [ -z "$SELECTION" ] && exit 0

    # Look up the non-friendly category name
    REAL_CATEGORY=$(echo "$MENU_MAPPING" | awk -F '|' -v sel="$SELECTION" '$1 == sel {print $2}')

    # Show category
    rofi -show drun -drun-categories "$REAL_CATEGORY"

    # Exit if rofi cleanly did, otherwise restart from the app menu
    if [ $? -eq 0 ]; then
        echo "it was zero!!"
        exit 0
    fi
done
