{...}: {
  imports = [
    ./../../home/hyprland
    ./../../home/programs/1password.nix
  ];

  monitors = [
    {
      name = "DP-2";
      enabled = false;
    }
    {
      name = "DP-3";
      width = 2560;
      height = 1440;
      refreshRate = 165;
    }
  ];
  weztermFontSize = 14;
}
