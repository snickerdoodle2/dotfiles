{pkgs, ...}: {
  imports = [
    ./aerospace.nix
    ./skhd.nix
  ];

  home.packages = [
    pkgs.pngpaste
  ];
}
