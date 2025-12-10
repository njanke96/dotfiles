#!/usr/bin/env nu
def "main get" [] {
  let vol = (wpctl get-volume `@DEFAULT_AUDIO_SINK@`
    | split row " "
    | get 1
    | into float
  ) * 100 | into int
  
  return $vol
}

def "main up" [] {
  wpctl set-volume `@DEFAULT_AUDIO_SINK@` `5%+`
  main get
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
  print "Use a subcommand 'get', 'up', or 'down'."
}
