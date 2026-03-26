{
  pkgs,
  lib,
  ...
}: let
  inherit (lib) mkOption types;
in {
  options = {
    ssh-key = mkOption {
      type = types.str;
      default = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIN+yQBBLAqIPgDYfcIrXhgwfdE+XW4nqQCM/+ussS+dJ";
      description = "Public SSH key";
    };
  };
  config = {
    home.username = "domi";
    home.homeDirectory = "/home/domi";

    home.packages = [
      pkgs.firefox
      pkgs._1password-cli
      pkgs._1password-gui
    ];

    home.stateVersion = "25.11";
  };
  imports = [
    ./programs
  ];
}
