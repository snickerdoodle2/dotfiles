{
	description = "NixOS flake";
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
        nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
        zen-browser.url = "github:MarceColl/zen-browser-flake";
        lanzaboote = {
            url = "github:nix-community/lanzaboote/v0.4.1";

# Optional but recommended to limit the size of your system closure.
            inputs.nixpkgs.follows = "nixpkgs";
        };
	};

	outputs = { self, nixpkgs, nixpkgs-unstable, lanzaboote, ...}@inputs: {
		nixosConfigurations.dominik-pc = nixpkgs.lib.nixosSystem  rec {
			system = "x86_64-linux";

            specialArgs = {
                pkgs-unstable = import nixpkgs-unstable {
                    inherit system;
                };
                inherit inputs;
            };

			modules = [
				../packages.nix
				./configuration.nix
                lanzaboote.nixosModules.lanzaboote
                ({ pkgs, lib, ... }: {

                 environment.systemPackages = [
                 pkgs.sbctl
                 ];

                 boot.loader.systemd-boot.enable = lib.mkForce false;

                 boot.lanzaboote = {
                 enable = true;
                 pkiBundle = "/etc/secureboot";
                 };
          })
			];
		};
	};
}
