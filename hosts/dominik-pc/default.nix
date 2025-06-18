{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];

  environment.systemPackages = with pkgs; [
  ];

  home-manager.users.domi.imports = [
    ./home.nix
  ];

  system.stateVersion = "25.05";
}
