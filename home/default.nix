{
  config,
  pkgs,
  ...
}: {
  home.username = "domi";
  home.homeDirectory = "/home/domi";

  home.packages = with pkgs; [
    lazygit
    neovim
    alejandra
    wget
    git
    fzf
    ripgrep
    gcc
    gnumake
    nodejs_24
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
