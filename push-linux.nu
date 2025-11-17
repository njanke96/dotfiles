use safe-copy.nu safe_copy;

let config_home = $env.XDG_CONFIG_HOME

let helix_config_dir = $"($config_home)/helix"
let nushell_config_dir = $"($config_home)/nushell"
let zellij_config_dir = $"($config_home)/zellij"
let lazygit_config_dir = $"($config_home)/lazygit"

# helix
mkdir $"($helix_config_dir)"
safe_copy "helix/config.toml" $"($helix_config_dir)/config.toml"
safe_copy "helix/languages.toml" $"($helix_config_dir)/languages.toml"

# nushell
safe_copy "nushell/config.nu" $"($nushell_config_dir)/config.nu"
safe_copy "nushell/autoload/01-linux.nu" $"($nushell_config_dir)/autoload/01-linux.nu"
safe_copy "nushell/autoload/90-carapace.nu" $"($nushell_config_dir)/autoload/90-carapace.nu"
safe_copy "nushell/autoload/90-fnm.nu" $"($nushell_config_dir)/autoload/90-fnm.nu"

# lazygit
safe_copy "lazygit/config.yml" $"($lazygit_config_dir)/config.yml"

# zellij
safe_copy "zellij/config.kdl" $"($zellij_config_dir)/config.kdl"
