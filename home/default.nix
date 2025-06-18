{
  config,
  pkgs,
  ...
}: {
  imports = [./hyprland];
  home.username = "domi";
  home.homeDirectory = "/home/domi";

  home.packages = [
    pkgs.lazygit
  ];

  programs.bash = {
    enable = true;
    enableCompletion = true;

    shellAliases = {
      vim = "nvim";
      lg = "lazygit";
    };
  };

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
