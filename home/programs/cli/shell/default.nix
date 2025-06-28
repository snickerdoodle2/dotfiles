{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./atuin.nix
    ./direnv.nix
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
