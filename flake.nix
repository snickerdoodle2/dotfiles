{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, ... } @ inputs:  {
    nixosConfigurations = {
      dominik-pc = let
        hostname = "dominik-pc";
        system = "x86_64-linux";
        pkgs-unstable = import nixpkgs-unstable { inherit system; };
        specialArgs = {inherit hostname inputs pkgs-unstable;};
      in nixpkgs.lib.nixosSystem {
        inherit specialArgs system;
        modules = [
          ./hosts/dominik-pc
          ./modules/nixos.nix
          ./modules/podman.nix
        ];
      };
    };
  };
}
