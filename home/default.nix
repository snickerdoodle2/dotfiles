{pkgs, pkgs-unstable, ...}:
{
  home.username = "domi";
  home.homeDirectory = "/home/domi";

  home.packages = [
      pkgs.firefox
      pkgs.helix
      pkgs-unstable.jujutsu
      pkgs.ghostty
      pkgs.just
  ];

  home.stateVersion = "25.11";
}
