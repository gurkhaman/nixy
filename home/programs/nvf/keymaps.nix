{
  programs.nvf.settings.vim = {
    # Leader key is set in options.nix globals

    binds = {
      whichKey = {
        enable = true;
        register = {};
      };
    };

    keymaps = [
      # ============================================================================
      # KICKSTART BASIC KEYMAPS (Priority)
      # ============================================================================

      # Clear search highlights on <Esc> in normal mode
      {
        key = "<Esc>";
        mode = "n";
        silent = true;
        action = "<cmd>nohlsearch<CR>";
        desc = "Clear search highlight";
      }

      # Diagnostic quickfix list
      {
        key = "<leader>q";
        mode = "n";
        silent = true;
        action = "<cmd>lua vim.diagnostic.setloclist()<CR>";
        desc = "Open diagnostic [Q]uickfix list";
      }

      # Exit terminal mode easier
      {
        key = "<Esc><Esc>";
        mode = "t";
        silent = true;
        action = "<C-\\><C-n>";
        desc = "Exit terminal mode";
      }

      # ============================================================================
      # WINDOW NAVIGATION - Kickstart style (standard Neovim)
      # ============================================================================
      # NOTE: If you use Kitty terminal, you may want to switch these back to
      # KittyNavigate commands. For Kickstart compatibility, using standard Neovim.

      {
        key = "<C-h>";
        mode = "n";
        silent = true;
        action = "<C-w><C-h>";
        desc = "Move focus to the left window";
      }
      {
        key = "<C-j>";
        mode = "n";
        silent = true;
        action = "<C-w><C-j>";
        desc = "Move focus to the lower window";
      }
      {
        key = "<C-k>";
        mode = "n";
        silent = true;
        action = "<C-w><C-k>";
        desc = "Move focus to the upper window";
      }
      {
        key = "<C-l>";
        mode = "n";
        silent = true;
        action = "<C-w><C-l>";
        desc = "Move focus to the right window";
      }

      # ============================================================================
      # KICKSTART TELESCOPE/PICKER KEYMAPS
      # ============================================================================
      # NOTE: Using Snacks picker instead of Telescope, but keeping same keybindings

      # Primary search keymaps (Kickstart)
      {
        key = "<leader>sh";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.help()<cr>";
        desc = "[S]earch [H]elp";
      }
      {
        key = "<leader>sk";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.keymaps()<cr>";
        desc = "[S]earch [K]eymaps";
      }
      {
        key = "<leader>sf";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.files()<cr>";
        desc = "[S]earch [F]iles";
      }
      {
        key = "<leader>ss";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.pickers()<cr>";
        desc = "[S]earch [S]elect Picker";
      }
      {
        key = "<leader>sw";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.grep_word()<cr>";
        desc = "[S]earch current [W]ord";
      }
      {
        key = "<leader>sg";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.grep()<cr>";
        desc = "[S]earch by [G]rep";
      }
      {
        key = "<leader>sd";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.diagnostics()<cr>";
        desc = "[S]earch [D]iagnostics";
      }
      {
        key = "<leader>sr";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.resume()<cr>";
        desc = "[S]earch [R]esume";
      }
      {
        key = "<leader>s.";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.recent()<cr>";
        desc = "[S]earch Recent Files";
      }
      {
        key = "<leader><leader>";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.buffers()<cr>";
        desc = "[ ] Find existing buffers";
      }

      # Fuzzy search in current buffer
      {
        key = "<leader>/";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.lines()<cr>";
        desc = "[/] Fuzzily search in current buffer";
      }

      # Search in open files
      {
        key = "<leader>s/";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.grep_buffers()<cr>";
        desc = "[S]earch [/] in Open Files";
      }

      # Search Neovim config files
      {
        key = "<leader>sn";
        mode = "n";
        silent = true;
        action = ''<cmd>lua Snacks.picker.files({ cwd = vim.fn.stdpath("config") })<cr>'';
        desc = "[S]earch [N]eovim files";
      }

      # ============================================================================
      # LSP KEYMAPS (from Kickstart LspAttach autocmd)
      # ============================================================================
      # NOTE: These will be set in the LSP on_attach, but we define them here
      # for reference. The actual LSP keymaps should be configured in languages.nix
      # using nvf's LSP attach mechanism.
      #
      # Kickstart LSP keybindings:
      # - grn: Rename
      # - gra: Code Action
      # - grr: References
      # - gri: Implementation
      # - grd: Definition
      # - grD: Declaration
      # - gO: Document Symbols
      # - gW: Workspace Symbols
      # - grt: Type Definition
      # - <leader>th: Toggle Inlay Hints

      # For now, using Snacks picker for LSP navigation (already configured in picker.nix)
      # We'll map the Kickstart 'gr*' pattern to match:

      {
        key = "grn";
        mode = "n";
        silent = true;
        action = "<cmd>lua vim.lsp.buf.rename()<CR>";
        desc = "LSP: [R]e[n]ame";
      }
      {
        key = "gra";
        mode = ["n" "x"];
        silent = true;
        action = "<cmd>lua vim.lsp.buf.code_action()<CR>";
        desc = "LSP: Code [A]ction";
      }
      {
        key = "grr";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.lsp_references()<cr>";
        desc = "LSP: [G]oto [R]eferences";
      }
      {
        key = "gri";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.lsp_implementations()<cr>";
        desc = "LSP: [G]oto [I]mplementation";
      }
      {
        key = "grd";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.lsp_definitions()<cr>";
        desc = "LSP: [G]oto [D]efinition";
      }
      {
        key = "grD";
        mode = "n";
        silent = true;
        action = "<cmd>lua vim.lsp.buf.declaration()<CR>";
        desc = "LSP: [G]oto [D]eclaration";
      }
      {
        key = "gO";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.lsp_symbols()<cr>";
        desc = "LSP: Document Symbols";
      }
      {
        key = "gW";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.lsp_workspace_symbols()<cr>";
        desc = "LSP: Workspace Symbols";
      }
      {
        key = "grt";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.lsp_type_definitions()<cr>";
        desc = "LSP: [G]oto [T]ype Definition";
      }
      {
        key = "<leader>th";
        mode = "n";
        silent = true;
        action = "<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>";
        desc = "[T]oggle Inlay [H]ints";
      }

      # Keep K for hover (standard Vim/Neovim binding)
      {
        key = "K";
        mode = "n";
        silent = true;
        action = "<cmd>lua vim.lsp.buf.hover()<cr>";
        desc = "LSP Hover";
      }

      # ============================================================================
      # TROUBLE.NVIM - Diagnostics Panel (IDE-style)
      # ============================================================================

      # Open diagnostics panel - all files
      {
        key = "<leader>xx";
        mode = "n";
        silent = true;
        action = "<cmd>Trouble diagnostics toggle<cr>";
        desc = "Diagnostics (Trouble)";
      }
      # Open diagnostics panel - current buffer only
      {
        key = "<leader>xX";
        mode = "n";
        silent = true;
        action = "<cmd>Trouble diagnostics toggle filter.buf=0<cr>";
        desc = "Buffer Diagnostics (Trouble)";
      }
      # Code symbols outline
      {
        key = "<leader>cs";
        mode = "n";
        silent = true;
        action = "<cmd>Trouble symbols toggle focus=false<cr>";
        desc = "[C]ode [S]ymbols (Trouble)";
      }
      # LSP definitions/references
      {
        key = "<leader>cl";
        mode = "n";
        silent = true;
        action = "<cmd>Trouble lsp toggle focus=false win.position=right<cr>";
        desc = "[C]ode [L]SP refs/defs (Trouble)";
      }
      # Location list
      {
        key = "<leader>xL";
        mode = "n";
        silent = true;
        action = "<cmd>Trouble loclist toggle<cr>";
        desc = "Location List (Trouble)";
      }
      # Quickfix list
      {
        key = "<leader>xQ";
        mode = "n";
        silent = true;
        action = "<cmd>Trouble qflist toggle<cr>";
        desc = "Quickfix List (Trouble)";
      }

      # ============================================================================
      # ADDITIONAL USEFUL KEYMAPS (From your original config)
      # ============================================================================

      # Quick file navigation
      {
        key = "<leader> ";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.smart()<cr>";
        desc = "Smart Find Files";
      }
      {
        key = "<leader>,";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.buffers()<cr>";
        desc = "Buffers";
      }
      {
        key = "<leader>:";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.command_history()<cr>";
        desc = "Command History";
      }

      # File explorer
      {
        key = "<leader>e";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.explorer()<cr>";
        desc = "File Explorer";
      }
      {
        key = "-";
        mode = "n";
        silent = true;
        action = "<cmd>Oil<cr>";
        desc = "Oil";
      }

      # Buffer navigation
      {
        key = "<C-tab>";
        mode = "n";
        silent = true;
        action = "<cmd>bnext<cr>";
        desc = "Next Buffer";
      }

      # Flash motion (useful addition)
      {
        key = "s";
        mode = "n";
        silent = true;
        action = "<cmd>lua require('flash').jump()<cr>";
        desc = "Flash";
      }

      # ============================================================================
      # UI TOGGLES (From your original config - useful additions)
      # ============================================================================

      {
        key = "<leader>uw";
        mode = "n";
        silent = true;
        action = "<cmd>set wrap!<cr>";
        desc = "Toggle word wrapping";
      }
      {
        key = "<leader>ul";
        mode = "n";
        silent = true;
        action = "<cmd>set linebreak!<cr>";
        desc = "Toggle linebreak";
      }
      {
        key = "<leader>us";
        mode = "n";
        silent = true;
        action = "<cmd>set spell!<cr>";
        desc = "Toggle spellcheck";
      }
      {
        key = "<leader>uc";
        mode = "n";
        silent = true;
        action = "<cmd>set cursorline!<cr>";
        desc = "Toggle cursorline";
      }
      {
        key = "<leader>un";
        mode = "n";
        silent = true;
        action = "<cmd>set number!<cr>";
        desc = "Toggle line numbers";
      }
      {
        key = "<leader>ur";
        mode = "n";
        silent = true;
        action = "<cmd>set relativenumber!<cr>";
        desc = "Toggle relative line numbers";
      }

      # ============================================================================
      # WINDOW MANAGEMENT (From your original config)
      # ============================================================================

      {
        key = "<leader>ws";
        mode = "n";
        silent = true;
        action = "<cmd>split<cr>";
        desc = "Split";
      }
      {
        key = "<leader>wv";
        mode = "n";
        silent = true;
        action = "<cmd>vsplit<cr>";
        desc = "VSplit";
      }
      {
        key = "<leader>wd";
        mode = "n";
        silent = true;
        action = "<cmd>close<cr>";
        desc = "Close";
      }

      # ============================================================================
      # GIT KEYMAPS (From your picker.nix)
      # ============================================================================

      {
        key = "<leader>gb";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.git_branches()<cr>";
        desc = "Git Branches";
      }
      {
        key = "<leader>gL";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.git_log()<cr>";
        desc = "Git Log";
      }
      {
        key = "<leader>gs";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.git_status()<cr>";
        desc = "Git Status";
      }
      {
        key = "<leader>gS";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.git_stash()<cr>";
        desc = "Git Stash";
      }
      {
        key = "<leader>gd";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.git_diff()<cr>";
        desc = "Git Diff";
      }
      {
        key = "<leader>gf";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.git_log_file()<cr>";
        desc = "Git Log File";
      }
      {
        key = "<leader>gl";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.lazygit()<cr>";
        desc = "LazyGit";
      }

      # ============================================================================
      # ADDITIONAL SEARCH KEYMAPS (From your picker.nix)
      # ============================================================================

      {
        key = "<leader>sb";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.lines()<cr>";
        desc = "Buffer Lines";
      }
      {
        key = "<leader>st";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.todo_comments()<cr>";
        desc = "Todos";
      }
      {
        key = "<leader>sB";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.grep_buffers()<cr>";
        desc = "Grep Open Buffers";
      }

      # Additional find keymaps
      {
        key = "<leader>fb";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.buffers()<cr>";
        desc = "Buffers";
      }
      {
        key = "<leader>fc";
        mode = "n";
        silent = true;
        action = ''<cmd>lua Snacks.picker.files({ cwd = vim.fn.stdpath("config") })<cr>'';
        desc = "Find Config File";
      }
      {
        key = "<leader>ff";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.files()<cr>";
        desc = "Find Files";
      }
      {
        key = "<leader>fg";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.git_files()<cr>";
        desc = "Find Git Files";
      }
      {
        key = "<leader>fp";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.projects()<cr>";
        desc = "Projects";
      }
      {
        key = "<leader>fr";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.recent()<cr>";
        desc = "Recent";
      }
      {
        key = "<leader>fn";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.notifications()<cr>";
        desc = "Notification History";
      }
      {
        key = "<leader>fe";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.icons()<cr>";
        desc = "Emoji";
      }
    ];

    # ============================================================================
    # HIGHLIGHT ON YANK (Kickstart autocmd)
    # ============================================================================
    # This is configured via Lua since it's an autocmd
    luaConfigRC.highlight-yank = ''
      -- Highlight when yanking (copying) text
      -- See `:help vim.hl.on_yank()`
      vim.api.nvim_create_autocmd('TextYankPost', {
        desc = 'Highlight when yanking (copying) text',
        group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
        callback = function()
          vim.hl.on_yank()
        end,
      })
    '';
  };
}
