{pkgs, ...}: let
  accent = "\"#a6e3a1\"";
in {
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    prefix = "C-Space";
    newSession = true;
    secureSocket = true;
    customPaneNavigationAndResize = true;
    keyMode = "vi";
    terminal = "tmux-256color";
    mouse = true;
  };
  programs.tmux.plugins = [
    {
      plugin = pkgs.tmuxPlugins.minimal-tmux-status;
      extraConfig = ''
        set -g @minimal-tmux-bg ${accent}
        set -g @minimal-tmux-fg "#11111b"
        set -g @minimal-tmux-indicator-str "#S"
        set -g @minimal-tmux-right false
        set -g pane-active-border-style fg=${accent}
        set -sg escape-time 0
      '';
    }
  ];
  programs.tmux.extraConfig = ''
    set -g exit-empty off
    unbind '"'
    unbind %
    bind \\ split-window -h -c "#{pane_current_path}"
    bind - split-window -v -c "#{pane_current_path}"
  '';
}
