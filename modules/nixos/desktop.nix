{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./common.nix
  ];

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
  };

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.xserver.displayManager.gdm = {
    enable = true;
    wayland = true;
  };

  environment.systemPackages = with pkgs; [
    kitty
    inputs.zen-browser.packages."${system}".default
  ];
}
