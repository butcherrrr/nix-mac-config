{ pkgs, ... }:

{
  # Nix settings
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  # System packages
  environment.systemPackages = with pkgs; [
    tmux
    fzf
    eza
    bat
    zoxide
    thefuck
    delta
    stylua
  ];

  # Homebrew — managed declaratively by nix-darwin
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
    };

    taps = [
      "nikitabobko/tap"
      "FelixKratz/formulae"
      "koekeishiya/formulae"
    ];

    brews = [
      "borders"
      # "yabai"
      # "skhd"
    ];

    casks = [
      "aerospace"
      "wezterm"
      "ghostty"
      "karabiner-elements"
      "font-jetbrains-mono"
      "raycast"
      "docker"
      "spotify"
      "zed"
      "firefox"
    ];
  };

  # System defaults
  system.defaults = {
    dock = {
      autohide = true;
      show-recents = false;
    };
    finder = {
      AppleShowAllExtensions = true;
    };
    NSGlobalDomain = {
      AppleShowAllExtensions = true;
      InitialKeyRepeat = 14;
      KeyRepeat = 1;
    };
  };

  # Enable Touch ID for sudo
  security.pam.services.sudo_local.touchIdAuth = true;

  system.stateVersion = 5;
}
