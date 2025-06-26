{pkgs, ...}: {
  wayland.windowManager.hyprland.settings = {
    "$mainMod" = "SUPER";
    bind = [
      "$mainMod, Q, exec, ${pkgs.wezterm}/bin/wezterm"
      "$mainMod, E, exec, ${pkgs.nautilus}/bin/nautilus"
      "$mainMod, C, killactive,"
      "$mainMod, R, exec, ${pkgs.rofi}/bin/rofi -show drun"

      "$mainMod, F, fullscreen # toggle fullscreen"
      "$mainMod SHIFT, F, togglefloating # toggle floating"
      "$mainMod SHIFT, P, pin # pin active floating window"

      "$mainMod SHIFT, H, layoutmsg,mfact -0.1"
      "$mainMod, H, layoutmsg,mfact -0.01"
      "$mainMod, L, layoutmsg,mfact 0.01"
      "$mainMod SHIFT, L, layoutmsg,mfact 0.1"

      "$mainMod, J, layoutmsg,cyclenext"
      "$mainMod, K, layoutmsg,cycleprev"

      "$mainMod, Return,layoutmsg,focusmaster"
      "$mainMod SHIFT, Return,layoutmsg,swapwithmaster"

      "$mainMod, D,layoutmsg,removemaster"
      "$mainMod, I,layoutmsg,addmaster"

      "$mainMod SHIFT, Tab,layoutmsg,orientationcycle left right top center"

      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"
      "$mainMod, 3, workspace, 3"
      "$mainMod, 4, workspace, 4"
      "$mainMod, 5, workspace, 5"
      "$mainMod, 6, workspace, 6"
      "$mainMod, 7, workspace, 7"
      "$mainMod, 8, workspace, 8"
      "$mainMod, 9, workspace, 9"
      "$mainMod, 0, workspace, 10"

      "$mainMod SHIFT, 1, movetoworkspace, 1"
      "$mainMod SHIFT, 2, movetoworkspace, 2"
      "$mainMod SHIFT, 3, movetoworkspace, 3"
      "$mainMod SHIFT, 4, movetoworkspace, 4"
      "$mainMod SHIFT, 5, movetoworkspace, 5"
      "$mainMod SHIFT, 6, movetoworkspace, 6"
      "$mainMod SHIFT, 7, movetoworkspace, 7"
      "$mainMod SHIFT, 8, movetoworkspace, 8"
      "$mainMod SHIFT, 9, movetoworkspace, 9"
      "$mainMod SHIFT, 0, movetoworkspace, 10"

      "$mainMod, S, togglespecialworkspace, magic"
      "$mainMod SHIFT, S, movetoworkspace, special:magic"
    ];

    bindm = [
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];
  };
}
