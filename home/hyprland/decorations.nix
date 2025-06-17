{...}: {
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 4;
      gaps_out = 8;
      border_size = 2;
      layout = "master";
      "col.active_border" = "0xdda6d189";
      "col.inactive_border" = "0xdd232634";
    };

    decoration = {
      rounding = 8;
      blur = {
        enabled = true;
        size = 3;
        passes = 1;
      };
    };
  };
}
