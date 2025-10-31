{pkgs, ...}: {
  programs.nvf.settings.vim = {
    undoFile.enable = true;

    utility = {
      motion.flash-nvim.enable = true;
      outline.aerial-nvim.enable = true;
    };

    tabline.nvimBufferline.enable = false;
    notes.todo-comments.enable = true;

    # ============================================================================
    # COPILOT - AI Assistant
    # ============================================================================
    # Ghost text suggestions with Alt+L to accept (no Tab conflict!)
    assistant.copilot = {
      enable = true;
      cmp.enable = false; # Don't integrate with completion menu

      mappings.suggestion = {
        accept = "<M-l>"; # Alt+L to accept (Kickstart style)
        next = "<M-]>"; # Alt+] next suggestion
        prev = "<M-[>"; # Alt+[ previous suggestion
        dismiss = "<C-]>"; # Ctrl+] dismiss
      };

      setupOpts = {
        suggestion = {
          enabled = true;
          auto_trigger = true;
          debounce = 75;
        };
        panel.enabled = false;
      };
    };

    # ============================================================================
    # COMPLETION - Blink.cmp (Kickstart's choice)
    # ============================================================================
    # Using blink.cmp instead of nvim-cmp for simpler, saner defaults
    # Key philosophy: One key does one thing
    #   - Tab = Tab (or snippet jump)
    #   - Enter = Newline
    #   - Ctrl+Y = Accept completion (explicit)
    #   - Ctrl+N/P = Navigate (explicit)

    autocomplete.blink-cmp = {
      enable = true;

      # Use Kickstart's 'default' preset
      # This sets up the sane keybindings we want
      setupOpts = {
        keymap = {
          # 'default' preset gives us:
          #   <C-y> = accept completion
          #   <C-n>/<C-p> or arrows = navigate
          #   <C-Space> = open menu/docs
          #   <C-e> = hide menu
          preset = "default";
        };

        appearance = {
          # Use Nerd Font Mono for proper icon alignment
          nerd_font_variant = "mono";
        };

        completion = {
          # Don't auto-show docs by default (press Ctrl+Space to see them)
          documentation = {
            auto_show = false;
            auto_show_delay_ms = 500;
          };
        };

        sources = {
          # Default sources: LSP, path, snippets
          default = ["lsp" "path" "snippets" "buffer"];
        };

        snippets = {
          # Use luasnip for snippets (same as nvim-cmp)
          preset = "luasnip";
        };

        # Use Lua fuzzy matcher (no rust dependency)
        fuzzy = {
          implementation = "lua";
        };

        # Show signature help while typing function arguments
        signature = {
          enabled = true;
        };
      };
    };

    # LuaSnip for snippet expansion
    snippets.luasnip.enable = true;

    statusline.lualine.enable = true;

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
      nvim-scrollbar.enable = false;
    };
  };
}
