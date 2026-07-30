#!/usr/bin/env nu

def main [--codec: string = 'av1' --select-region] {
  let filename = $"/home/nathan/Videos/Recoding_(date now | format date '%Y-%m-%d--%Hh_%Mm_%Ss').mkv"

  let capture_target: list<string> = match $select_region {
    false => ["-o" "DP-1"]
    _ => ["-g" $"(slurp)"]
  }

  exec wl-screenrec ...($capture_target) --codec ($codec) --audio --audio-device wl_screenrec_capture.monitor --audio-codec opus --audio-bitrate "40 kB" --filename ($filename)
}
