$env.colors = {
  rosewater: "#f5e0dc"
  flamingo: "#f2cdcd"
  pink: "#f5c2e7"
  mauve: "#cba6f7"
  red: "#f38ba8"
  maroon: "#eba0ac"
  peach: "#fab387"
  yellow: "#f9e2af"
  green: "#a6e3a1"
  teal: "#94e2d5"
  sky: "#89dceb"
  sapphire: "#74c7ec"
  blue: "#89b4fa"
  lavender: "#b4befe"
  text: "#cdd6f4"
  subtext1: "#bac2de"
  subtext0: "#a6adc8"
  overlay2: "#9399b2"
  overlay1: "#7f849c"
  overlay0: "#6c7086"
  surface2: "#585b70"
  surface1: "#45475a"
  surface0: "#313244"
  base: "#1e1e2e"
  mantle: "#181825"
  crust: "#11111b"
}

let scheme = {
  recognized_command: $env.colors.blue
  unrecognized_command: $env.colors.text
  constant: $env.colors.peach
  punctuation: $env.colors.overlay2
  operator: $env.colors.sky
  string: $env.colors.green
  virtual_text: $env.colors.surface2
  variable: { fg: $env.colors.flamingo attr: i }
  filepath: $env.colors.yellow
}

$env.config.color_config = {
  separator: { fg: $env.colors.surface2 attr: b }
  leading_trailing_space_bg: { fg: $env.colors.lavender attr: u }
  header: { fg: $env.colors.text attr: b }
  row_index: $scheme.virtual_text
  record: $env.colors.text
  list: $env.colors.text
  hints: $scheme.virtual_text
  search_result: { fg: $env.colors.base bg: $env.colors.yellow }
  shape_closure: $env.colors.teal
  closure: $env.colors.teal
  shape_flag: { fg: $env.colors.maroon attr: i }
  shape_matching_brackets: { attr: u }
  shape_garbage: $env.colors.red
  shape_keyword: $env.colors.mauve
  shape_match_pattern: $env.colors.green
  shape_signature: $env.colors.teal
  shape_table: $scheme.punctuation
  cell-path: $scheme.punctuation
  shape_list: $scheme.punctuation
  shape_record: $scheme.punctuation
  shape_vardecl: $scheme.variable
  shape_variable: $scheme.variable
  empty: { attr: n }
  filesize: {||
    if $in < 1kb {
      $env.colors.teal
    } else if $in < 10kb {
      $env.colors.green
    } else if $in < 100kb {
      $env.colors.yellow
    } else if $in < 10mb {
      $env.colors.peach
    } else if $in < 100mb {
      $env.colors.maroon
    } else if $in < 1gb {
      $env.colors.red
    } else {
      $env.colors.mauve
    }
  }
  duration: {||
    if $in < 1day {
      $env.colors.teal
    } else if $in < 1wk {
      $env.colors.green
    } else if $in < 4wk {
      $env.colors.yellow
    } else if $in < 12wk {
      $env.colors.peach
    } else if $in < 24wk {
      $env.colors.maroon
    } else if $in < 52wk {
      $env.colors.red
    } else {
      $env.colors.mauve
    }
  }
  date: {|| (date now) - $in |
    if $in < 1day {
      $env.colors.teal
    } else if $in < 1wk {
      $env.colors.green
    } else if $in < 4wk {
      $env.colors.yellow
    } else if $in < 12wk {
      $env.colors.peach
    } else if $in < 24wk {
      $env.colors.maroon
    } else if $in < 52wk {
      $env.colors.red
    } else {
      $env.colors.mauve
    }
  }
  shape_external: $scheme.unrecognized_command
  shape_internalcall: $scheme.recognized_command
  shape_external_resolved: $scheme.recognized_command
  shape_block: $scheme.recognized_command
  block: $scheme.recognized_command
  shape_custom: $env.colors.pink
  custom: $env.colors.pink
  background: $env.colors.base
  foreground: $env.colors.text
  cursor: { bg: $env.colors.rosewater fg: $env.colors.base }
  shape_range: $scheme.operator
  range: $scheme.operator
  shape_pipe: $scheme.operator
  shape_operator: $scheme.operator
  shape_redirection: $scheme.operator
  glob: $scheme.filepath
  shape_directory: $scheme.filepath
  shape_filepath: $scheme.filepath
  shape_glob_interpolation: $scheme.filepath
  shape_globpattern: $scheme.filepath
  shape_int: $scheme.constant
  int: $scheme.constant
  bool: $scheme.constant
  float: $scheme.constant
  nothing: $scheme.constant
  binary: $scheme.constant
  shape_nothing: $scheme.constant
  shape_bool: $scheme.constant
  shape_float: $scheme.constant
  shape_binary: $scheme.constant
  shape_datetime: $scheme.constant
  shape_literal: $scheme.constant
  string: $scheme.string
  shape_string: $scheme.string
  shape_string_interpolation: $env.colors.flamingo
  shape_raw_string: $scheme.string
  shape_externalarg: $scheme.string
}
$env.config.highlight_resolved_externals = true
$env.config.explore = {
    status_bar_background: { fg: $env.colors.text, bg: $env.colors.mantle },
    command_bar_text: { fg: $env.colors.text },
    highlight: { fg: $env.colors.base, bg: $env.colors.yellow },
    status: {
        error: $env.colors.red,
        warn: $env.colors.yellow,
        info: $env.colors.blue,
    },
    selected_cell: { bg: $env.colors.blue fg: $env.colors.base },
}
