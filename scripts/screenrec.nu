#!/usr/bin/env nu

def main [--select-region] {
  let filename = $"/home/nathan/Videos/Recoding_(date now | format date '%b_%d_%Hh_%Mm_%Ss').mkv"

  let pa_module_loaded: bool = (sh -c `pactl list sinks | grep -q "Name: wl-screenrec-input" && echo "true" || echo "false"`) | into bool

  if not $pa_module_loaded {
    print "Loading the pulse module..."
    pactl load-module module-null-sink media.class=Audio/Sink sink_name=wl-screenrec-input channel_map=stereo
  }

  let capture_target: list<string> = match $select_region {
    false => ["-o" "DP-1"]
    _ => ["-g" $"(slurp)"]
  }

  exec wl-screenrec ...($capture_target) --codec av1 --audio --audio-device wl-screenrec-input.monitor --audio-codec flac --filename ($filename)
}
