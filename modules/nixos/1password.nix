{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = [
    pkgs._1password-cli
  ];
  programs._1password.enable = true;
  programs._1password-gui = {
    enable = true;
    package = pkgs._1password-gui;
  };
  environment.etc."1password/custom_allowed_browsers" = {
    text = ''
      zen
    '';
    mode = "0755";
  };
}
