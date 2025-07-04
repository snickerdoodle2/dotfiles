{lib, ...}: let
  inherit (lib) mkDefault;
in {
    home.stateVersion = "25.05";
    programs.home-manager.enable = true;
}