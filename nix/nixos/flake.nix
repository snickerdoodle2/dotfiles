{
	description = "NixOS flake";
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
        nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
        zen-browser.url = "github:MarceColl/zen-browser-flake";
	};

	outputs = { self, nixpkgs, nixpkgs-unstable, ...}@inputs: {
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
			];
		};
	};
}
