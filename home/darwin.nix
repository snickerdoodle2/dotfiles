{...}: {
  home.stateVersion = "25.05";
  programs.home-manager.enable = true;

  targets.darwin.defaults."com.apple.dock".size-immutable = true;

  imports = [
    ./programs/1password.nix
  ];
}
