{...}: {
  # TODO: jj status
  programs.nushell.extraConfig =
    # nu
    ''
      let last_cmd_duration = {||
          let duration = $env.CMD_DURATION_MS | into duration --unit ms
          if $duration > 5sec {
              $"(ansi $env.colors.yellow)($duration)(ansi reset)"
          } else {
              ""
          }
      }

      let in_nix_shell = {||
          if ($env.IN_NIX_SHELL? != null) {
              $"(ansi $env.colors.pink)󱄅(ansi reset)"
          } else {
              ""
          }
      }

      $env.PROMPT_COMMAND = {||
          let dir = match (do -i { $env.PWD | path relative-to $nu.home-dir }) {
              null => $env.PWD
              ''' => '~'
              $relative_pwd => ([~ $relative_pwd] | path join)
          }

          let path_color = (if (is-admin) { ansi $env.colors.maroon } else { ansi $env.colors.blue })
          let separator_color = (if (is-admin) { ansi $env.colors.red } else { ansi $env.colors.lavender })
          let path_segment = $"($path_color)($dir)(ansi reset) \n"

          $path_segment | str replace --all (char path_sep) $"($separator_color)(char path_sep)($path_color)"
      }

      $env.PROMPT_COMMAND_RIGHT = {||
        [(do $in_nix_shell), (do $last_cmd_duration)] | str join " "
      }

      $env.PROMPT_INDICATOR = {|| $"(ansi $env.colors.pink)❯(ansi reset) "}
      $env.TRANSIENT_PROMPT_COMMAND = ""
    '';
}
