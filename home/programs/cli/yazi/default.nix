{
  pkgs,
  inputs,
  lib,
  config,
  ...
}: let
  init =
    # lua
    ''
      require("relative-motions"):setup({ show_numbers="relative", show_motion = true })
      require("git"):setup()
      local toggle_pane = require("toggle-pane")

      if os.getenv("YAZI_GO_ROOT") then
        local root = io.popen("git rev-parse --show-toplevel"):read("*a")
        ya.mgr_emit("cd", { root:gsub("[\r\n]", "") })
      end

      if os.getenv("YAZI_INSIDE_EDITOR") then
        toggle_pane:entry("min-preview")
      end
    '';

  # FIXME: maybe flake input (or write my own :()
  clipboard = pkgs.fetchFromGitHub {
    owner = "XYenon";
    repo = "clipboard.yazi";
    rev = "9089f90e48b90244355e943e879be8ab86f921c9";
    hash = "sha256-5XGSpBObCRjmf0UwwFcsG3ekoNNBMWyZerqTAo5Ak+A=";
  };

  yazi-paths =
    config.yazi-paths
    ++ [
      {
        shortcut = ["c" "c"];
        path = "~/code";
      }
      {
        shortcut = ["c" "p"];
        path = "~/code/personal";
      }
      {
        shortcut = ["c" "g"];
        path = "~/code/git";
      }
      {
        shortcut = ["c" "t"];
        path = "~/code/testing";
      }
    ];

  pkgs-unstable = inputs.nixpkgs-unstable.legacyPackages.${pkgs.system};

  inherit (lib) mkOption types;
in {
  options = {
    yazi-paths = mkOption {
      type = types.listOf (types.submodule {
        options = {
          shortcut = mkOption {
            type = types.either types.str (types.listOf types.str);
            example = "c";
          };
          path = mkOption {
            type = types.str;
            example = "~/code";
          };
        };
      });
      default = [];
    };
  };
  config = {
    programs.yazi = {
      enable = true;
      package = pkgs-unstable.yazi;
      extraPackages = with pkgs; [
        trash-cli
      ];
      initLua = init;
      theme = {
        flavor = {
          light = "catppuccin-black";
          dark = "catppuccin-black";
        };
      };
      flavors = {
        catppuccin-black = ./catppuccin-black;
      };
      settings = {
        plugin = {
          prepend_previewers = [
            {
              url = "*.md";
              run = "piper -- CLICOLOR_FORCE=1 ${pkgs.glow}/bin/glow -w=$w -s=dark \"$1\"";
            }
          ];
          append_previewers = [
            {
              url = "*";
              run = "piper -- ${pkgs.hexyl}/bin/hexyl --border=none --terminal-width=$w \"$1\"";
            }
          ];
          prepend_fetchers = [
            {
              id = "git";
              url = "*";
              run = "git";
            }
            {
              id = "git";
              url = "*/";
              run = "git";
            }
          ];
        };
      };
      keymap = {
        mgr.prepend_keymap =
          [
            {
              on = ["c" "a" "a"];
              run = "plugin compress";
              desc = "Archive selected files";
            }
            {
              on = ["c" "a" "p"];
              run = "plugin compress -p";
              desc = "Archive selected files (password)";
            }
            {
              on = ["c" "a" "h"];
              run = "plugin compress -ph";
              desc = "Archive selected files (password+header)";
            }
            {
              on = ["c" "a" "l"];
              run = "plugin compress -l";
              desc = "Archive selected files (compression level)";
            }
            {
              on = ["c" "a" "u"];
              run = "plugin compress -phl";
              desc = "Archive selected files (password+header+level)";
            }
            {
              on = "p";
              run = "plugin smart-paste";
              desc = "Paste into the hovered directory or CWD";
            }
            {
              on = ["T" "p"];
              run = "plugin toggle-pane min-preview";
              desc = "Show or hide the preview pane";
            }
            {
              on = ["T" "P"];
              run = "plugin toggle-pane max-preview";
              desc = "Maximize or restore the preview pane";
            }
            {
              on = ["T" "o"];
              run = "plugin toggle-pane min-current";
              desc = "Maximize or restore the current pane";
            }
            {
              on = ["T" "O"];
              run = "plugin toggle-pane max-current";
              desc = "Maximize or restore the current pane";
            }
            {
              on = ["T" "i"];
              run = "plugin toggle-pane min-parent";
              desc = "Maximize or restore the parent pane";
            }
            {
              on = ["T" "I"];
              run = "plugin toggle-pane max-parent";
              desc = "Maximize or restore the parent pane";
            }
            {
              on = ["T" "r"];
              run = "plugin toggle-pane reset";
              desc = "Reset pane sizes";
            }
            {
              on = "f";
              run = "plugin smart-filter";
              desc = "Smart filter";
            }
            {
              on = "F";
              run = "plugin jump-to-char";
              desc = "Jump to char";
            }
            {
              on = "u";
              run = "plugin restore";
              desc = "Restore last deleted files/folders";
            }
            {
              on = "y";
              run = ["yank" "plugin clipboard -- --action=copy"];
            }
            {
              on = ["g" "r"];
              run = "shell -- ya emit cd \"$(git rev-parse --show-toplevel)\"";
              desc = "Go to git root";
            }
            {
              on = ["g" "G"];
              run = "cd --interactive";
              desc = "Go to (enter path)";
            }
          ]
          ++ (
            lib.lists.range 1 9
            |> lib.lists.map toString
            |> lib.lists.map (
              x: {
                on = "${x}";
                run = "plugin relative-motions ${x}";
                desc = "Move in relative steps (${x})";
              }
            )
          )
          ++ (
            yazi-paths
            |> lib.lists.map (
              path: {
                on = ["g"] ++ path.shortcut;
                run = "cd ${path.path}";
                desc = "Go to ${path.path}";
              }
            )
          );
      };
      plugins = with pkgs-unstable.yaziPlugins; {
        smart-paste = smart-paste;
        relative-motions = relative-motions;
        piper = piper;
        git = git;
        compress = compress;
        toggle-pane = toggle-pane;
        smart-filter = smart-filter;
        restore = restore;
        clipboard = clipboard;
        jump-to-char = jump-to-char;
      };
    };
  };
}
