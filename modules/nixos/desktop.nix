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
