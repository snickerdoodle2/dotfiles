{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: let
  inherit (lib) mkOption types;
  pkgs-unstable = inputs.nixpkgs-unstable.legacyPackages.${pkgs.system};
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
        config.default_prog = { "${config.programs.nushell.package}/bin/nu" }
        config.font_size = ${toString (config.weztermFontSize)}.0
        return config
      '';
    };
  };
}
