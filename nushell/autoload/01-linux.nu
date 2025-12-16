$env.path ++= [
  $"($env.home)/.cargo/bin"
  $"($env.home)/.local/bin"
]

# xbps-install alias
def --wrapped sxbi [...args] {
   sudo xbps-install ...$args
}

# xbps-remove alias
def --wrapped sxbr [...args] {
  sudo xbps-remove ...$args
}

# xbps-query alias
def --wrapped xbq [...args] {
  xbps-query ...$args
}

# snapper alias
def snapper-snap [description?: string] {
  snapper -c root create -c number --read-write -d $"($description | default 'snapper-snap')"
}

# ssh-list alias
def sshl [...args] {
  ssh-list ...$args
}
