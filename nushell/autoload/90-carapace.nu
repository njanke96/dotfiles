$env.config.completions.external.completer = {|place|
    carapace $place.command.0 nushell ...$place.command | from json
}
