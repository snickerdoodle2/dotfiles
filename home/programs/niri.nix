{
  config,
  pkgs,
  lib,
  ...
}: let
  startup-script = pkgs.pkgs.writeShellScriptBin "script" ''
    ${lib.getExe' pkgs._1password-gui "1password"} --silent
  '';
in {
  # FIXME: use https://github.com/sodiboo/niri-flake
  xdg.configFile."niri/config.kdl".text =
    # kdl
    ''
      input {
          keyboard {
              xkb {
                  layout "pl"
              }
          }
          touchpad {
              off
          }
          mouse {
              accel-speed 0.4
          }
          trackpoint {
              off
          }
      }
      binds {
          Mod+Return {
              spawn "${config.programs.ghostty.package}/bin/ghostty"
          }
          Mod+Space {
              spawn-sh "dms ipc spotlight toggle"
          }
          Mod+Alt+L {
              spawn-sh "dms ipc lock lock"
          }
          Mod+O repeat=false {
              toggle-overview
          }
          Mod+Q repeat=false {
              close-window
          }
          Mod+H {
              focus-column-left
          }
          Mod+J {
              focus-window-down
          }
          Mod+K {
              focus-window-up
          }
          Mod+L {
              focus-column-right
          }
          Mod+Shift+H {
              move-column-left
          }
          Mod+Shift+J {
              move-window-down
          }
          Mod+Shift+K {
              move-window-up
          }
          Mod+Shift+L {
              move-column-right
          }
          Mod+BracketLeft {
              focus-column-first
          }
          Mod+BracketRight {
              focus-column-last
          }
          Mod+Ctrl+BracketLeft {
              move-column-to-first
          }
          Mod+Ctrl+BracketRight {
              move-column-to-last
          }
          Mod+Ctrl+H {
              focus-monitor-left
          }
          Mod+Ctrl+J {
              focus-monitor-down
          }
          Mod+Ctrl+K {
              focus-monitor-up
          }
          Mod+Ctrl+L {
              focus-monitor-right
          }
          Mod+Shift+Ctrl+H {
              move-column-to-monitor-left
          }
          Mod+Shift+Ctrl+J {
              move-column-to-monitor-down
          }
          Mod+Shift+Ctrl+K {
              move-column-to-monitor-up
          }
          Mod+Shift+Ctrl+L {
              move-column-to-monitor-right
          }
          Mod+U {
              focus-workspace-down
          }
          Mod+I {
              focus-workspace-up
          }
          Mod+Shift+U {
              move-column-to-workspace-down
          }
          Mod+Shift+I {
              move-column-to-workspace-up
          }
          Mod+Ctrl+U {
              move-workspace-down
          }
          Mod+Ctrl+I {
              move-workspace-up
          }
          Mod+WheelScrollDown {
              focus-column-right
          }
          Mod+WheelScrollUp {
              focus-column-left
          }
          Mod+WheelScrollRight {
              focus-column-right
          }
          Mod+WheelScrollLeft {
              focus-column-left
          }
          Mod+Shift+WheelScrollDown cooldown-ms=150 {
              focus-workspace-down
          }
          Mod+Shift+WheelScrollUp cooldown-ms=150 {
              focus-workspace-up
          }
          Mod+Ctrl+Shift+WheelScrollDown {
              move-column-right
          }
          Mod+Ctrl+Shift+WheelScrollUp {
              move-column-left
          }
          Mod+1 {
              focus-workspace 1
          }
          Mod+2 {
              focus-workspace 2
          }
          Mod+3 {
              focus-workspace 3
          }
          Mod+4 {
              focus-workspace 4
          }
          Mod+5 {
              focus-workspace 5
          }
          Mod+6 {
              focus-workspace 6
          }
          Mod+7 {
              focus-workspace 7
          }
          Mod+8 {
              focus-workspace 8
          }
          Mod+9 {
              focus-workspace 9
          }
          Mod+0 {
              focus-workspace 10
          }
          Mod+Shift+1 {
              move-column-to-workspace 1
          }
          Mod+Shift+2 {
              move-column-to-workspace 2
          }
          Mod+Shift+3 {
              move-column-to-workspace 3
          }
          Mod+Shift+4 {
              move-column-to-workspace 4
          }
          Mod+Shift+5 {
              move-column-to-workspace 5
          }
          Mod+Shift+6 {
              move-column-to-workspace 6
          }
          Mod+Shift+7 {
              move-column-to-workspace 7
          }
          Mod+Shift+8 {
              move-column-to-workspace 8
          }
          Mod+Shift+9 {
              move-column-to-workspace 9
          }
          Mod+Shift+0 {
              move-column-to-workspace 10
          }
          Mod+Shift+BracketLeft {
              consume-or-expel-window-left
          }
          Mod+Shift+BracketRight {
              consume-or-expel-window-right
          }
          Mod+Comma {
              consume-window-into-column
          }
          Mod+Period {
              expel-window-from-column
          }
          Mod+R {
              switch-preset-column-width
          }
          Mod+Shift+R {
              switch-preset-window-height
          }
          Mod+Ctrl+R {
              reset-window-height
          }
          Mod+F {
              maximize-column
          }
          Mod+Ctrl+F {
              fullscreen-window
          }
          Mod+Shift+F {
              expand-column-to-available-width
          }
          Mod+Minus {
              set-column-width "-5%"
          }
          Mod+Equal {
              set-column-width "+5%"
          }
          Mod+Shift+Minus {
              set-column-width "-10%"
          }
          Mod+Shift+Equal {
              set-column-width "+10%"
          }
          Mod+Ctrl+Minus {
              set-window-height "-10%"
          }
          Mod+Ctrl+Equal {
              set-window-height "+10%"
          }
          Mod+V {
              toggle-window-floating
          }
          Mod+Shift+V {
              switch-focus-between-floating-and-tiling
          }
          Mod+W {
              toggle-column-tabbed-display
          }
          Print {
              screenshot
          }
          Ctrl+Print {
              screenshot-screen
          }
          Alt+Print {
              screenshot-window
          }
      }
      layout {
          gaps 8
          center-focused-column "on-overflow"
          preset-column-widths {
              proportion 0.33333
              proportion 0.5
              proportion 0.66667
          }
          default-column-width {
              proportion 0.66667
          }
          focus-ring {
              off
          }
          border {
              width 4
              active-color "#a6e3a1"
              inactive-color "#313244"
              urgent-color "#f38ba8"
          }
          shadow {
              off
              softness 0
              spread 0
              offset x=12 y=12
              color "#1a1a1aaa"
          }
      }
      hotkey-overlay {
          skip-at-startup
      }
      prefer-no-csd
      screenshot-path "~/Pictures/Screenshots/screenshot-%d-%m-%Y-%H-%M-%S.png"
      spawn-at-startup "${startup-script}/bin/script"
      window-rule {
          match is-floating=true
          shadow {
              on
          }
      }
      window-rule {
          match app-id="firefox$" title="^Picture-in-Picture$"
          open-floating true
      }
      gestures {
          hot-corners {
              off
          }
      }
    '';
}
