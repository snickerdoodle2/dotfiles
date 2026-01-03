{pkgs, ...}: {
  home.username = "domi";
  home.homeDirectory = "/home/domi";

  home.packages = [
    pkgs.firefox
    pkgs.ghostty
    pkgs.just
    pkgs._1password-cli
    pkgs._1password-gui
  ];

  imports = [
    ./programs
  ];

  home.stateVersion = "25.11";
}
