{
  description = "Nix(OS) Flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs-unstable";
  };
  outputs = inputs @ {
    self,
    nix-darwin,
    nixpkgs,
    ...
  }: {
    darwinConfigurations."dominik-mb" = let
      common-darwin = import ./darwin/common.nix inputs;
      packages = import ./common/packages.nix inputs;
      configuration =
        common-darwin
        // {
          environment.systemPackages = packages.common ++ packages.personal;
        };
    in
      nix-darwin.lib.darwinSystem {
        modules = [
          configuration
        ];
      };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."dominik-mb".pkgs;
  };
}
