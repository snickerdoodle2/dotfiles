{pkgs, ...}: let
  themes = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "atuin";
    rev = "abfab12de743aa73cf20ac3fa61e450c4d96380c";
    sha256 = "18544m6gz3n19gwz07r85mxpkflz6wybnffrhaid8wa237xfmwxp";
  };
in {
  xdg.configFile."atuin/themes" = {
    source = "${themes}/themes";
  };

  programs.atuin = {
    enable = true;
    package = pkgs.atuin;
    daemon.enable = true;
    settings = {
      style = "auto";
      enter_accept = true;
      theme.name = "catppuccin-mocha-mauve";
    };
    flags = [
      "--disable-up-arrow"
    ];
  };
}
