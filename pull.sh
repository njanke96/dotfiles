#!/bin/bash

# Pull configs
mkdir -p ./configs/alacritty
mkdir -p ./configs/fish
mkdir -p ./configs/dunst
mkdir -p ./configs/gtk-3.0
mkdir -p ./configs/gtk-4.0
mkdir -p ./configs/hypr/scripts
mkdir -p ./configs/nvim
mkdir -p ./configs/omf
mkdir -p ./configs/rofi/themes
mkdir -p ./configs/waybar
mkdir -p ./sounds

cp -v $HOME/.config/alacritty/*.yml ./configs/alacritty/
cp -v $HOME/.config/fish/config.fish ./configs/fish/
cp -v $HOME/.config/dunst/dunstrc ./configs/dunst/
cp -v $HOME/.config/gtk-3.0/settings.ini ./configs/gtk-3.0/
cp -v $HOME/.config/gtk-4.0/settings.ini ./configs/gtk-4.0/
cp -v $HOME/.config/hypr/*.conf ./configs/hypr/
cp -v $HOME/.config/hypr/scripts/*.sh ./configs/hypr/scripts/
cp -v $HOME/.config/nvim/*.vim ./configs/nvim/
cp -v $HOME/.config/omf/* ./configs/omf/
cp -v $HOME/.config/rofi/config.rasi ./configs/rofi/
cp -v $HOME/.config/rofi/themes/nord.rasi ./configs/rofi/themes/
cp -v $HOME/.config/waybar/config ./configs/waybar/
cp -v $HOME/.config/waybar/style.css ./configs/waybar/
cp -v $HOME/sounds/*.sh ./sounds/
cp -v $HOME/sounds/*.mp3 ./sounds/
cp -v $HOME/sounds/*.ogg ./sounds/

