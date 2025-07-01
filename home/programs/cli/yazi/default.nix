{pkgs, ...}: {
  programs.yazi = {
    enable = true;
    package = pkgs.yazi;
    theme = {
      flavor = {
        dark = "catppuccin-mocha";
      };
    };
    settings = {
      mgr = {
        sort_dir_first = true;
        sort_by = "alphabetical";
      };
    };
    flavors = {
      catppuccin-mocha = ./catppuccin-mocha;
      catppuccin-latte = ./catppuccin-latte;
    };
  };
}
