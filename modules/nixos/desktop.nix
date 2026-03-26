{
  pkgs,
  pkgs-fonts,
  ...
}: {
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  programs.niri.enable = true;
  services.displayManager.ly = {
    enable = true;
    settings = {
      animation = "doom";
    };
  };

  environment.systemPackages = [
    pkgs.wl-clipboard
  ];

  fonts.packages = [
    pkgs-fonts.berkeley-mono
    pkgs-fonts.berkeley-mono-nerd
  ];

  environment.etc = {
    "1password/custom_allowed_browsers" = {
      text = ''
        chromium
      '';
      mode = "0755";
    };
  };
}
