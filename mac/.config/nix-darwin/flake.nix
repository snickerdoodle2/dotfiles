{
    description = "Macbook Flake";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
        nix-darwin.url = "github:LnL7/nix-darwin";
        nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = inputs@{ self, nix-darwin, nixpkgs }:
        let
        configuration = { pkgs, ... }: {
            # nix setup
            
            nix.settings.experimental-features = "nix-command flakes";
            programs.zsh.enable = true;  
            system.configurationRevision = self.rev or self.dirtyRev or null;
            system.stateVersion = 5;
            nixpkgs.hostPlatform = "aarch64-darwin";
            security.pam.enableSudoTouchIdAuth = true;

            services = {
                nix-daemon.enable = true;
            };

            homebrew = {
                enable = true;
                onActivation.cleanup = "uninstall";
                taps = [];
                brews = [];
                casks = [ 
                    "alacritty"
                    "raycast"
                    "nikitabobko/tap/aerospace"
                ];
            };

            launchd.daemons.kanata = {
                serviceConfig = {
                    ProgramArguments = [
                        "/Users/domi/.cargo/bin/kanata"
                        "-c"
                        "/Users/domi/.config/kanata/caps2esc.kbd"
                        "-n"
                    ];
                    KeepAlive = true;
                    RunAtLoad = true;
                    StandardErrorPath = "/Library/Logs/Kanata/kanata.err.log";
                    StandardOutPath = "/Library/Logs/Kanata/kanata.out.log";
                };
            };
        };
    in
    {
# Build darwin flake using:
# $ darwin-rebuild build --flake .#dominik-mb
        darwinConfigurations."dominik-mb" = nix-darwin.lib.darwinSystem {
            modules = [
                configuration 
                ../../../common/.config/nix/package.nix
            ];
        };

# Expose the package set, including overlays, for convenience.
        darwinPackages = self.darwinConfigurations."dominik-mb".pkgs;
    };
}