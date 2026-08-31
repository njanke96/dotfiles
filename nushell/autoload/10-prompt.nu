$env.PROMPT_COMMAND = {||
    let dir = match (do -i { $env.PWD | path relative-to $nu.home-dir }) {
        null => $env.PWD
        "" => "~"
        $relative_pwd => ([~ $relative_pwd] | path join)
    }

    let path_color = (if (is-admin) { ansi red_bold } else { ansi green_bold })
    let path_segment = $"($path_color)($dir)(ansi reset)"

    let branch = (
        do -i { git rev-parse --abbrev-ref HEAD } | complete
    )

    let git_segment = if $branch.exit_code == 0 and ($branch.stdout | str trim | is-not-empty) {
        let branch_name = ($branch.stdout | str trim)

        let status = (do -i { git status --porcelain } | complete)
        let dirty = ($status.exit_code == 0 and ($status.stdout | str trim | is-not-empty))
        let dirty_marker = if $dirty { "*" } else { "" }

        $" (ansi purple_bold)\(($branch_name)($dirty_marker)\)(ansi reset)"
    } else {
        ""
    }

    let exit_segment = if $env.LAST_EXIT_CODE != 0 {
        $" (ansi red_bold)[($env.LAST_EXIT_CODE)](ansi reset)"
    } else {
        ""
    }

    $"($path_segment)($git_segment)($exit_segment)"
}

$env.PROMPT_COMMAND_RIGHT = { || $"(whoami)@(uname | get nodename)" }
$env.PROMPT_INDICATOR = { "> " }
$env.PROMPT_INDICATOR_VI_INSERT = { ": " }
$env.PROMPT_INDICATOR_VI_NORMAL = { "〉" }
$env.PROMPT_MULTILINE_INDICATOR = { "::: " }
