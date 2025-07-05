{...}: {
  system.defaults.NSGlobalDomain = {
    "com.apple.keyboard.fnState" = true; # Use F1, F2, etc. keys as standard function keys.
    "com.apple.sound.beep.volume" = 0.47; # ~ 25%

    AppleInterfaceStyleSwitchesAutomatically = true;
    ApplePressAndHoldEnabled = false;
    AppleShowScrollBars = "Always";

    InitialKeyRepeat = 30;
    KeyRepeat = 2;

    NSAutomaticCapitalizationEnabled = false;
    NSAutomaticDashSubstitutionEnabled = false;
    NSAutomaticInlinePredictionEnabled = false;
    NSAutomaticPeriodSubstitutionEnabled = false;
    NSAutomaticQuoteSubstitutionEnabled = false;
    NSAutomaticSpellingCorrectionEnabled = false;
    NSDocumentSaveNewDocumentsToCloud = false;
  };
}
