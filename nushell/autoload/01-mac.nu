## aliases
alias cdrp = cd /Volumes/Repos

## open fix for mac
def nuopen [arg, --raw (-r)] { if $raw { open -r $arg } else { open $arg } }
alias open = ^open

## Homebrew
$env.HOMEBREW_PREFIX = "/opt/homebrew"
$env.HOMEBREW_CELLAR = "/opt/homebrew/Cellar"
$env.HOMEBREW_REPOSITORY = "/opt/homebrew"

# Add Homebrew to MANPATH
$env.MANPATH = $env.MANPATH? | default "" | split row ":" | append "/opt/homebrew/share/man" | str join ":"

# Add Homebrew to INFOPATH
$env.INFOPATH = $env.INFOPATH? | default "" | split row ":" | append "/opt/homebrew/share/info" | str join ":"

## Add homebrew paths
$env.path ++= [
  "/opt/homebrew/bin"
  "/opt/homebrew/sbin"
]

## --- Google Cloud SDK Setup ---

# Define the base directory (this is the value of ${0:A:h} in the Zsh context)
let gcloud_root = $"($env.HOME)/development/google-cloud-sdk"

# Construct the full path to the bin directory
let gcloud_bin_dir = ($gcloud_root | path join "bin")
# Good practice: Check if the bin directory exists before adding it
if ($gcloud_bin_dir | path exists) {
    $env.path ++= [$gcloud_bin_dir]
}
## General Path
$env.path ++= [
  /opt/local/sbin
  /opt/local/bin
  /Users/nathanjanke/development/flutter/bin
  /Users/nathanjanke/.cargo/bin
  /Users/nathanjanke/.local/bin
]
