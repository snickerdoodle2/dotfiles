let completer = {
    |spans| carapace $spans.0 nushell ...$spans | from json 
}

let zoxide_completer = {|spans|
    print dupa
    $spans | skip 1 | zoxide query -l ...$in | lines | where {|x| $x != $env.PWD}
}

let multi_completer = {|spans|
    match $spans.0 {
        z => $zoxide_completer
        zi => $zoxide_completer
        _ => $completer
    } | do $in $spans
}

$env.config.completions.external = {
    enable: true
    max_results: 100
    completer: $multi_completer
}
