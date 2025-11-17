use lib.nu safe_copy;

let config_home = $env.XDG_CONFIG_HOME

let helix_config_dir = $"($config_home)/helix"
let nushell_config_dir = $"($config_home)/nushell"
let zellij_config_dir = $"($config_home)/zellij"
let lazygit_config_dir = $"($config_home)/lazygit"

## Common
# 

# helix
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

## Linux specfic
# 

let alacritty_config_dir = $"($config_home)/alacritty"
let alacritty_themes_dir = $"($config_home)/alacritty/custom_themes"
let containers_config_dir = $"($config_home)/containers"
let labwc_config_dir = $"($config_home)/labwc"
let mpv_config_dir = $"($config_home)/mpv"
let rofi_config_dir = $"($config_home)/rofi"

# alacritty
safe_copy "alacritty/alacritty.toml" $"($alacritty_config_dir)/alacritty.toml"
safe_copy "alacritty/custom_themes/gruvbox-dark.toml" $"($alacritty_themes_dir)/gruvbox-dark.toml"

# containers
safe_copy "containers/containers.conf" $"($containers_config_dir)/containers.conf"

# labwc
safe_copy "labwc/autostart" $"($labwc_config_dir)/autostart"
safe_copy "labwc/environment" $"($labwc_config_dir)/environment"
safe_copy "labwc/menu.xml" $"($labwc_config_dir)/menu.xml"
safe_copy "labwc/rc.xml" $"($labwc_config_dir)/rc.xml"

# mpv
safe_copy "mpv/mpv.conf" $"($mpv_config_dir)/mpv.conf"

# rofi
safe_copy "rofi/config.rasi" $"($rofi_config_dir)/config.rasi"
