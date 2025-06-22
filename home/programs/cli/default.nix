{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./nvim.nix
    ./git.nix
    ./lazygit.nix
    ./bat.nix
  ];

  home.packages = with pkgs; [
    alejandra
    wget
    fzf
    ripgrep
    nodejs_24
  ];
}
