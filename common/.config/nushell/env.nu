if ((which zoxide | length) > 0) {
    zoxide init nushell | save -f ~/.zoxide.nu
} else {
    touch ~/.zoxide.nu
}

use std/util "path add"

if ("/opt/homebrew" | path exists) {
    let paths = ["bin", "sbin"] | each {|dir|
        ("/opt/homebrew" | path join $dir)
    }
    path add $paths
}

$env.CARGO_HOME = $nu.home-path | path join .cargo

if ($env.CARGO_HOME | path exists) {
    path add ($env.CARGO_HOME | path join bin)
}

$env.GOPATH = $nu.home-path | path join .go

if ($env.GOPATH | path exists ) {
    path add ($env.GOPATH | path join bin)
}
