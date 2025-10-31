{
  lib,
  pkgs,
  ...
}: {
  programs.nvf.settings.vim = {
    diagnostics = {
      enable = true;
      config = {
        signs = {
          text = lib.generators.mkLuaInline ''
            {
              [vim.diagnostic.severity.ERROR] = " ";
              [vim.diagnostic.severity.WARN] = " ";
              [vim.diagnostic.severity.HINT] = " ";
              [vim.diagnostic.severity.INFO] = " ";
            }
          '';
        };
        underline = true;
        update_in_insert = true;

        # Disable inline virtual text - use Trouble panel instead
        virtual_text = false;
      };
      nvim-lint = {
        enable = true;
      };
    };

    syntaxHighlighting = true;
    treesitter = {
      enable = true;
      autotagHtml = true;
      context.enable = true;
      highlight.enable = true;
      grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        typescript # in language settings only tsx gets enabled, not typescript
      ];
    };
    lsp = {
      enable = true;
      trouble.enable = true;
      lspconfig.enable = true;
      formatOnSave = true;
      inlayHints.enable = true;
      null-ls.enable = true;
      servers.nixd.settings.nil.nix.autoArchive = true;
      otter-nvim = {
        enable = true;
        setupOpts = {
          buffers.set_filetype = true;
          lsp = {
            diagnostic_update_event = [
              "BufWritePost"
              "InsertLeave"
            ];
          };
        };
      };
      lspkind.enable = true;

      # Disable LSPSaga for cleaner UI (Kickstart-style)
      # LSPSaga adds extra UI elements that can clutter the screen
      lspsaga.enable = false;
    };
    languages = {
      enableDAP = true;
      enableExtraDiagnostics = true;
      enableFormat = true;
      enableTreesitter = true;

      astro.enable = true;
      go.enable = true;
      markdown = {
        enable = true;
        format.type = "prettierd";
        extensions = {
          markview-nvim = {
            enable = true;
          };
        };
        extraDiagnostics.enable = true;
      };
      ts = {
        enable = true;
        extensions.ts-error-translator.enable = true;
      };
      css.enable = true;
      svelte.enable = true;
      html.enable = true;
      bash.enable = true;
      nix.enable = true;
      tailwind.enable = true;
      python.enable = true;
    };
    formatter = {
      conform-nvim = {
        enable = true;
      };
    };
  };
}
