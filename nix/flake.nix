{
  description = "Nix(OS) Flake";
  inputs = {
    nixpkgs-darwin.url = "github:NixOS/nixpkgs/nixpkgs-24.11-darwin";
    nix-darwin.url = "github:LnL7/nix-darwin/nix-darwin-24.11";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs-darwin";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.1";
      # Optional but recommended to limit the size of your system closure.
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs @ {
    self,
    nix-darwin,
    nixpkgs,
    lanzaboote,
    ...
  }: {
    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."dominik-mb".pkgs;
    darwinConfigurations."dominik-mb" = let
      common-darwin = import ./darwin/common.nix inputs {
        casks = [
          "jetbrains-toolbox"
          "discord"
          "obsidian"
        ];
        masApps = {
          "Affinity Photo 2: Image Editor" = 1616822987;
        };
        persistent-apps = [
          "/Applications/Google Chrome.app"
          "/Applications/Obsidian.app"
          "/Applications/Spotify.app"
          "/Applications/Discord.app"
        ];
      };
      configuration = common-darwin;
    in
      nix-darwin.lib.darwinSystem {
        modules = [
          configuration
          (import ./darwin/kanata.nix ./darwin/caps2esc.kbd)
          (
            args @ {pkgs, ...}: let
              packages = import ./common/packages.nix args;
            in {
              environment.systemPackages = packages.common ++ packages.personal;
            }
          )
        ];
      };
    darwinConfigurations."dpilipczuk-swm" = let
      common-darwin = import ./darwin/common.nix inputs {
        casks = [
          "visual-studio-code"
        ];
        persistent-apps = [
          "/Applications/Google Chrome.app"
          "/Applications/Spotify.app"
          "/Applications/Slack.app"
        ];
      };
      configuration = common-darwin;
    in
      nix-darwin.lib.darwinSystem {
        modules = [
          configuration
          (
            args @ {pkgs, ...}: let
              packages = import ./common/packages.nix args;
            in {
              environment.systemPackages = packages.common;
            }
          )
        ];
      };

    # TODO: Add linux :)
    nixosConfigurations."dominik-pc" = let
      # host-specific cconfiguration
      system = "x86_64-linux";
      configuration = {
        networking.hostName = "dominik-pc"; # Define your hostname.
      };
      secureBoot = {
        pkgs,
        lib,
        ...
      }: {
        environment.systemPackages = [
          pkgs.sbctl
        ];

        boot.loader.systemd-boot.enable = lib.mkForce false;

        boot.lanzaboote = {
          enable = true;
          pkiBundle = "/etc/secureboot";
        };
      };
    in
      nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          inherit system;
        };

        modules = [
          configuration
          ./linux/hosts/dominik-pc.nix
          ./linux/common.nix
          lanzaboote.nixosModules.lanzaboote
          secureBoot
          (args @ {pkgs, ...}: let
            packages = import ./common/packages.nix args;
          in {
            environment.systemPackages = packages.common ++ packages.personal;
          })
        ];
      };
  };
}
