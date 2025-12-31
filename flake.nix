{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
  };

  outputs = { self, nixpkgs, ... } @ inputs:  {
    nixosConfigurations = {
      dominik-pc = let
        hostname = "dominik-pc";
        specialArgs = {inherit hostname inputs;};
      in nixpkgs.lib.nixosSystem {
        inherit specialArgs;
        system = "x86_64-linux";
        modules = [
          ./hosts/dominik-pc
          ./modules/nixos.nix
        ];
      };
    };
  };
}
