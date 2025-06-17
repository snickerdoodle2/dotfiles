$env.colors = $env.catppuccin_mocha

$env.config.hooks.env_change.colors = [
    {|_, after|
        let scheme = {
            recognized_command: $after.blue
            unrecognized_command: $after.text
            constant: $after.peach
            punctuation: $after.overlay2
            operator: $after.sky
            string: $after.green
            virtual_text: $after.surface2
            variable: { fg: $after.flamingo attr: i }
            filepath: $after.yellow
        }

        $env.config.color_config = {
            separator: { fg: $after.surface2 attr: b }
            leading_trailing_space_bg: { fg: $after.lavender attr: u }
            header: { fg: $after.text attr: b }
            row_index: $scheme.virtual_text
            record: $after.text
            list: $after.text
            hints: $scheme.virtual_text
            search_result: { fg: $after.base bg: $after.yellow }
            shape_closure: $after.teal
            closure: $after.teal
            shape_flag: { fg: $after.maroon attr: i }
            shape_matching_brackets: { attr: u }
            shape_garbage: $after.red
            shape_keyword: $after.mauve
            shape_match_pattern: $after.green
            shape_signature: $after.teal
            shape_table: $scheme.punctuation
            cell-path: $scheme.punctuation
            shape_list: $scheme.punctuation
            shape_record: $scheme.punctuation
            shape_vardecl: $scheme.variable
            shape_variable: $scheme.variable
            empty: { attr: n }
            filesize: {||
                if $in < 1kb {
                    $after.teal
                } else if $in < 10kb {
                    $after.green
                } else if $in < 100kb {
                    $after.yellow
                } else if $in < 10mb {
                    $after.peach
                } else if $in < 100mb {
                    $after.maroon
                } else if $in < 1gb {
                    $after.red
                } else {
                    $after.mauve
                }
            }
            duration: {||
                if $in < 1day {
                    $after.teal
                } else if $in < 1wk {
                    $after.green
                } else if $in < 4wk {
                    $after.yellow
                } else if $in < 12wk {
                    $after.peach
                } else if $in < 24wk {
                    $after.maroon
                } else if $in < 52wk {
                    $after.red
                } else {
                    $after.mauve
                }
            }
            date: {|| (date now) - $in |
                if $in < 1day {
                    $after.teal
                } else if $in < 1wk {
                    $after.green
                } else if $in < 4wk {
                    $after.yellow
                } else if $in < 12wk {
                    $after.peach
                } else if $in < 24wk {
                    $after.maroon
                } else if $in < 52wk {
                    $after.red
                } else {
                    $after.mauve
                }
            }
            shape_external: $scheme.unrecognized_command
            shape_internalcall: $scheme.recognized_command
            shape_external_resolved: $scheme.recognized_command
            shape_block: $scheme.recognized_command
            block: $scheme.recognized_command
            shape_custom: $after.pink
            custom: $after.pink
            background: $after.base
            foreground: $after.text
            cursor: { bg: $after.rosewater fg: $after.base }
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
            shape_string_interpolation: $after.flamingo
            shape_raw_string: $scheme.string
            shape_externalarg: $scheme.string
        }
        $env.config.highlight_resolved_externals = true
        $env.config.explore = {
            status_bar_background: { fg: $after.text, bg: $after.mantle },
            command_bar_text: { fg: $after.text },
            highlight: { fg: $after.base, bg: $after.yellow },
            status: {
                error: $after.red,
                warn: $after.yellow,
                info: $after.blue,
            },
            selected_cell: { bg: $after.blue fg: $after.base },
        }
    }
]
