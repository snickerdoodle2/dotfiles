{
  config,
  lib,
  pkgs,
  home-manager,
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

  home-manager.users.domi = {
    monitors = [
      {
        name = "DP-2";
        enabled = false;
      }
      {
        name = "DP-3";
        width = 2560;
        height = 1440;
        refreshRate = 165;
      }
    ];
  };

  system.stateVersion = "25.05";
}
