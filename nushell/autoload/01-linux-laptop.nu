$env.path = $env.path | append [
  $"($env.home)/.cargo/bin"
  $"($env.home)/.local/bin"
]

# ssh without arguments opens ssh-list
def --wrapped --env ssh [...args] {
  if ($args | length | into bool) {
    ^ssh ...$args
  } else {
    ssh-list
  }
}
