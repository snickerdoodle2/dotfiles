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
    ./nushell.nix
  ];

  programs.nushell = {
    enable = true;
    package = pkgs-unstable.nushell;
    plugins = [
      pkgs-unstable.nushellPlugins.gstat
    ];
    extraEnv = ''
      $env.LS_COLORS = (${pkgs.vivid}/bin/vivid generate catppuccin-mocha)
    '';
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
