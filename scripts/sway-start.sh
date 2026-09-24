#!/bin/sh

# keyboard
export XKB_DEFAULT_LAYOUT=us
export XKB_DEFAULT_MODEL=pc104

# qt
export QT_QPA_PLATFORMTHEME=qt5ct

# cursor theme
export XCURSOR_SIZE=24
export XCURSOR_PATH=/usr/share/icons:/home/nathan/.local/share/icons
export XCURSOR_THEME=Notwaita-Black

# XDG env
export XDG_CACHE_HOME=/home/nathan/.cache
export XDG_CONFIG_DIRS=/etc/xdg
export XDG_CONFIG_HOME=/home/nathan/.config
export XDG_DATA_HOME=/home/nathan/.local/share
export XDG_DATA_DIRS=/usr/local/share:/usr/share:/var/lib/flatpak/exports/share:/home/nathan/.local/share:/home/nathan/.local/share/flatpak/exports/share

# Only for steam within sway (desktop or gamescope-bigpicture)
export PROTON_ENABLE_WAYLAND=1
export SDL_VIDEODRIVER=wayland
export SDL_VIDEO_DRIVER=wayland

# For HDR - disable if this causes issues
export WLR_RENDERER=vulkan

dbus-run-session sway
