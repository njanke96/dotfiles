$env.path ++= [
  $"($env.home)/.cargo/bin"
  $"($env.home)/.local/bin"
]

# snapper alias
def snapper-snap [description?: string] {
  snapper -c root create -c number --read-write -d $"($description | default 'snapper-snap')"
}

# ssh-list alias
def sshl [...args] {
  ssh-list ...$args
}
