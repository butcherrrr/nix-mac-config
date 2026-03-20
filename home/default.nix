{ pkgs, ... }:

{
  imports = [
    ./git.nix
    ./zsh.nix
    ./tmux.nix
    ./nixvim.nix
    ./ghostty.nix
    ./wezterm.nix
    ./aerospace.nix
    ./karabiner.nix
    ./borders.nix
    ./yabai.nix
    ./skhd.nix
  ];

  home.username = "anthony";
  home.homeDirectory = "/Users/anthony";
  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
