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
        line-number = "relative";
        mouse = false;
        bufferline = "multiple";
        auto-pairs = false;
        cursor-shape = {
          insert = "bar";
        };
      };
      keys.normal = {
        esc = ["collapse_selection" "keep_primary_selection"];
        space = {
          g = [":new" ":insert-output ${config.programs.lazygit.package}/bin/lazygit" ":buffer-close!" ":redraw"];
          e = [":sh rm -f /tmp/yazi-path" ":insert-output ${config.programs.yazi.package}/bin/yazi %{buffer_name} --chooser-file=/tmp/yazi-path" ":open %sh{${pkgs.coreutils}/bin/cat /tmp/yazi-path}" ":redraw"];
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
