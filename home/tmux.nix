{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    mouse = true;
    terminal = "tmux-256color";

    plugins = with pkgs.tmuxPlugins; [
      sensible
      yank
      {
        plugin = catppuccin;
        extraConfig = ''
          set -g @catppuccin_flavour 'mocha'
          set -g @catppuccin_window_status_style "rounded"
          set -g @catppuccin_status_module_bg "none"
        '';
      }
    ];

    extraConfig = ''
      # True color support
      set-option -ga terminal-overrides ",xterm-256color:Tc"

      # Window settings
      set -g pane-base-index 1
      set-window-option -g pane-base-index 1
      set-option -g renumber-windows on

      set -g status-position top

      # Status line
      set -g status-right-length 100
      set -g status-left-length 100
      set -g status-left "#[fg=#cba6f7]#[bg=#cba6f7,fg=#1e1e2e,bold] #(basename #{pane_current_path}) #[fg=#cba6f7,bg=#1e1e2e] #[default]"
      set -g status-right "#{E:@catppuccin_status_application}"
      set -ag status-right "#{E:@catppuccin_status_session}"
      set -ag status-right "#{E:@catppuccin_status_uptime}"

      # Override theme status background
      set -g status-style bg=default,fg=default
      set -g status-left-style bg=default
      set -g status-right-style bg=default
    '';
  };
}
