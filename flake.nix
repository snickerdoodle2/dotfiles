{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    dms = {
      url = "github:AvengeMedia/DankMaterialShell/stable";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    fonts = {
      url = "git+ssh://git@github.com/snickerdoodle2/fonts?ref=main";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    tsm = {
      url = "github:snickerdoodle2/tsm/main";
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
    lib = nixpkgs.lib;
    systems = [
      "x86_64-linux"
    ];

    pkgsFor = lib.genAttrs systems (system:
      import nixpkgs {
        inherit system;
      });

    forEachSystem = f: lib.genAttrs systems (system: f pkgsFor.${system});
    forAllSystems = lib.genAttrs systems;
  in {
    formatter = forEachSystem (pkgs: pkgs.alejandra);

    devShells = forAllSystems (system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      default = pkgs.mkShell {
        nativeBuildInputs = [
          pkgs.nurl
          pkgs.just
        ];
      };
    });

    nixosConfigurations = {
      dominik-pc = let
        hostname = "dominik-pc";
        system = "x86_64-linux";
        pkgs-unstable = import nixpkgs-unstable {inherit system;};
        pkgs-fonts = fonts.packages.${system};
        tsm = inputs.tsm.packages.${system};
        specialArgs = {inherit hostname pkgs-unstable pkgs-fonts tsm inputs self;};
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
