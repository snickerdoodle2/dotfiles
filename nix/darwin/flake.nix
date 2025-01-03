{
    description = "Macbook Flake";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
        nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
        nix-darwin.url = "github:LnL7/nix-darwin";
        nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = inputs@{ self, nix-darwin, nixpkgs, nixpkgs-unstable }:
        let
        configuration = { pkgs, ... }: {
            # nix setup
            
            nix.settings.experimental-features = "nix-command flakes";
            programs.zsh.enable = true;  
            system.configurationRevision = self.rev or self.dirtyRev or null;
            system.stateVersion = 5;
            nixpkgs.hostPlatform = "aarch64-darwin";
            security.pam.enableSudoTouchIdAuth = true;

            system.defaults = {
                NSGlobalDomain = {
                    AppleInterfaceStyle = "Dark";
                    InitialKeyRepeat = 0;
                    NSAutomaticCapitalizationEnabled = false;
                    NSDocumentSaveNewDocumentsToCloud = false;

                };

                trackpad.Clicking = true;

                menuExtraClock = {
                    ShowDate = 2;
                    ShowDayOfWeek = false;
                };

                dock = {
                    persistent-apps = [
                        "/Applications/Google Chrome.app"
                        "/Applications/Spotify.app"
                        "/Applications/Discord.app"
                    ];
                    tilesize = 32;
                    wvous-bl-corner = 1;
                    wvous-br-corner = 1;
                    wvous-tl-corner = 1;
                    wvous-tr-corner = 1;
                };

                finder = {
                    FXPreferredViewStyle = "Nlsv";
                    QuitMenuItem = true;
                    ShowPathbar = true;
                    ShowStatusBar = true;
                };

                loginwindow.autoLoginUser = "domi";

                # FIXME: NOT WORKING???
                # controlcenter = {
                #     AirDrop = false;
                #     BatteryShowPercentage = true;
                #     Bluetooth = false;
                # };
            };

            system.startup.chime = false;

            environment.systemPackages = (with pkgs; [ 
                neovim
                fnm
            ]);

            services = {
                nix-daemon.enable = true;
            };

            homebrew = {
                enable = true;
                onActivation.cleanup = "uninstall";
                taps = [
                    "nikitabobko/tap"
                ];
                brews = [];
                casks = [ 
                    "google-chrome"
                    "ghostty"
                    "raycast"
                    "nikitabobko/tap/aerospace"
                    "jetbrains-toolbox"
                    "microsoft-teams"
                    "spotify"
                    "discord"
                    "obsidian"
                    "1password"
                    "docker"
                ];
                masApps = {
                    "iStat Menus" = 1319778037;
                    "Hidden Bar" = 1452453066;
                };
            };

            environment.variables = {
                EDITOR = "nvim";
            };

            launchd.daemons.kanata = {
                environment = {
                    SHELL = "/bin/dash";
                };
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
                ../packages.nix
            ];
        };

# Expose the package set, including overlays, for convenience.
        darwinPackages = self.darwinConfigurations."dominik-mb".pkgs;
    };
}
