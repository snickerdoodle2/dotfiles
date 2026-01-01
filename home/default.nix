{pkgs, ...}: {
  home.username = "domi";
  home.homeDirectory = "/home/domi";

  home.packages = [
    pkgs.firefox
    pkgs.ghostty
    pkgs.just
  ];

  imports = [
    ./programs
  ];

  home.stateVersion = "25.11";
}
