let pathname = {|dir: path|
    if ($dir | str starts-with $nu.home-path) {
        (["~"] ++ ($dir | path relative-to $env.HOME | path split)) | path join
    } else {
        $dir
    }
}

let git_status = {|| 
    let status = gstat
    let R = (ansi reset)
    let GRAY = (ansi $env.colors.overlay0)
    let changes = [$status.wt_untracked, $status.wt_modified, $status.wt_deleted, $status.wt_type_changed, $status.wt_renamed] | any {|x| $x > 0}
    let marker = if ($changes) {
        "*"
    } else {
        ""
    }
    $"($GRAY)($status.branch)($marker)($R)"
}

$env.PROMPT_COMMAND = {|| 
    [(pwd | do $pathname $in), (do $git_status), "\n"] | str join " "
}

$env.PROMPT_INDICATOR = "❯ "
$env.TRANSIENT_PROMPT_COMMAND = ""
