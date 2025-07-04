{...}: {
  home.stateVersion = "25.05";
  programs.home-manager.enable = true;

  imports = [
    ./programs/1password.nix
  ];
}
