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
