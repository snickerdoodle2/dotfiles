if ((which carapace | length) > 0) {
    $env.config.completions.external = {
        enable: true
        max_results: 100
        completer: {|spans| carapace $spans.0 nushell ...$spans | from json}
    }
}
