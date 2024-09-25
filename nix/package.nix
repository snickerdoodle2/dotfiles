{ pkgs, ...}:

{
    environment.systemPackages = with pkgs; [ 
        neovim
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
    ];
}
