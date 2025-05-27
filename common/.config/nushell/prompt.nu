let pathname = {|dir: path|
    if ($dir | str starts-with $nu.home-path) {
        (["~"] ++ ($dir | path relative-to $env.HOME | path split)) | path join
    } else {
        $dir
    }
}

let git_branch = {|status| 
    let branch = $status.branch
    if $branch == "no_branch" {
        ""
    } else {
        $branch
    }
}

let changes = {|status| 
    let changes  = [$status.wt_untracked, $status.wt_modified, $status.wt_deleted, $status.wt_type_changed, $status.wt_renamed] | any {|x| $x > 0}

    if ($changes) {
        "*"
    } else {
        ""
    }
}

let ahead = {|status| 
    if ($status.ahead > 0) {
        ""
    } else {
        ""
    }
}

let behind = {|status|
    if ($status.behind > 0) {
        ""
    } else {
        ""
    }
}

let git_status = {|| 
    let status = gstat
    let R = (ansi reset)
    let BLUE = (ansi $env.colors.teal)
    let GRAY = (ansi $env.colors.overlay0)
    $"($GRAY)(do $git_branch $status)(do $changes $status) ($BLUE)(do $behind $status)(do $ahead $status)($R)"
}

let last_cmd_duration = {||
    let duration = $env.CMD_DURATION_MS | into duration --unit ms
    if $duration > 5sec {
        let YELLOW = (ansi $env.colors.yellow)
        let R = (ansi reset)
        $"($YELLOW)($duration)($R)"
    } else {
        ""
    }
}

$env.PROMPT_COMMAND = {|| 
    $"(pwd | do $pathname $in) (do $git_status)\n"
}

$env.PROMPT_COMMAND_RIGHT = {||
    [(do $last_cmd_duration)] | str join " "
}

$env.PROMPT_INDICATOR = "❯ "
$env.TRANSIENT_PROMPT_COMMAND = ""
