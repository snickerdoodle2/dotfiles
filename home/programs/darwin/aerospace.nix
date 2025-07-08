{pkgs, ...}: {
  programs.aerospace = {
    enable = true;
    package = pkgs.aerospace;
    userSettings = {
      start-at-login = true;
    };
  };
}
