{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.2";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    quickshell = {
      url = "github:quickshell-mirror/quickshell/v0.1.0";
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
    home-manager,
    ...
  } @ inputs: {
    nixosConfigurations.dominik-pc = let
      hostname = "dominik-pc";
      specialArgs = {inherit hostname inputs;};
    in
      nixpkgs.lib.nixosSystem {
        inherit specialArgs;
        system = "x86_64-linux";
        modules = [
          ./hosts/dominik-pc
          ./modules/nixos/desktop.nix
          ./modules/nixos/secure-boot.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.domi = ./home;

            home-manager.extraSpecialArgs = specialArgs;
          }
        ];
      };
  };
}
