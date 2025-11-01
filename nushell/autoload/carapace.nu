# Recommended by Nu docs

let carapace_completer = {|spans|
    carapace $spans.0 nushell ...$spans | from json
}

$env.config.completions.external = {
    enable: true
    max_results: 100
    completer: $carapace_completer
}

# carapace docs method:
# 
# ${UserConfigDir}/nushell/env.nu
# $env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' # optional
# mkdir $"($nu.cache-dir)"
# carapace _carapace nushell | save --force $"($nu.cache-dir)/carapace.nu"
#
# # ${UserConfigDir}/nushell/config.nu
# source $"($nu.cache-dir)/carapace.nu"
