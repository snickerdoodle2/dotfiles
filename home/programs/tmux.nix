{pkgs, ...}: let
  accent = "\"#a6e3a1\"";
in {
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    prefix = "C-Space";
    secureSocket = true;
    customPaneNavigationAndResize = true;
    keyMode = "vi";
    terminal = "tmux-256color";
    mouse = true;
  };
  programs.tmux.plugins = [
    pkgs.tmuxPlugins.sensible
    pkgs.tmuxPlugins.yank
    {
      plugin = pkgs.tmuxPlugins.minimal-tmux-status;
      extraConfig = ''
        set -g @minimal-tmux-bg ${accent}
        set -g @minimal-tmux-fg "#11111b"
        set -g @minimal-tmux-indicator-str "#S"
        set -g @minimal-tmux-right false
      '';
    }
  ];
  programs.tmux.extraConfig = ''
    set -g exit-empty off
    unbind '"'
    unbind %
    bind \\ split-window -h -c "#{pane_current_path}"
    bind - split-window -v -c "#{pane_current_path}"
    bind c new-window -c "#{pane_current_path}"

    set-window-option -g mode-keys vi
    bind-key -T copy-mode-vi v send-keys -X begin-selection
    bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
    bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel

    set -g pane-active-border-style fg=${accent}

    bind -N "Select pane to the left of the active pane" h select-pane -L
    bind -N "Select pane to the left of the active pane" C-h select-pane -L
    bind -N "Select pane below the active pane" j select-pane -D
    bind -N "Select pane below the active pane" C-j select-pane -D
    bind -N "Select pane above the active pane" k select-pane -U
    bind -N "Select pane above the active pane" C-k select-pane -U
    bind -N "Select pane to the right of the active pane" l select-pane -R
    bind -N "Select pane to the right of the active pane" C-l select-pane -R
  '';
}
