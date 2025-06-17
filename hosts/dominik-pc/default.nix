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
    neovim
    alejandra
    wget
    git
    fzf
    ripgrep
    gcc
    gnumake
  ];
  system.stateVersion = "25.05";
}
