{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./nushell.nix
  ];

  programs.zoxide = {
    enable = true;
    package = pkgs.zoxide;
  };

  programs.carapace = {
    enable = true;
    package = pkgs.carapace;
  };
}
