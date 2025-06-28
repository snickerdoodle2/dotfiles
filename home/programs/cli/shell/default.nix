{
  config,
  pkgs,
  inputs,
  ...
}: let
  pkgs-unstable = inputs.nixpkgs-unstable.legacyPackages.${pkgs.system};
in {
  imports = [
    ./atuin.nix
    ./direnv.nix
  ];

  programs.nushell = {
    enable = true;
    package = pkgs-unstable.nushell;
    plugins = [
      pkgs-unstable.nushellPlugins.gstat
    ];
  };

  programs.zoxide = {
    enable = true;
    package = pkgs.zoxide;
  };

  programs.carapace = {
    enable = true;
    package = pkgs.carapace;
  };
}
