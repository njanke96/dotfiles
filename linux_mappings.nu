export def "get_linux_file_map" [] {
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
    { repo: $"labwc/autostart", sys: $"($config_home)/labwc/autostart" }
    { repo: $"labwc/environment", sys: $"($config_home)/labwc/environment" }
    { repo: $"labwc/menu.xml", sys: $"($config_home)/labwc/menu.xml" }
    { repo: $"labwc/rc.xml", sys: $"($config_home)/labwc/rc.xml" }

    # mpv
    { repo: $"mpv/mpv.conf", sys: $"($config_home)/mpv/mpv.conf" }

    # rofi
    { repo: $"rofi/config.rasi", sys: $"($config_home)/rofi/config.rasi" }

    # topgrade
    { repo: "topgrade/topgrade.toml", sys: $"($config_home)/topgrade.toml" }
  ]
  
  return $file_map
}
