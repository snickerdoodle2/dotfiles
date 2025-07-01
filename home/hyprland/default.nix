{
  config,
  inputs,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
  };

  wayland.windowManager.hyprland.settings = {
    misc = {
      disable_hyprland_logo = true;
      disable_splash_rendering = true;
      force_default_wallpaper = 0;
    };

    input = {
      kb_layout = "pl";
      follow_mouse = 2;
      sensitivity = -0.5;
    };

    cursor.no_warps = true;

    exec-once = let
      startupScript = pkgs.pkgs.writeShellScriptBin "script" ''
        ${pkgs.swww}/bin/swww-daemon &
        ${inputs.hyprpanel.packages."${pkgs.system}".default}/bin/hyprpanel &
        sleep 1
        ${pkgs.swww}/bin/swww img ${./wallpaper.png} &
        ${pkgs._1password-gui}/bin/1password --silent &
      '';
    in "${startupScript}/bin/script";
  };

  imports = [
    ./keybinds.nix
    ./decorations.nix
    ./animations.nix
    ./monitors.nix
    ./hyprpanel.nix
    ./cursor
  ];
}
