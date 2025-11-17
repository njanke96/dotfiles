use linux_mappings.nu get_linux_file_map

def is_file [file_path: string] {
  let isfile = ($"($file_path)" | path type) == 'file'
  return $isfile
}

export def get_os_mappings [] {
  mut mappings = []

  if (sys host | get long_os_version | str contains -i linux) {
    print "Detected os is Linux"
    $mappings = get_linux_file_map 
  } else if (sys host | get long_os_version | str contains -i macos) {
    print "Detected os is macOS"
    # $mappings = get_macos_file_map
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
    do --ignore-errors { delta $"($destination)" $"($source)" }
    let answer = input --default "n" $"Overwrite '($destination)'? [y/N] " | str downcase

    if ($answer != 'y') {
      print "Skipping file."
      return 1
    } else {
      print "Proceeding with copy..."
    }
  } else {
    print $"Destination '($destination)' does not exist. Proceeding with copy.."
  }

  cp $source $destination
  print $"Successfully copied '($source)' to '($destination)'."
  return 0
}
