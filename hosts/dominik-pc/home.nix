{config, ...}: {
  imports = [
    ./../../home/hyprland
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
}
