{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./atuin.nix
    ./bat.nix
    ./gh.nix
    ./git.nix
    ./lazygit.nix
    ./nvim.nix
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
