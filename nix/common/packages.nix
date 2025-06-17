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
    lazydocker

    # shell tools
    nushell
    nushellPlugins.gstat
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
    carapace
    vivid
    direnv
    nix-direnv

    # rust
    rustup
    cargo-binstall
    alejandra

    # node
    nodejs_24
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
