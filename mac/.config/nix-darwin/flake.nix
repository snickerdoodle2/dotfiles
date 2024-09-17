{
    description = "Example Darwin system flake";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
        nix-darwin.url = "github:LnL7/nix-darwin";
        nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = inputs@{ self, nix-darwin, nixpkgs }:
        let
        configuration = { pkgs, ... }: {
            environment.systemPackages = with pkgs; [ 
                neovim
                stow
                zoxide
                fnm
                lsd
                ripgrep
                tmux
                lazygit
                atuin
                bat
                btop
                chafa
                fd
                fzf
                delta
                gh
                jq
                just
                watchexec
                tldr
                wget
                rustup
                go
                texlive.combined.scheme-medium

                yabai
                skhd
                ];

            # nix setup
            
            nix.settings.experimental-features = "nix-command flakes";
            programs.zsh.enable = true;  
            system.configurationRevision = self.rev or self.dirtyRev or null;
            system.stateVersion = 5;
            nixpkgs.hostPlatform = "aarch64-darwin";
            security.pam.enableSudoTouchIdAuth = true;

            services = {
                nix-daemon.enable = true;
                yabai = {
                    enable = true;
                    enableScriptingAddition = true;
                };
                skhd = {
                    enable = true;
                };
            };

            homebrew = {
                enable = true;
                onActivation.cleanup = "uninstall";
                taps = [];
                brews = [];
                casks = [ 
                    "alacritty"
                    "raycast"
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
            modules = [ configuration ];
        };

# Expose the package set, including overlays, for convenience.
        darwinPackages = self.darwinConfigurations."dominik-mb".pkgs;
    };
}
