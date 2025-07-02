{pkgs, ...}: let
  macosCursor = pkgs.fetchzip {
    url = "https://github.com/driedpampas/macOS-hyprcursor/releases/download/v1/macOS.Hyprcursor.SVG.tar.gz";
    sha256 = "0222dprg3yr54v716rg33sgidla36mfxvyicizjs4b1lj85c7zi2";
  };
in {
  home.file.".local/share/icons/macOS" = {
    source = "${macosCursor}";
    recursive = true;
  };
  wayland.windowManager.hyprland.settings.env = [
    "HYPRCURSOR_THEME,MacOS"
    "HYPRCURSOR_SIZE,24"
  ];
}
