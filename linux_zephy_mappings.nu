export def "get_zephy_file_map" [] {
  let home = $env.HOME;
  let config_home = $env.XDG_CONFIG_HOME
  let file_map = [
    ## Common
    # 

    # helix
    { repo: "helix/config.toml", sys: $"($config_home)/helix/config.toml" }
    { repo: "helix/languages.toml", sys: $"($config_home)/helix/languages.toml" }
    { repo: "helix/themes/gruvbox_dark_hard_transparent.toml", sys: $"($config_home)/helix/themes/gruvbox_dark_hard_transparent.toml" }

    # nushell
    { repo: "nushell/config.nu", sys: $"($config_home)/nushell/config.nu" }
    { repo: "nushell/autoload/01-linux-laptop.nu", sys: $"($config_home)/nushell/autoload/01-linux-laptop.nu" }
    { repo: "nushell/autoload/90-carapace.nu", sys: $"($config_home)/nushell/autoload/90-carapace.nu" }
    # { repo: "nushell/autoload/90-qwen.nu", sys: $"($config_home)/nushell/autoload/90-qwen.nu" }
    # { repo: "nushell/autoload/90-fnm.nu", sys: $"($config_home)/nushell/autoload/90-fnm.nu" }

    # lazygit
    { repo: "lazygit/config.yml", sys: $"($config_home)/lazygit/config.yml"}

    # sshl
    { repo: "ssh-list/ssh-list_config.toml", sys: $"($home)/.ssh/ssh-list_config.toml"}

    # yazi
    { repo: "yazi/theme.toml", sys: $"($config_home)/yazi/theme.toml"}
    { repo: "yazi/yazi.toml", sys: $"($config_home)/yazi/yazi.toml"}

    # zathura
    { repo: "zathura/zathurarc", sys: $"($config_home)/zathura/zathurarc"}

    # zellij
    { repo: "zellij/config.kdl", sys: $"($config_home)/zellij/config.kdl"}

    ## Linux specfic
    #
  
    # alacritty
    { repo: $"alacritty/alacritty.toml", sys: $"($config_home)/alacritty/alacritty.toml" }
    { repo: $"alacritty/custom_themes/gruvbox-dark.toml", sys: $"($config_home)/alacritty/custom_themes/gruvbox-dark.toml" }

    # containers
    { repo: $"containers/containers.conf", sys: $"($config_home)/containers/containers.conf" }

    # labwc
    { repo: $"labwc_zephy/autostart", sys: $"($config_home)/labwc/autostart" }
    { repo: $"labwc_zephy/environment", sys: $"($config_home)/labwc/environment" }
    { repo: $"labwc_zephy/shutdown", sys: $"($config_home)/labwc/shutdown" }
    { repo: $"labwc_zephy/menu.xml", sys: $"($config_home)/labwc/menu.xml" }
    { repo: $"labwc_zephy/rc.xml", sys: $"($config_home)/labwc/rc.xml" }

    # gtk
    { repo: $"gtk/.gtkrc-2.0", sys: $"($home)/.gtkrc-2.0"}
    { repo: $"gtk/gtk-3.0/settings.ini", sys: $"($config_home)/gtk-3.0/settings.ini"}
    { repo: $"gtk/gtk-4.0/settings.ini", sys: $"($config_home)/gtk-4.0/settings.ini"}

    # mpv
    { repo: $"mpv/mpv.conf", sys: $"($config_home)/mpv/mpv.conf" }

    # rofi
    { repo: $"rofi/config.rasi", sys: $"($config_home)/rofi/config.rasi" }

    # scripts
    { repo: "scripts/can-idle.nu", sys: $"($home)/scripts/can-idle.nu" }
    { repo: "scripts/safe-suspend.sh", sys: $"($home)/scripts/safe-suspend.sh" }
    { repo: "scripts/screenshot.sh", sys: $"($home)/scripts/screenshot.sh" }
    { repo: "scripts/screenrec.nu", sys: $"($home)/scripts/screenrec.nu" }
    { repo: "scripts/nag.sh", sys: $"($home)/scripts/nag.sh" }
    { repo: "scripts/saii.sh", sys: $"($home)/scripts/saii.sh" }
    { repo: "scripts/volume.nu", sys: $"($home)/scripts/volume.nu" }
    { repo: "scripts/loginctl-prompt.nu", sys: $"($home)/scripts/loginctl-prompt.nu" }

    # topgrade
    { repo: "topgrade/topgrade.toml", sys: $"($config_home)/topgrade.toml" }
  ]
  
  return $file_map
}
