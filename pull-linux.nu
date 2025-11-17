let config_home = $env.XDG_CONFIG_HOME

let helix_config_dir = $"($config_home)/helix"
let nushell_config_dir = $"($config_home)/nushell"
let zellij_config_dir = $"($config_home)/zellij"
let lazygit_config_dir = $"($config_home)/lazygit"

## Common
# 

# helix
cp $"($helix_config_dir)/config.toml" "helix/config.toml"
cp $"($helix_config_dir)/languages.toml" "helix/languages.toml"

# nushell
cp $"($nushell_config_dir)/config.nu" "nushell/config.nu"
cp $"($nushell_config_dir)/autoload/01-linux.nu" "nushell/autoload/01-linux.nu"
cp $"($nushell_config_dir)/autoload/90-carapace.nu" "nushell/autoload/90-carapace.nu"
cp $"($nushell_config_dir)/autoload/90-fnm.nu" "nushell/autoload/90-fnm.nu"

# lazygit
cp $"($lazygit_config_dir)/config.yml" "lazygit/config.yml"

# zellij
cp $"($zellij_config_dir)/config.kdl" "zellij/config.kdl"

## Linux specfic
# 

let alacritty_config_dir = $"($config_home)/alacritty"
let alacritty_themes_dir = $"($config_home)/alacritty/custom_themes"
let containers_config_dir = $"($config_home)/containers"
let labwc_config_dir = $"($config_home)/labwc"
let mpv_config_dir = $"($config_home)/mpv"
let rofi_config_dir = $"($config_home)/rofi"

# alacritty
cp $"($alacritty_config_dir)/alacritty.toml" "alacritty/alacritty.toml"
cp $"($alacritty_themes_dir)/gruvbox-dark.toml" "alacritty/custom_themes/gruvbox-dark.toml"

# containers
cp $"($containers_config_dir)/containers.conf" "containers/containers.conf"

# labwc
cp $"($labwc_config_dir)/autostart" "labwc/autostart"
cp $"($labwc_config_dir)/environment" "labwc/environment"
cp $"($labwc_config_dir)/menu.xml" "labwc/menu.xml"
cp $"($labwc_config_dir)/rc.xml" "labwc/rc.xml"

# mpv
cp $"($mpv_config_dir)/mpv.conf" "mpv/mpv.conf"

# rofi
cp $"($rofi_config_dir)/config.rasi" "rofi/config.rasi"
