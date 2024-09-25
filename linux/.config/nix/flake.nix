{
	description = "NixOS flake";
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
	};

	outputs = { self, nixpkgs, ...}@inputs: {
		nixosConfigurations.dominik-pc = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = [
				./configuration.nix
				../../../common/.config/nix/package.nix
			];
		};
	};
}
