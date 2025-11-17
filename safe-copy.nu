def is_file [file_path: string] {
  let isfile = ($"($file_path)" | path type) == 'file'
  return $isfile
}

# Safely copy a file and rename any existing file to <filename>.old if it exists.
# Verbose output.
export def safe_copy [source: string, destination: string] {
  if (not (is_file $source)) {
    print -e $"Error: Source file '($source)' not found."
    return 1
  }

  if (is_file $destination) {
    let old_file = $"($destination).old"

    if (is_file $old_file) {
      print $"File '($old_file) exists. Think carefully before answering: Overwrite '($old_file)' with the contents of the current file?"
      let answer = input --default "n" "[y/N]" | str downcase
      if ($answer != 'y') {
        return 1
      }
    }

    print $"Destination file '($destination)' exists. Renaming to '($old_file)'."
    mv $destination $old_file
    print "Successfully renamed existing file."
  } else {
    print $"Destination '($destination)' does not exist. Proceeding with copy."
  }

  cp $source $destination
  print $"Successfully copied '($source)' to '($destination)'."
  return 0
}
