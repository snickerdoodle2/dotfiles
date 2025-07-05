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

    ./control-center.nix
    ./dock.nix
    ./finder.nix
    ./homebrew.nix
    ./misc.nix

    inputs.home-manager.darwinModules.home-manager
  ];

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
