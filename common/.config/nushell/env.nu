$env.ENV_CONVERSIONS = {
    "PATH": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
    "Path": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
}

$env.NU_LIB_DIRS = [
    ($nu.default-config-dir | path join 'scripts') # add <nushell-config-dir>/scripts
]

$env.NU_PLUGIN_DIRS = [
    ($nu.default-config-dir | path join 'plugins') # add <nushell-config-dir>/plugins
]

# GO SETUP
$env.GOPATH = ($env.HOME | path join '.go')
$env.PATH = ($env.PATH | split row (char esep) |
    append ($env.GOPATH | path join 'bin') |
    append ($env.HOME | path join '.cargo/bin')
    )

# HOMEBREW ENV VARS
$env.HOMEBREW_NO_ENV_HINTS = 1
$env.HOMEBREW_NO_AUTO_UPDATE = 1

$env.EDITOR = 'nvim'

mkdir ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu

zoxide init nushell | str replace "$env.PWD -- $rest" "$env.PWD -- ...$rest" --all | str replace -a "def-env" "def --env" | save -f ~/.zoxide.nu

fnm env --shell power-shell | fnm-nushell | from json | load-env
