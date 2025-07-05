{...}: {
  system.defaults.finder = {
    _FXShowPosixPathInTitle = false;
    _FXSortFoldersFirst = true;
    AppleShowAllExtensions = true;
    CreateDesktop = false;
    FXPreferredViewStyle = "clmv"; # "icnv" = Icon view, "Nlsv" = List view, "clmv" = Column View, "Flwv" = Gallery View
    FXRemoveOldTrashItems = true;
    NewWindowTarget = "Home";
    QuitMenuItem = true;
    ShowPathbar = true;
    ShowStatusBar = true;
  };

  system.defaults.NSGlobalDomain.NSTableViewDefaultSizeMode = 2;
}
