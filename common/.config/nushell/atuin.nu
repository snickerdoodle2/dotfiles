$env.ATUIN_NOBIND = true
atuin init nu | save -f ~/.local/share/atuin/init.nu #make sure you created the directory beforehand with `mkdir ~/.local/share/atuin/init.nu`
source ~/.local/share/atuin/init.nu

#bind to ctrl-r in emacs, vi_normal and vi_insert modes, add any other bindings you want here too
$env.config = (
    $env.config | upsert keybindings (
        $env.config.keybindings
        | append {
            name: atuin
            modifier: control
            keycode: char_r
            mode: [emacs, vi_normal, vi_insert]
            event: { send: executehostcommand cmd: (_atuin_search_cmd) }
        }
    )
)
