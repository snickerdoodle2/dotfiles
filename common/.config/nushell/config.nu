$env.config.buffer_editor = "nvim"
$env.config.show_banner = false

source './completions.nu'
source 'themes/catppuccin_mocha.nu'
if ('~/.local.nu' | path exists) { source '~/.local.nu' }

if ((which atuin | length) > 0) { source ./atuin.nu }

# MISC
$env.config.rm.always_trash = true
$env.config.use_kitty_protocol = false

# TABLE
$env.config.table.mode = "rounded"
$env.config.table.index_mode = "auto"
$env.config.table.missing_value_symbol = " "

$env.config.datetime_format.normal = "%m.%d.%Y %k:%M:%S"

source '~/.zoxide.nu' 
alias vim = nvim
alias vi = nvim
alias lg = lazygit
alias cat = bat
alias tree = lsd --tree
