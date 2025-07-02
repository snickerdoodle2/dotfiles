{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./common.nix
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

  fonts.packages = [
    inputs.fonts.packages.${pkgs.system}.berkeley-mono
    inputs.fonts.packages.${pkgs.system}.berkeley-mono-nerd
  ];

  environment.etc."1password/custom_allowed_browsers" = {
    text = ''
      zen
    '';
    mode = "0755";
  };
}
