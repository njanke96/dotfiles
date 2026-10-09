export def "get_mac_file_map" [] {
  let home = $env.HOME;
  let config_home = $"($home)/.config"
  let app_support = $"($home)/Library/Application Support"

  return [
    # helix
    { repo: "helix/config.toml", sys: $"($config_home)/helix/config.toml" }
    { repo: "helix/languages.toml", sys: $"($config_home)/helix/languages.toml" }
    { repo: "helix/themes/gruvbox_dark_hard_transparent.toml", sys: $"($config_home)/helix/themes/gruvbox_dark_hard_transparent.toml" }

    # nushell
    { repo: "nushell/config.nu", sys: $"($app_support)/nushell/config.nu" }
    { repo: "nushell/autoload/01-mac.nu", sys: $"($app_support)/nushell/autoload/01-mac.nu" }
    { repo: "nushell/autoload/10-prompt.nu", sys: $"($app_support)/nushell/autoload/10-prompt.nu" }
    { repo: "nushell/autoload/90-carapace.nu", sys: $"($app_support)/nushell/autoload/90-carapace.nu" }
    { repo: "nushell/autoload/90-claude.nu", sys: $"($app_support)/nushell/autoload/90-claude.nu" }
    { repo: "nushell/autoload/90-fnm.nu", sys: $"($app_support)/nushell/autoload/90-fnm.nu" }
    { repo: "nushell/autoload/90-zoxide.nu", sys: $"($config_home)/nushell/autoload/90-zoxide.nu" }
    { repo: "nushell/autoload/90-zmx.nu", sys: $"($config_home)/nushell/autoload/90-zmx.nu" }
    { repo: "nushell/autoload/90-zmx-select.nu", sys: $"($config_home)/nushell/autoload/90-zmx-select.nu" }
    { repo: "nushell/autoload/99-keybinds.nu", sys: $"($config_home)/nushell/autoload/99-keybinds.nu" }

    # lazygit
    { repo: "lazygit_mac/config.yml", sys: $"($app_support)/lazygit/config.yml"}

    # yazi
    { repo: "yazi/theme.toml", sys: $"($config_home)/yazi/theme.toml"}
    { repo: "yazi/yazi.toml", sys: $"($config_home)/yazi/yazi.toml"}

    # zathura
    { repo: "zathura/zathurarc", sys: $"($config_home)/zathura/zathurarc"}

    # zellij
    { repo: "zellij/config.kdl", sys: $"($config_home)/zellij/config.kdl"}

    # zsh
    { repo: "zsh/.zshrc", sys: $"($home)/.zshrc" }
  ]
}
