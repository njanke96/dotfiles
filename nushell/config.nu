# config.nu
#

## nu config
$env.config.buffer_editor = "hx"
$env.config.show_banner = false

## Global node modules on systems with npm
if (which npm | length | into bool) {
  $env.NODE_MODULES_GLOBAL = (npm root -g | str trim)
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
