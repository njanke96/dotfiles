use linux_mappings.nu get_linux_file_map
use linux_zephy_mappings.nu get_zephy_file_map
use mac_mappings.nu get_mac_file_map

def is_file [file_path: string] {
  let isfile = ($"($file_path)" | path type) == 'file'
  return $isfile
}

def is_dir [file_path: string] {
  let isdir = ($"($file_path)" | path type) == 'dir'
  return $isdir
}

export def get_os_mappings [] {
  mut mappings = []

  if (sys host | get long_os_version | str contains -i linux) {
    print "Detected os is Linux"
    # let choice = ([Desktop Zephy] | input list)
    let hostname = open /etc/hostname | into string | str trim

    match $hostname {
      "zephy" => { $mappings = get_zephy_file_map } 
      _ => { $mappings = get_linux_file_map },
    }
  } else if (sys host | get long_os_version | str contains -i macos) {
    print "Detected os is macOS"
    $mappings = get_mac_file_map
  }

  if ($mappings | length) < 1 {
    print "No mappings detected, check os and hostname"
  }

  return $mappings
}

# Safely copy a file
# If the destination file exists, display a diff using delta and ask for confirmation
export def safe_copy [source: string, destination: string] {
  if (not (is_file $source)) {
    print -e $"Error: Source file '($source)' not found."
    return 1
  }

  if (is_file $destination) {
    print $"File '($destination) exists. Showing the diff \(if there is one\)"
    let diff_result = do --ignore-errors { delta $"($destination)" $"($source)" } | complete

    if ($diff_result | get exit_code) == 0 {
      print "There is no difference, skipping."
      return 1
    }

    print $"($diff_result | get stdout)"
    
    let answer = input --default "n" $"Overwrite '($destination)'? [y/N] " | str downcase

    if ($answer != 'y') {
      print "Skipping file."
      return 1
    } else {
      print "Proceeding with copy..."
    }
  } else {
    if not (is_dir ($destination | path dirname )) {
      print $"Creating directory ($destination | path dirname)"
      mkdir $"($destination | path dirname)"
    } 
    print $"Destination '($destination)' does not exist. Proceeding with copy.."
  }

  cp $source $destination
  print $"Successfully copied '($source)' to '($destination)'."
  return 0
}
