# *.nix
{inputs, ...}: {
  programs.hyprpanel = {
    enable = true;
    systemd.enable = true;

    settings = {
      bar.launcher.autoDetectIcon = true;
      bar.workspaces.show_icons = true;

      menus.clock = {
        time = {
          military = true;
          hideSeconds = true;
        };
        weather.unit = "metric";
      };

      menus.dashboard.directories.enabled = false;
      theme.bar.transparent = true;
      theme.font = {
        name = "Berkeley Mono";
        size = "16px";
      };
    };
  };
}
