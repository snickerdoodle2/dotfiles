{ pkgs, ... }:

{
    environment.systemPackages = (with pkgs; [ 
        stow
        zoxide
        fnm
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
        texlive.combined.scheme-medium
        bun
        tokei
        go-migrate
    ]);
}
