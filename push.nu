use lib.nu ["safe_copy", "get_os_mappings"]

get_os_mappings | each {|entry|
  print ""
  print $"($entry.repo) -> ($entry.sys)"
  safe_copy $"($entry.repo)" $"($entry.sys)"
} | ignore
