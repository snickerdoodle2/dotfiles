{...}: {
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 4;
      gaps_out = 8;
      border_size = 2;
      layout = "master";
      col.active_border = "0xdda6d189";
      col.inactive_border = "0xdd232634";
    };

    decoration = {
      rounding = 8;
      blur = {
        enabled = true;
        size = 3;
        passes = 1;
      };

      drop_shadow = true;
      shadow_range = 0;
      shadow_render_power = 1;
      shadow_offset = "8 8";
      col.shadow = "rgba(1a1a1aaa)";
      col.shadow_inactive = "rgba(1a1a1a00)";
    };
  };
}
