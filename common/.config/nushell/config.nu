$env.config.buffer_editor = "nvim"
$env.config.show_banner = false

if ('~/.local.nu' | path exists) { source '~/.local.nu' }

if ((which atuin | length) > 0) { source ./atuin.nu }
