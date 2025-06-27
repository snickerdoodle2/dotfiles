{
  config,
  pkgs,
  ...
}: {
  programs.superfile = {
    enable = true;
    package = pkgs.superfile;
    settings = {
      theme = "catppuccin-mocha";
      auto_check_update = false;
      code_previewer = "bat";
    };
  };
}
