export def "get_linux_file_map" [] {
  let home = $env.HOME;
  let config_home = $env.XDG_CONFIG_HOME
  let file_map = [
    ## Common
    # 

    # helix
    { repo: "helix/config.toml", sys: $"($config_home)/helix/config.toml" }
    { repo: "helix/languages.toml", sys: $"($config_home)/helix/languages.toml" }

    # nushell
    { repo: "nushell/config.nu", sys: $"($config_home)/nushell/config.nu" }
    { repo: "nushell/autoload/01-linux.nu", sys: $"($config_home)/nushell/autoload/01-linux.nu" }
    { repo: "nushell/autoload/90-carapace.nu", sys: $"($config_home)/nushell/autoload/90-carapace.nu" }
    { repo: "nushell/autoload/90-fnm.nu", sys: $"($config_home)/nushell/autoload/90-fnm.nu" }

    # lazygit
    { repo: "lazygit/config.yml", sys: $"($config_home)/lazygit/config.yml"}

    # zathura
    { repo: "zathura/zathurarc", sys: $"($config_home)/zathura/zathurarc"}

    # zellij
    { repo: "zellij/config.kdl", sys: $"($config_home)/zellij/config.kdl"}

    ## Linux specfic
    #
  
    # alacritty
    { repo: $"alacritty/alacritty.toml", sys: $"($config_home)/alacritty/alacritty.toml" }
    { repo: $"alacritty/custom_themes/gruvbox-dark.toml", sys: $"($config_home)/alacritty/custom_themes/gruvbox-dark.toml" }

    # conky
    { repo: "conky/conky.conf", sys: $"($config_home)/conky/conky.conf"}
    { repo: "conky/lib.lua", sys: $"($config_home)/conky/lib.lua"}

    # containers
    { repo: $"containers/containers.conf", sys: $"($config_home)/containers/containers.conf" }

    # labwc
    { repo: $"labwc/autostart", sys: $"($config_home)/labwc/autostart" }
    { repo: $"labwc/environment", sys: $"($config_home)/labwc/environment" }
    { repo: $"labwc/shutdown", sys: $"($config_home)/labwc/shutdown" }
    { repo: $"labwc/menu.xml", sys: $"($config_home)/labwc/menu.xml" }
    { repo: $"labwc/rc.xml", sys: $"($config_home)/labwc/rc.xml" }

    # mpv
    { repo: $"mpv/mpv.conf", sys: $"($config_home)/mpv/mpv.conf" }

    # rofi
    { repo: $"rofi/config.rasi", sys: $"($config_home)/rofi/config.rasi" }

    # scripts
    { repo: "scripts/conky.sh", sys: $"($home)/scripts/conky.sh" }
    { repo: "scripts/post-suspend.sh", sys: $"($home)/scripts/post-suspend.sh" }
    { repo: "scripts/pre-suspend.sh", sys: $"($home)/scripts/pre-suspend.sh" }
    { repo: "scripts/saii.sh", sys: $"($home)/scripts/saii.sh" }
    { repo: "scripts/volume.nu", sys: $"($home)/scripts/volume.nu" }
    { repo: "scripts/windows.sh", sys: $"($home)/scripts/windows.sh" }
    { repo: "scripts/x3d_mode_freq.sh", sys: $"($home)/scripts/x3d_mode_freq.sh" }
    { repo: "scripts/x3d_mode_cache.sh", sys: $"($home)/scripts/x3d_mode_cache.sh" }
    { repo: "scripts/x3d_get_mode.sh", sys: $"($home)/scripts/x3d_get_mode.sh" }

    # topgrade
    { repo: "topgrade/topgrade.toml", sys: $"($config_home)/topgrade.toml" }
  ]
  
  return $file_map
}
