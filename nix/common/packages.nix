{pkgs, ...}: {
  common = with pkgs; [
    # editor
    neovim
    tree-sitter

    # tui tools
    atuin
    delta
    fzf
    lazygit
    tmux

    # shell tools
    bat
    fd
    gh
    jq
    lsd
    ripgrep
    stow
    tldr
    wget
    zoxide

    # rust
    rustup
    cargo-binstall

    # elixir
    elixir_1_18

    # node
    nodejs
  ];
  personal = with pkgs; [
    # tui tools
    btop

    # shell tools
    just
    tokei
    watchexec

    # golang
    go

    # bun
    bun

    # latex
    texlive.combined.scheme-full
  ];
}
