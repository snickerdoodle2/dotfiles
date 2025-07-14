{pkgs, ...}: {
  home.stateVersion = "25.05";
  programs.home-manager.enable = true;

  targets.darwin.defaults."com.apple.dock".size-immutable = true;

  home.packages = with pkgs; [
    betterdisplay
    spotify
  ];

  imports = [
    ./programs/1password.nix
    ./programs/darwin
  ];
}
