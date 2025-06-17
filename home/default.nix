{...}: {
  imports = [./hyprland];

  home.username = "domi";
  home.homeDirectory = "/home/domi";
  programs.home-manager.enable = true;

  home.stateVersion = "25.05"; # Please read the comment before changing.
}
