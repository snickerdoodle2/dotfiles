{pkgs, ...}: {
  programs.bat = {
    enable = true;
    package = pkgs.bat;
    config = {
      theme = "Catppuccin Mocha";
    };
    themes = {
      "Catppuccin Mocha" = {
        src = pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "bat";
          rev = "699f60fc8ec434574ca7451b444b880430319941";
          sha256 = "1lirgwgh2hnz6j60py19bbmhvgaqs7i6wf6702k6n83lgw4aixg9";
        };
        file = "themes/Catppuccin Mocha.tmTheme";
      };
    };
  };
}
