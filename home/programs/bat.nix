{
  pkgs,
  lib,
  ...
}: let
  themes_repo = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "bat";
    rev = "6810349b28055dce54076712fc05fc68da4b8ec0";
    hash = "sha256-lJapSgRVENTrbmpVyn+UQabC9fpV1G1e+CdlJ090uvg=";
  };

  themes = lib.genAttrs [
    "Catppuccin Frappe"
    "Catppuccin Latte"
    "Catppuccin Macchiato"
    "Catppuccin Mocha"
  ];
in {
  programs.bat = {
    enable = true;
    config = {
      theme = "Catppuccin Mocha";
    };
    themes = themes (theme: {
      src = themes_repo;
      file = "themes/${theme}.tmTheme";
    });
  };
}
