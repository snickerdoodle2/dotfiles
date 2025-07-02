{inputs, ...}: {
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.extraSpecialArgs = {inherit inputs;};
  home-manager.users.domi.imports = [
    ../../home
    ./home.nix
  ];

  system.stateVersion = "25.05";
}
