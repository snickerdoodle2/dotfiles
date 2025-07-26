{
  config,
  pkgs,
  lib,
  ...
}: let
  inherit (lib) mkOption types;
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
      rustup
    ];

    home.stateVersion = "25.05";
    programs.home-manager.enable = true;
  };
  imports = [
    ./programs/cli
    ./programs/desktop
  ];
}
