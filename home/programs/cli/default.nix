{pkgs, ...}: {
  imports = [
    ./bat.nix
    ./btop.nix
    ./gh.nix
    ./git.nix
    ./helix.nix
    ./lazydocker.nix
    ./lazygit.nix
    ./nvim.nix
    ./zellij.nix

    ./shell
    ./yazi
  ];

  home.packages = with pkgs; [
    fd
    fzf
    jq
    nil
    nodejs_24
    nurl
    ripgrep
    tldr
    tokei
    tree-sitter
    wget
  ];
}
