def tmux-sessionizer [] {
    ^tmux start-server
    let available = ^tmux ls -F "#{session_name}" 
    let selection = if ($available | str length) == 0 {
        "Create New Session"
    } else {
        $"Create New Session\n($available)" | fzf | str trim
    }

    if ($selection | str length) == 0 {
        return
    }

    let name = if $selection == "Create New Session" {
        let base = $env.PWD | path basename 

        if $base in ...($available | split words) {
            print -e "Session here already exists"
            return
        }

        ^tmux new-session -ds $base -c $env.PWD
        $base
    } else {
        $selection
    }

    print $name

    let inside_session = ($env.TMUX? | length) == 1

    if $inside_session {
        ^tmux switch-client -t $name
    } else {
        ^tmux attach -t $name
    }
}
