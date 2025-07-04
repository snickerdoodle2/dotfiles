{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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
    hyprland.url = "github:hyprwm/Hyprland/v0.49.0";
    hyprpanel = {
      url = "github:jas-singhfsu/hyprpanel";
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
    nix-darwin,
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
          ./modules/nixos/docker.nix
        ];
      };
    darwinConfigurations."dominik-mb" = let
      hostname = "dominik-mb";
      system = {
        configurationRevision = self.rev or self.dirtyRev or null;
        stateVersion = 6;
      };
      specialArgs = {inherit hostname inputs system;};
    in
      nix-darwin.lib.darwinSystem {
        inherit specialArgs;
        modules = [
          ./hosts/dominik-mb
          ./modules/darwin
        ];
      };
  };
}
