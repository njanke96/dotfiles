$env.path ++= [
  $"($env.home)/.cargo/bin"
  $"($env.home)/.local/bin"
]

# yazi alias
def --env y [...args] {
	let tmp = (mktemp -t "yazi-cwd.XXXXXX")
	^yazi ...$args --cwd-file $tmp
	let cwd = (open $tmp)
	if $cwd != $env.PWD and ($cwd | path exists) {
		cd $cwd
	}
	rm -fp $tmp
}

# snapper alias
def snapper-snap [description?: string] {
  snapper -c root create -c number --read-write -d $"($description | default 'snapper-snap')"
}

# ssh-list alias
def sshl [...args] {
  ssh-list ...$args
}
