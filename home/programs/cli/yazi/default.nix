{pkgs, ...}: let
  batPlugin = pkgs.fetchFromGitHub {
    owner = "mgumz";
    repo = "yazi-plugin-bat";
    rev = "4dea0a584f30247b8ca4183dc2bd38c80da0d7ea";
    sha256 = "13b6hzgg4z6bhrnm5r5lpf1m3k13mncansdg5x2s0rcby9lvrxiq";
  };
in {
  home.packages = with pkgs; [
    resvg
  ];

  programs.yazi = {
    enable = true;
    package = pkgs.yazi;
    theme.flavor = {
      dark = "catppuccin-mocha";
      light = "catppuccin-latte";
    };
    settings = {
      mgr = {
        ratio = [1 3 4];
        sort_by = "natural";
        sort_sensitive = false;
        sort_dir_first = true;
        sort_translit = true;
        scrolloff = 8;
      };
      plugin = {
        prepend_previewers = [
          {
            mime = "text/*";
            run = "bat";
          }
        ];
      };
    };
    flavors = {
      catppuccin-mocha = ./catppuccin-mocha;
      catppuccin-latte = ./catppuccin-latte;
    };
    plugins = {
      bat = batPlugin;
    };
  };
}
