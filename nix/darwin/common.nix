args @ {
  self,
  nixpkgs,
  ...
}: {
  taps ? [],
  brews ? [],
  casks ? [],
  masApps ? {},
  persistent-apps ? [
    "/Applications/Google Chrome.app"
    "/Applications/Obsidian.app"
  ], # Apps in the dock
}: let
  common = import ../common/settings.nix args;
  settings = {
    nix.settings.experimental-features = "nix-command flakes";
    system.configurationRevision = self.rev or self.dirtyRev or null;
    system.stateVersion = 5;
    nixpkgs.hostPlatform = "aarch64-darwin";
    security.pam.enableSudoTouchIdAuth = true;

    system.defaults = {
      NSGlobalDomain = {
        AppleInterfaceStyle = "Dark"; # Dark mode
        InitialKeyRepeat = 0; # Disable key repeat
        NSAutomaticCapitalizationEnabled = false; # Disable auto capitalization
        NSDocumentSaveNewDocumentsToCloud = false; # Don't save new documents to iCloud
      };

      trackpad.Clicking = true; # Tap to click

      menuExtraClock = {
        ShowDate = 2; # Don't show the full date
        ShowDayOfWeek = false; # Don't show date of the week
      };

      dock = {
        persistent-apps = persistent-apps; # Apps in the dock
        tilesize = 32; # Dock size
        wvous-bl-corner = 1;
        wvous-br-corner = 1;
        wvous-tl-corner = 1;
        wvous-tr-corner = 1; # Disable hot corners
      };

      finder = {
        FXPreferredViewStyle = "Nlsv"; # List view
        QuitMenuItem = true; # Allow quitting finder
        ShowPathbar = true; # Breadcrumbs
        ShowStatusBar = true; # Show status bar (with remaining space etc.)
      };

      WindowManager = {
        AppWindowGroupingBehavior = false; # Group windows one at a time
        EnableStandardClickToShowDesktop = false; # click to show desktop only in stage manager
      };

      controlcenter = {
        AirDrop = false;
        BatteryShowPercentage = true;
        Bluetooth = false;
      };
    };

    system.startup.chime = false; # Disable startup chime

    services = {
      nix-daemon.enable = true; # NOTE: is it needed???
    };

    homebrew = {
      enable = true;
      onActivation.cleanup = "uninstall";
      taps =
        taps
        ++ [
          "nikitabobko/tap"
        ];

      brews =
        brews
        ++ [
          "kanata"
        ];
      casks =
        casks
        ++ [
          "1password"
          "docker"
          "font-jetbrains-mono-nerd-font"
          "ghostty"
          "google-chrome"
          "nikitabobko/tap/aerospace"
          "raycast"
          "spotify"
        ];

      masApps =
        masApps
        // {
          "Hidden Bar" = 1452453066;
        };
    };
  };
in
  common // settings
