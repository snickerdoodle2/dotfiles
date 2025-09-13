{pkgs, ...}: let
  inherit (pkgs.stdenv.hostPlatform) isDarwin;
in {
  programs.ghostty = {
    enable = true;
    package =
      if isDarwin
      then null
      else pkgs.ghostty;
    settings = {
      theme = "catppuccin-mocha";
    };
  };
}
