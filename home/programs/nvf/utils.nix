{pkgs, ...}: {
  programs.nvf.settings.vim = {
    undoFile.enable = true;
    utility = {
      motion.flash-nvim.enable = true;
      outline.aerial-nvim.enable = true;
    };
    tabline.nvimBufferline.enable = false;
    notes.todo-comments.enable = true;
    assistant.copilot = {
      enable = true;
      cmp.enable = false;

      mappings.suggestion = {
        accept = "<M-l>"; # Accept with Tab
        next = "<M-]>"; # Next suggestion
        prev = "<M-[>"; # Previous suggestion
        dismiss = "<C-]>"; # Dismiss suggestion
      };

      setupOpts = {
        suggestion = {
          enabled = true;
          auto_trigger = true;
          debounce = 75;
        };
        panel = {
          enabled = false;
        };
      };
    };
    statusline.lualine.enable = true;

    autocomplete = {
      nvim-cmp = {
        enable = true;
        sources = {
          buffer = "[Buffer]";
          nvim-cmp = null;
          path = "[Path]";
        };
        sourcePlugins = [
          pkgs.vimPlugins.cmp-cmdline
        ];
      };
    };

    snippets.luasnip.enable = true;
    ui = {
      noice.enable = false;
      colorizer.enable = true;
    };
    git = {
      enable = true;
      gitsigns.enable = true;
    };
    terminal.toggleterm = {
      enable = true;
      lazygit = {
        enable = true;
        mappings.open = "<leader>gl";
      };
    };
    visuals = {
      rainbow-delimiters.enable = true;
      nvim-scrollbar = {
        enable = false;
      };
    };
  };
}
