$env.config.buffer_editor = "nvim"
$env.config.show_banner = false

source './completions.nu'
if ('~/.local.nu' | path exists) { source '~/.local.nu' }

if ((which atuin | length) > 0) { source ./atuin.nu }

source '~/.zoxide.nu' 
alias vim = nvim
alias vi = nvim
alias lg = lazygit
alias cat = bat
alias tree = lsd --tree
