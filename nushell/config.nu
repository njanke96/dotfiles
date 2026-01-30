# config.nu
#
# Installed by:
# version = "0.108.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# Nushell sets "sensible defaults" for most configuration settings, 
# so your `config.nu` only needs to override these defaults if desired.
#
# You can open this file in your default editor using:
#     config nu
#
# You can also pretty-print and page through the documentation for configuration
# options using:
#     config nu --doc | nu-highlight | less -R
#

# imports
use std/dirs

## nu config
$env.config.buffer_editor = "hx"
$env.config.show_banner = false

## Global node modules on systems with npm
if (which npm | length | into bool) {
  $env.NODE_MODULES_GLOBAL = (npm root -g | str trim)
}

if (which oh-my-posh | length | into bool) {
  oh-my-posh init nu --config ~/.theme.omp.json
}
