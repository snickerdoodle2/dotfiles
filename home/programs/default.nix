{pkgs, ...}: {
  home.packages = [
    pkgs.dust
    pkgs.eva
    pkgs.fd
    pkgs.fzf
    pkgs.ripgrep
    pkgs.wget
  ];

  imports = [
    ./bat.nix
    ./dms.nix
    ./ghostty.nix
    ./helix
    ./nushell
    ./jujutsu.nix
    ./niri.nix
    ./tldr.nix
    ./tmux.nix
    ./yazi
  ];
}
