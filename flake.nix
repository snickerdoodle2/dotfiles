{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
  };

  outputs = {
    self,
    nixpkgs,
  } @ inputs: {
    nixosConfigurations.dominik-pc = let
      hostname = "dominik-pc";
      specialArgs = {inherit hostname;};
    in
      nixpkgs.lib.nixosSystem {
        inherit specialArgs;
        system = "x86_64-linux";
        modules = [
          ./hosts/dominik-pc
        ];
      };
  };
}
