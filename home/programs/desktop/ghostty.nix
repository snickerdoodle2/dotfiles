{
  config,
  pkgs,
  lib,
  ...
}: let
  inherit (pkgs.stdenv.hostPlatform) isDarwin;
  inherit (lib) mkOption types;
in {
  options = {
    ghosttyFontSize = mkOption {
      type = types.int;
      default = 15;
    };
  };
  config = {
    programs.ghostty = {
      enable = true;
      package =
        if isDarwin
        then null
        else pkgs.ghostty;
      themes = {
        catppuccin-mocha = {
          palette = [
            "0=#45475a"
            "1=#f38ba8"
            "2=#a6e3a1"
            "3=#f9e2af"
            "4=#89b4fa"
            "5=#f5c2e7"
            "6=#94e2d5"
            "7=#a6adc8"
            "8=#585b70"
            "9=#f38ba8"
            "10=#a6e3a1"
            "11=#f9e2af"
            "12=#89b4fa"
            "13=#f5c2e7"
            "14=#94e2d5"
            "15=#bac2de"
          ];
          background = "000000";
          foreground = "cdd6f4";
          cursor-color = "f5e0dc";
          cursor-text = "11111b";
          selection-background = "1e1e2e";
          selection-foreground = "cdd6f4";
        };
      };
      settings = {
        theme = "light:catppuccin-latte,dark:catppuccin-mocha";
        font-family = "Berkeley Mono";
        font-style = "Medium";
        font-style-bold = "ExtraBold";
        font-size = config.ghosttyFontSize;
        window-padding-x = 8;
        window-padding-y = 4;
        command = "${pkgs.bash}/bin/bash -i -c ${config.programs.nushell.package}/bin/nu";
      };
    };
  };
}
