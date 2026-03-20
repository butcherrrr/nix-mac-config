{ ... }:

{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    globals.mapleader = " ";

    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      tabstop = 2;
      expandtab = true;
      smartindent = true;
      wrap = false;
      termguicolors = true;
      cursorline = true;
      signcolumn = "yes";
      clipboard = "unnamedplus";
      ignorecase = true;
      smartcase = true;
      undofile = true;
    };

    colorschemes.nord = {
      enable = true;
      settings = {
        italic = true;
        borders = true;
      };
    };

    keymaps = [
      { mode = "n"; key = ";"; action = ":"; options.desc = "Enter command mode"; }
      { mode = "i"; key = "jk"; action = "<ESC>"; options.desc = "Exit insert mode"; }
      { mode = "n"; key = "<leader>ff"; action = "<cmd>Telescope find_files<cr>"; options.desc = "Find files"; }
      { mode = "n"; key = "<leader>fg"; action = "<cmd>Telescope live_grep<cr>"; options.desc = "Live grep"; }
      { mode = "n"; key = "<leader>fb"; action = "<cmd>Telescope buffers<cr>"; options.desc = "Find buffers"; }
      { mode = "n"; key = "<leader>e"; action = "<cmd>NvimTreeToggle<cr>"; options.desc = "Toggle file tree"; }
    ];

    plugins = {
      # Syntax highlighting
      treesitter = {
        enable = true;
        settings.ensure_installed = [
          "lua" "javascript" "typescript" "html" "css"
          "python" "go" "json" "markdown" "bash" "nix"
        ];
        settings.highlight.enable = true;
        settings.indent.enable = true;
      };

      # LSP
      lsp = {
        enable = true;
        servers = {
          lua_ls.enable = true;
          ts_ls.enable = true;
          html.enable = true;
          cssls.enable = true;
          gopls.enable = true;
          pyright.enable = true;
          nil_ls.enable = true; # Nix LSP
        };
      };

      # Completion
      cmp = {
        enable = true;
        settings = {
          sources = [
            { name = "nvim_lsp"; }
            { name = "luasnip"; }
            { name = "path"; }
            { name = "buffer"; }
          ];
          mapping = {
            "<C-n>" = "cmp.mapping.select_next_item()";
            "<C-p>" = "cmp.mapping.select_prev_item()";
            "<C-d>" = "cmp.mapping.scroll_docs(-4)";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<C-Space>" = "cmp.mapping.complete()";
          };
        };
      };
      cmp-nvim-lsp.enable = true;
      cmp-path.enable = true;
      cmp-buffer.enable = true;
      luasnip.enable = true;

      # Formatting
      conform-nvim = {
        enable = true;
        settings = {
          format_on_save = {
            timeout_ms = 500;
            lsp_fallback = true;
          };
          formatters_by_ft = {
            lua = [ "stylua" ];
          };
        };
      };

      # File tree
      nvim-tree = {
        enable = true;
        git.enable = true;
      };

      # Fuzzy finder
      telescope = {
        enable = true;
      };

      # Git
      gitsigns.enable = true;

      # UI
      lualine = {
        enable = true;
        settings.options.theme = "nord";
      };
      web-devicons.enable = true;
      which-key.enable = true;
      nvim-autopairs.enable = true;
      indent-blankline.enable = true;

      # Comments
      comment.enable = true;
    };
  };
}
