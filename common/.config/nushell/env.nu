if ((which zoxide | length) > 0) {
    zoxide init nushell | save -f ~/.zoxide.nu
} else {
    touch ~/.zoxide.nu
}
