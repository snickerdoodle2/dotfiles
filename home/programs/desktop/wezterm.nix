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
        print("dupa")
        '';
    };
}
