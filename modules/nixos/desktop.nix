{pkgs-fonts, ...}: {
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services = {
    desktopManager.plasma6.enable = true;
    displayManager.sddm.enable = true;
    displayManager.sddm.wayland.enable = true;
  };

  fonts.packages = [
    pkgs-fonts.berkeley-mono
    pkgs-fonts.berkeley-mono-nerd
  ];
}
