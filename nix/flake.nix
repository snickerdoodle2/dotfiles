{
  description = "Nix(OS) Flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixpkgs-darwin.url = "github:NixOS/nixpkgs/nixpkgs-24.11-darwin";
    nix-darwin.url = "github:LnL7/nix-darwin/nix-darwin-24.11";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs-darwin";
  };
  outputs = inputs @ {
    self,
    nix-darwin,
    nixpkgs,
    ...
  }: {
    darwinConfigurations."dominik-mb" = let
      common-darwin = import ./darwin/common.nix inputs;
      configuration = common-darwin;
    in
      nix-darwin.lib.darwinSystem {
        modules = [
          configuration
          (
            args @ {pkgs, ...}: let
              packages = import ./common/packages.nix args;
            in
              packages.common ++ packages.personal
          )
        ];
      };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."dominik-mb".pkgs;
  };
}
