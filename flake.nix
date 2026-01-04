{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    fonts = {
      url = "git+ssh://git@github.com/snickerdoodle2/fonts?ref=main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    fonts,
    ...
  } @ inputs: let
    systems = [
      "x86_64-linux"
    ];
    forAllSystems = nixpkgs.lib.genAttrs systems;
  in {
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

    nixosConfigurations = {
      dominik-pc = let
        hostname = "dominik-pc";
        system = "x86_64-linux";
        pkgs-unstable = import nixpkgs-unstable {inherit system;};
        pkgs-fonts = fonts.packages.${system};
        specialArgs = {inherit hostname pkgs-unstable pkgs-fonts;};
      in
        nixpkgs.lib.nixosSystem {
          inherit specialArgs system;
          modules = [
            ./hosts/dominik-pc

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.extraSpecialArgs = inputs // specialArgs;
              home-manager.users.domi = import ./home;
            }
          ];
        };
    };
  };
}
