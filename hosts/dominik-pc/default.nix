# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{lib, ...}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../../modules/nixos
    ../../modules/nixos/desktop.nix
    ../../modules/podman.nix
  ];

  nixpkgs.config.allowUnfree = lib.mkForce true;

  system.stateVersion = "25.11"; # DO NOT DELETE/CHANGE
}
