use lib.nu ["safe_copy", "get_os_mappings"]

get_os_mappings | each {|entry|
  print ""
  print $"($entry.sys) -> ($entry.repo)"
  cp $"($entry.sys)" $"($entry.repo)"
} | ignore
