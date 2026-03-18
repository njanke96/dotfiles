#!/usr/bin/env nu

let filename = $"/home/nathan/Videos/Recoding_(date now | format date '%b_%d_%Hh_%Mm_%Ss').mkv"

let pa_module = (pactl load-module module-null-sink media.class=Audio/Sink sink_name=wl-screenrec-input channel_map=stereo) | str trim
sh -c $"wl-screenrec -o DP-1 --codec av1 --audio --audio-device wl-screenrec-input.monitor --audio-codec flac --filename ($filename) > /dev/null &"

sleep 1sec
print "Press q to stop recording"

loop {
  let key = (input listen --types [key])
  if ($key.code == 'q' or $key.code == 'Q') {
    do --ignore-errors { pgrep wl-screenrec | xargs kill }
    pactl unload-module $pa_module
    break
  }
}
