{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./atuin.nix
    ./bat.nix
    ./btop.nix
    ./gh.nix
    ./git.nix
    ./lazydocker.nix
    ./lazygit.nix
    ./nushell.nix
    ./nvim.nix
    ./superfile.nix
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
