{
  pkgs,
  system,
  inputs,
  lib,
  ...
}: {
  inherit system;
  imports = [
    ../common
    ./homebrew.nix
    ./dock.nix
    ./control-center.nix
    inputs.home-manager.darwinModules.home-manager
  ];

  security.pam.services.sudo_local.touchIdAuth = true;

  fonts.packages = [
    inputs.fonts.packages.${pkgs.system}.berkeley-mono
  ];

  nixpkgs.hostPlatform = "aarch64-darwin";

  users.users.domi.home = lib.mkDefault "/Users/domi";
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.extraSpecialArgs = {inherit inputs;};
  home-manager.users.domi.imports = [
    ../../home
    ../../home/darwin.nix
  ];
}
