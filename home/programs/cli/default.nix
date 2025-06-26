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
    fd
    fzf
    jq
    nodejs_24
    ripgrep
    tldr
    tokei
    tree-sitter
    wget
  ];
}
