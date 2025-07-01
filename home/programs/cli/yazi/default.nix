{pkgs, ...}: {
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
    };
    flavors = {
      catppuccin-mocha = ./catppuccin-mocha;
      catppuccin-latte = ./catppuccin-latte;
    };
  };
}
