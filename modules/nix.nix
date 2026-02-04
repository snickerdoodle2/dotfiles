{
  lib,
  inputs,
  ...
}: {
  nixpkgs.config.allowUnfree = lib.mkDefault false;

  nix.registry = {
    nixpkgs.flake = inputs.nixpkgs;
    unstable.flake = inputs.nixpkgs-unstable;
  };

  nix.settings = {
    experimental-features = ["nix-command" "flakes" "pipe-operators"];
    auto-optimise-store = true;

    trusted-users = ["domi"];
    substituters = [
      "https://nix-community.cachix.org"
      "https://cache.nixos.org"
    ];
    trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
}
