{pkgs, ...}: {
  imports = [
    ./bat.nix
    ./btop.nix
    ./gh.nix
    ./git.nix
    ./jujutsu.nix
    ./lazydocker.nix
    ./lazygit.nix
    ./nvim.nix
    ./zellij.nix

    ./shell
    ./yazi
    ./helix
  ];

  home.packages = with pkgs; [
    fd
    fzf
    jq
    mergiraf
    nil
    nodejs_24
    nurl
    pipe-rename
    ripgrep
    tldr
    tokei
    tree-sitter
    wget
  ];
}
