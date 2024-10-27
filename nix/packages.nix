{ pkgs, ... }:

{
    environment.systemPackages = (with pkgs; [ 
        stow
        zoxide
        lsd
        ripgrep
        tmux
        lazygit
        atuin
        bat
        btop
        chafa
        fd
        fzf
        delta
        gh
        jq
        just
        watchexec
        tldr
        wget
        rustup
        go
        texlive.combined.scheme-full
        bun
        tokei
        go-migrate
        tree-sitter
    ]);
}
