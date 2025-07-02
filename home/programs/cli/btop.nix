{pkgs, ...}: let
  themes = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "btop";
    rev = "f437574b600f1c6d932627050b15ff5153b58fa3";
    sha256 = "1rwpsb252mb6kjgai47ns0ssd7xh7zbpbvanz6p62g8m4z0rjhcq";
  };
in {
  xdg.configFile."btop/themes" = {
    source = "${themes}/themes";
  };
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "catppuccin_mocha";
      theme_background = false;
      vim_keys = true;
      rounded_corners = false;
    };
  };
}
