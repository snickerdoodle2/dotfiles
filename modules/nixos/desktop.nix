{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./common.nix
    ./1password.nix
  ];

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.xserver.displayManager.gdm = {
    enable = true;
    wayland = true;
  };

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
  };

  environment.systemPackages = with pkgs; [
    inputs.zen-browser.packages."${system}".default
    wl-clipboard
  ];

  fonts.packages = [
    inputs.fonts.packages.${pkgs.system}.berkeley-mono
  ];
}
