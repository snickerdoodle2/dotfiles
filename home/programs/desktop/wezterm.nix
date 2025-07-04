{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkOption types;
in {
  options = {
    weztermFontSize = mkOption {
      type = types.int;
      default = 15;
    };
  };
  config = {
    xdg.configFile.wezterm = {
      source = ../../../config/wezterm;
      recursive = true;
    };

    programs.wezterm = {
      enable = true;
      package = pkgs.wezterm;
      extraConfig = ''
        local config = require("config")
        config.default_prog = { "${pkgs.bash}/bin/bash", "-i", "-c", "${config.programs.nushell.package}/bin/nu" }
        config.font_size = ${toString (config.weztermFontSize)}.0
        return config
      '';
    };
  };
}
