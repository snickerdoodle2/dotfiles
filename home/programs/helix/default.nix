{
  pkgs,
  pkgs-unstable,
  ...
}: let
  open_yazi = projectRoot: let
    root-env =
      if projectRoot
      then "YAZI_GO_ROOT=1"
      else "";

    tmp-file = "/tmp/yazi-path";
  in [
    ":sh rm -f ${tmp-file}"
    ":insert-output YAZI_INSIDE_EDITOR=1 ${root-env} yazi \"%{buffer_name}\" --chooser-file=${tmp-file}"
    ":sh printf \"\\x1b[?1049h\\x1b[?2004h\" > /dev/tty"
    ":open %sh{cat ${tmp-file}}"
    ":redraw"
  ];
in {
  imports = [
    ./languages.nix
  ];

  programs.helix = {
    enable = true;
    package = pkgs-unstable.helix;
    defaultEditor = true;
    extraPackages = with pkgs; [
      nil
      harper
      marksman
      kdlfmt
    ];
  };

  programs.helix.settings.theme = "catppuccin_black";
  programs.helix.settings.editor = {
    scrolloff = 8;
    mouse = false;
    line-number = "relative";
    cursorline = true;
    completion-timeout = 5;
    rulers = [80];
    bufferline = "multiple";
    color-modes = true;
    trim-final-newlines = true;
    trim-trailing-whitespace = true;
    popup-border = "all";
    end-of-line-diagnostics = "hint";
    auto-pairs = false;
    lsp = {
      display-progress-messages = true;
      display-inlay-hints = true;
      inlay-hints-length-limit = 32;
    };
    cursor-shape = {
      normal = "block";
      insert = "bar";
      select = "underline";
    };
    whitespace.render = {
      space = "none";
      tab = "all";
      nbsp = "all";
      nnbsp = "all";
      newline = "none";
    };
    indent-guides = {
      render = true;
      character = "▏";
    };
  };
  programs.helix.settings.keys = {
    normal = {
      C-d = ["half_page_down" "goto_window_center"];
      C-u = ["half_page_up" "goto_window_center"];
      esc = ["collapse_selection" "keep_primary_selection"];
      x = ["extend_line_below" "extend_to_line_bounds"];
      X = ["extend_line_above" "extend_to_line_bounds"];
      V = ["goto_first_nonwhitespace" "extend_to_line_end"];
      D = ["ensure_selections_forward" "extend_to_line_end"];
      ret = "goto_word";
      space = {
        K = ":toggle-option inline-diagnostics.cursor-line disable error";
        e = open_yazi false;
        E = open_yazi true;
      };
    };
    select = {
      x = ["extend_line_below" "extend_to_line_bounds"];
      X = ["extend_line_above" "extend_to_line_bounds"];
      V = "extend_to_line_end";
    };
    insert = {
      C-c = "normal_mode";
    };
  };

  programs.helix.themes.catppuccin_black = {
    inherits = "catppuccin_mocha";
    "ui.background" = {
      fg = "text";
      bg = "#000000";
    };
  };
}
