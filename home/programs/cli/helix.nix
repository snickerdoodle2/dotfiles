{
  pkgs,
  inputs,
  config,
  ...
}: let
  pkgs-unstable = inputs.nixpkgs-unstable.legacyPackages.${pkgs.system};
in {
  programs.helix = {
    enable = true;
    package = pkgs-unstable.helix;
    settings = {
      theme = "catppuccin_black";
      editor = {
        scrolloff = 8;
        mouse = false;
        line-number = "relative";
        completion-timeout = 5;
        rulers = [80];
        bufferline = "multiple";
        color-modes = true;
        trim-trailing-whitespace = true;
        popup-border = "all";
        end-of-line-diagnostics = "hint";
        auto-pairs = false;
        lsp = {
          display-progress-messages = true;
          display-inlay-hints = true;
          inlay-hints-length-limit = 32;
        };
        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
        whitespace = {
          render = {
            space = "none";
            tab = "all";
            nbsp = "all";
            nnbsp = "all";
            newline = "none";
          };
          characters = {
            nbsp = "⍽";
            nnbsp = "␣";
            tab = "→";
          };
        };
        indent-guides.render = true;
        inline-diagnostics = {
          cursor-line = "disable";
        };
      };
      keys.normal = {
        esc = ["collapse_selection" "keep_primary_selection"];
        space = {
          g = [":new" ":insert-output ${config.programs.lazygit.package}/bin/lazygit" ":buffer-close!" ":redraw" ":reload-all"];
          e = [
            ":sh rm -f /tmp/yazi-path"
            ":insert-output ${config.programs.yazi.package}/bin/yazi %{buffer_name} --chooser-file=/tmp/yazi-path"
            ":open %sh{${pkgs.coreutils}/bin/cat /tmp/yazi-path}"
            ":redraw"
            ":reload-all"
          ];
          K = ":toggle-option inline-diagnostics.cursor-line disable error";
        };
      };
    };
    languages = {
      language = [
        {
          name = "nix";
          formatter = {
            command = "${pkgs.alejandra}/bin/alejandra";
            args = ["-"];
          };
          auto-format = true;
        }
        {
          name = "elixir";
          auto-format = true;
        }
      ];
    };
    themes = {
      "catppuccin_black" = {
        "inherits" = "catppuccin_mocha";
        "ui.background" = {
          fg = "text";
          bg = "#000000";
        };
      };
    };
  };
}
