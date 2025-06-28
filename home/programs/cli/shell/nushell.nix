{config, ...}: {
  programs.nushell = {
    settings = {
      buffer_editor = "nvim";
      show_banner = false;
      rm.always_trash = true;
      use_kitty_protocol = true;
      footer_mode = "auto";
      completions = {
        algorithm = "fuzzy";
      };
      table = {
        mode = "single";
        index_mode = "auto";
        trim = {
          methodology = "truncating";
          truncating_suffix = "...";
        };
        missing_value_symbol = " ";
      };
      use_ansi_coloring = true;
      datetime_format.normal = "%m.%d.%Y %k:%M:%S";
    };
  };
}
