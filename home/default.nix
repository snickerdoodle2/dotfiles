{
  config,
  pkgs,
  lib,
  ...
}: let
  inherit (lib) mkDefault mkOption types;
in {
  options = {
    dotfiles = mkOption {
      type = types.path;
      default = "${config.home.homeDirectory}/code/git/dotfiles";
      apply = toString;
      description = "Location of the dotfiles directory.";
    };
  };
  config = {
    home.packages = with pkgs; [
      gcc
      gnumake
    ];

    home.stateVersion = "25.05";
    programs.home-manager.enable = true;
  };
  imports = [
    ./programs/cli
    ./programs/desktop
  ];
}
