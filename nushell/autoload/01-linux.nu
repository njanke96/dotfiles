$env.path ++= [
  $"($env.home)/.cargo/bin"
  $"($env.home)/.local/bin"
]

# snapper alias
def snapper-snap [description?: string] {
  snapper -c root create -c number --read-write -d $"($description | default 'snapper-snap')"
}

# ssh without arguments opens ssh-list
def --wrapped --env ssh [...args] {
  if ($args | length | into bool) {
    ^ssh ...$args
  } else {
    ssh-list
  }
}
