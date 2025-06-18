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

  home-manager.users.domi.imports = [
    ./home.nix
  ];

  system.stateVersion = "25.05";
}
