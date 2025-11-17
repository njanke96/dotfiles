let config_home = $env.XDG_CONFIG_HOME

let helix_config_dir = $"($config_home)/helix"
let nushell_config_dir = $"($config_home)/nushell"
let zellij_config_dir = $"($config_home)/zellij"

# helix
mkdir $"($helix_config_dir)"
cp $"($helix_config_dir)/config.toml" "helix/config.toml"
cp $"($helix_config_dir)/languages.toml" "helix/languages.toml"

# nushell
cp $"($nushell_config_dir)/config.nu" "nushell/config.nu"
cp $"($nushell_config_dir)/autoload/90-carapace.nu" "nushell/autoload/90-carapace.nu"
cp $"($nushell_config_dir)/autoload/90-fnm.nu" "nushell/autoload/90-fnm.nu"

# zellij
cp $"($zellij_config_dir)/config.kdl" "zellij/config.kdl"
