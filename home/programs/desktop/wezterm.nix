{
  config,
  pkgs,
  ...
}: {
  xdg.configFile.wezterm = {
    source = ../../../config/wezterm;
    recursive = true;
  };

  programs.wezterm = {
    enable = true;
    package = pkgs.wezterm;
    extraConfig = ''
      local config = require("config")
      config.default_prog = { "${pkgs.bash}/bin/bash" }
      return config
    '';
  };
}
