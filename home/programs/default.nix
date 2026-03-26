{pkgs, ...}: {
  home.packages = [
    pkgs.dust
    pkgs.eva
    pkgs.fd
    pkgs.fzf
    pkgs.python315
    pkgs.ripgrep
    pkgs.wget
  ];

  imports = [
    ./bat.nix
    ./chromium.nix
    ./dms.nix
    ./ghostty.nix
    ./glow.nix
    ./helix
    ./nix-index.nix
    ./nushell
    ./jujutsu.nix
    ./niri.nix
    ./tldr.nix
    ./tmux.nix
    ./yazi
  ];
}
