{
  config,
  pkgs,
  ...
}: {
  imports = [./hyprland];
  home.username = "domi";
  home.homeDirectory = "/home/domi";

  home.packages = [
    pkgs.hello
    pkgs.cowsay
  ];

  programs.bash = {
    enable = true;
    enableCompletion = true;

    shellAliases = {
      vim = "nvim";
    };
  };

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
