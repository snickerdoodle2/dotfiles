{
  config,
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    inputs.zen-browser.packages."${system}".default
    wl-clipboard
  ];

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
        ${inputs.hyprpanel.packages."${pkgs.system}".default}/bin/hyprpanel &
        ${pkgs._1password-gui}/bin/1password --silent &
        ${pkgs.swww}/bin/swww-daemon &
        sleep 1
        ${pkgs.swww}/bin/swww img ${./wallpaper.png} &
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
