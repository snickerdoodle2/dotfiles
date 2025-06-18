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

  environment.systemPackages = with pkgs; [
    inputs.zen-browser.packages."${system}".default
  ];
}
