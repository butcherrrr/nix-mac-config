{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "docker-compose" "repo" "sudo" "thefuck" ];
    };

    shellAliases = {
      vim = "nvim";
      tm = "tmux";
      ls = "eza";
      wm = "aerospace";
      pf = "fzf --preview='clp {}' --preview-window=right:60%:border-left:hidden --bind '?:toggle-preview' --bind shift-up:preview-page-up,shift-down:preview-page-down";
    };

    sessionVariables = {
      EDITOR = "nvim";
      BAT_THEME = "Nord";
      FZF_TMUX_OPTS = "-p 90%,70%";
      FZF_DEFAULT_OPTS = ''
        --color=bg:-1,bg+:-1
        --color=fg:#d8dee9,fg+:#eceff4
        --color=hl:#ebcb8b,hl+:#d08770
        --color=prompt:#a3be8c
        --color=pointer:#5e81ac,marker:#88c0d0
        --color=border:#4c566a,separator:#434c5e,scrollbar:#3b4252
        --color=info:#b48ead,header:#8fbcbb
        --color=spinner:#81a1c1
        --border=rounded
        --separator='─'
        --scrollbar='│'
        --layout=reverse
        --info=inline-right
        --margin=5%,5%
        --prompt='❯ '
        --pointer=''
        --marker='''';
    };

    initExtraFirst = ''
      # Powerlevel10k instant prompt
      if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
        source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
      fi
    '';

    initExtra = ''
      # Load Powerlevel10k theme
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      [[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

      # Initialize zoxide
      eval "$(zoxide init zsh)"

      # Load thefuck alias
      eval "$(thefuck --alias)"

      # fzf keybindings
      [ -f "$HOME/.fzf.zsh" ] && source "$HOME/.fzf.zsh"

      # Load work helpers (if they exist)
      [ -f "$HOME/dev/.work-helpers.sh" ] && source "$HOME/dev/.work-helpers.sh"
      [ -f "$HOME/dev/Advisa/dev-docker/shortcuts.sh" ] && source "$HOME/dev/Advisa/dev-docker/shortcuts.sh"

      # Load Deno environment
      [ -f "$HOME/.deno/env" ] && . "$HOME/.deno/env"

      # Python path
      export PATH="$PATH:$HOME/Library/Python/3.9/bin"

      # Git helper: interactive branch checkout
      gbf() {
        git branch --all \
          | sed 's/^..//' \
          | fzf --preview 'git log -1 --color=always {}' \
            --preview-window=right:60%:border-left:hidden \
            --bind '?:toggle-preview' \
          | xargs git checkout
      }

      # Git helper: interactive log viewer
      glf() {
        git log --oneline --color=always \
          | fzf --ansi --preview 'COLUMNS=$FZF_PREVIEW_COLUMNS git show --color=always {1} | delta --width $FZF_PREVIEW_COLUMNS' \
            --preview-window=right:60%:border-left:hidden \
            --bind '?:toggle-preview'
      }

      ${builtins.readFile ./brew-helpers.zsh}
    '';
  };

  home.packages = with pkgs; [
    zsh-powerlevel10k
  ];
}
