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
    home.username = "domi";
    home.homeDirectory = "/home/domi";

    home.packages = with pkgs; [
      lazygit
      git
      gcc
      gnumake
    ];

    programs.bash = {
      enable = true;
      enableCompletion = true;

      shellAliases = {
        vim = "nvim";
        lg = "lazygit";
      };
    };

    home.stateVersion = "25.05";
    programs.home-manager.enable = true;
  };
  imports = [
    ./programs/cli
  ];
}
