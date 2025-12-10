#!/usr/bin/env nu

def get-volume []: nothing -> int {
  let vol: int = (wpctl get-volume `@DEFAULT_AUDIO_SINK@`
    | split row " "
    | get 1
    | into float
  ) * 100 | into int

  $vol
}

def "main get" []: nothing -> string {
  let vol: string = get-volume | into string
  $vol
}

def "main up" [] {
  let pre_vol = get-volume

  # wpctl will pretty much increase it indefinitely without this
  if $pre_vol < 100 {
    wpctl set-volume `@DEFAULT_AUDIO_SINK@` `5%+`
    main get
  }
}

def "main down" [] {
  wpctl set-volume `@DEFAULT_AUDIO_SINK@` `5%-`
  main get
}

def "main nag up" [] {
  main up
  let vol = (main get)
  labnag --background-color 282828ee --border-bottom-color 00000000 -m $"Volume: ($vol)%"
}

def "main nag down" [] {
  main down
  let vol = (main get)
  labnag --background-color 282828ee --border-bottom-color 00000000 -m $"Volume: ($vol)%"
}

def main [] {
  print "Available subcommands are 'get', 'up', 'down', 'nag <up|down>'"
}
