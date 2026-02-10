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

## nu config
$env.config.buffer_editor = "hx"
$env.config.show_banner = false

## Global node modules on systems with npm
if (which npm | length | into bool) {
  $env.NODE_MODULES_GLOBAL = (npm root -g | str trim)
}

## OMP
if (which oh-my-posh | length | into bool) {
  oh-my-posh init nu --config ~/.theme.omp.json
}

## zoxide
if (which zoxide | length | into bool) {
  zoxide init nushell | save --force ($nu.user-autoload-dirs | path join "99-zoxide.nu") 
}

## yazi alias for cd
def --env y [...args] {
	let tmp = (mktemp -t "yazi-cwd.XXXXXX")
	^yazi ...$args --cwd-file $tmp
	let cwd = (open $tmp)
	if $cwd != $env.PWD and ($cwd | path exists) {
		cd $cwd
	}
	rm -fp $tmp
}

## keybinds
$env.config.keybindings ++= [{
  name: zi_binding
  modifier: CONTROL
  keycode: Char_u
  mode: emacs
  event: [
    { edit: Clear }
    {
      edit: InsertString,
      value: "zi"
    }
    { send: Enter }
  ]
}]

