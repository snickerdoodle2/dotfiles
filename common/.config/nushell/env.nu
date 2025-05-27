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
