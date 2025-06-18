{
  config,
  inputs,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
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
  };

  imports = [
    ./keybinds.nix
    ./decorations.nix
    ./animations.nix
    ./monitors.nix
  ];
}
