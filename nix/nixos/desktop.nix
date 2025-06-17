{pkgs, ...}: {
  imports = [
    ./common.nix
  ];

  programs.hyprland.enable = true;
  programs.firefox.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.xserver.displayManager.gdm = {
    enable = true;
    wayland = true;
  };
}
