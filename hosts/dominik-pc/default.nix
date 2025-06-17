{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../nix/nixos/desktop.nix
    ../../nix/nixos/secure-boot.nix
  ];

  environment.systemPackages = with pkgs; [
    neovim
    alejandra
    wget
    kitty
    git
    fzf
    ripgrep
    gcc
    gnumake
  ];
  system.stateVersion = "25.05";
}
