# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, pkgs-unstable, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  nixpkgs.config.allowUnfree = lib.mkForce true;

  services = {
    desktopManager.plasma6.enable = true;
    displayManager.sddm.enable = true;
    displayManager.sddm.wayland.enable = true;
  };

  users.users.domi.packages = [
      pkgs.firefox
      pkgs.helix
      pkgs-unstable.jujutsu
      pkgs.ghostty
      pkgs.just
  ];

  programs._1password.enable = true;
  programs._1password-gui = {
    enable = true;
    polkitPolicyOwners = [ "domi" ];
  };

  environment.systemPackages = with pkgs; [
    git
  ];

  system.stateVersion = "25.11"; # DO NOT DELETE/CHANGE
}

