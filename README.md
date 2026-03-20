# nix-mac-config

Declarative macOS setup using [nix-darwin](https://github.com/LnL7/nix-darwin), [home-manager](https://github.com/nix-community/home-manager), and [NixVim](https://github.com/nix-community/nixvim).

## What's managed

**System packages (via nix):** neovim (NixVim), tmux, fzf, eza, bat, zoxide, thefuck, delta, stylua

**Homebrew casks (via nix-darwin):** aerospace, wezterm, ghostty, karabiner-elements, raycast, docker, spotify, zed, firefox, font-jetbrains-mono

**Homebrew formulae:** borders

**Home-manager configs:** zsh (oh-my-zsh, p10k, aliases, fzf), git (delta), tmux (catppuccin), ghostty, wezterm, aerospace, karabiner, borders, yabai, skhd

**NixVim:** nord theme, treesitter, LSP (lua, typescript, html, css, go, python, nix), telescope, nvim-tree, cmp, gitsigns, lualine, which-key, conform

## Install

### 1. Install Nix

```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh
```

### 2. Clone this repo

```bash
git clone git@github.com:butcherrrr/nix-mac-config.git ~/nix-mac-config
```

### 3. Build and apply

```bash
cd ~/nix-mac-config
nix run nix-darwin -- switch --flake .
```

### 4. Rebuild after changes

```bash
darwin-rebuild switch --flake ~/nix-mac-config
```

## Structure

```
├── flake.nix           # Flake inputs and darwin configuration
├── hosts/
│   └── darwin.nix      # System packages, homebrew, macOS defaults
└── home/
    ├── default.nix     # Home-manager module imports
    ├── nixvim.nix      # Neovim configuration
    ├── zsh.nix         # Shell configuration
    ├── git.nix         # Git + delta
    ├── tmux.nix        # Tmux + catppuccin
    ├── ghostty.nix     # Ghostty terminal
    ├── wezterm.nix     # WezTerm terminal
    ├── aerospace.nix   # Aerospace window manager
    ├── karabiner.nix   # Karabiner-Elements
    ├── borders.nix     # Window borders
    ├── yabai.nix       # Yabai window manager
    ├── skhd.nix        # skhd hotkeys
    └── brew-helpers.zsh # brewin/brewrm fzf helpers
```
