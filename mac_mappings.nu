export def "get_mac_file_map" [] {
  let config_home = $"($env.HOME)/.config"
  let app_support = $"($env.HOME)/Library/Application Support"

  return [
    # helix
    { repo: "helix/config.toml", sys: $"($config_home)/helix/config.toml" }
    { repo: "helix/languages.toml", sys: $"($config_home)/helix/languages.toml" }
    { repo: "helix/themes/gruvbox_dark_hard_transparent.toml", sys: $"($config_home)/helix/themes/gruvbox_dark_hard_transparent.toml" }

    # nushell
    { repo: "nushell/config.nu", sys: $"($app_support)/nushell/config.nu" }
    { repo: "nushell/autoload/01-mac.nu", sys: $"($app_support)/nushell/autoload/01-mac.nu" }
    { repo: "nushell/autoload/90-carapace.nu", sys: $"($app_support)/nushell/autoload/90-carapace.nu" }
    { repo: "nushell/autoload/90-claude.nu", sys: $"($app_support)/nushell/autoload/90-claude.nu" }
    { repo: "nushell/autoload/90-fnm.nu", sys: $"($app_support)/nushell/autoload/90-fnm.nu" }

    # lazygit
    { repo: "lazygit_mac/config.yml", sys: $"($app_support)/lazygit/config.yml"}

    # yazi
    { repo: "yazi/theme.toml", sys: $"($config_home)/yazi/theme.toml"}
    { repo: "yazi/yazi.toml", sys: $"($config_home)/yazi/yazi.toml"}

    # zathura
    { repo: "zathura/zathurarc", sys: $"($config_home)/zathura/zathurarc"}

    # zellij
    { repo: "zellij/config.kdl", sys: $"($config_home)/zellij/config.kdl"}
  ]
}
