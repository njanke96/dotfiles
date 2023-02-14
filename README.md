# My Dotfile Repo

Basic nord themed hyprland with mostly default binds. Nord is nice because you can find a nord theme for pretty much anything.

Waybar modified from [EduardoPazz's config](https://github.com/EduardoPazz/dot_files)

## Packages

I'm probably forgetting something

```shell
alacritty
breeze  # For QT5/6
dunst  # Notifications
fish  # Best shell
fcitx
grim  # For screenshotting
hyprland
hyprpaper-git
nemo
neovim
nordic-bluish-accent-theme  # GTK Theme
nordzy-cursors
nordzy-icon-theme-git
nwg-look-bin
pavucontrol
polkit-kde-agent  # Hyprland essential
pulseaudio
pulseaudio-alsa
rofi-lbonn-wayland-git  # Launcher
slurp  # For selecting screen region (for grim)
swayidle
swaylock-effects
waybar-hyprland

```

## Screenshots

![screenshot1](https://raw.githubusercontent.com/njanke96/dotfiles/master/misc/screen1.png)
![screenshot2](https://raw.githubusercontent.com/njanke96/dotfiles/master/misc/screen2.png)

## Install Notes

- Apply gtk 2/3 theme and icons with `nwg-look`
- Use `kvantummanager` to first install nordic-bluish-accent from the main Nordic theme repo 'kde' folder, then apply it as the default qt application theme with `qt5ct` and `qt6ct`. Transparency will need to be disabled manually. I'm not sure what configs kvantummanager writes. 

## Note to self

Things to change when migrating these to a new machine:

- QT Scaling in wrappedhl
- Monitor number in dunst/dunstrc
- Monitors in hypr/hyprland.conf
- Startup apps in hypr/hyprland.conf
- Temperature sensors in waybar/config
