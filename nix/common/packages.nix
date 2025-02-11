{pkgs, ...}: {
  common = with pkgs; [
    neovim
    stow
    zoxide
    lsd
    ripgrep
    tmux
    lazygit
    atuin
    bat
    fd
    fzf
    delta
    gh
    jq
    tldr
    wget
    tree-sitter
    rustup
  ];
  personal = with pkgs; [
    btop
    just
    watchexec
    go
    texlive.combined.scheme-full
    bun
    tokei
  ];
}
