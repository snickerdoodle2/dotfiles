$env.config.hooks.pre_prompt = [
    {
mut theme = "Dark"
        let theme = try {
            (defaults read -g AppleInterfaceStyle o+e> /dev/null)
            "Dark"
        } catch {
            "Light"
        }

        $env.colors = if $theme == "Dark" {
            $env.catppuccin_mocha
        } else {
            $env.catppuccin_latte
        }
    }
]
