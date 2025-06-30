{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./bat.nix
    ./btop.nix
    ./gh.nix
    ./git.nix
    ./lazydocker.nix
    ./lazygit.nix
    ./nvim.nix
    ./superfile.nix

    ./shell
  ];

  home.packages = with pkgs; [
    alejandra
    fd
    fzf
    jq
    nil
    nodejs_24
    ripgrep
    tldr
    tokei
    tree-sitter
    wget
  ];
}
