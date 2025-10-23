{lib, ...}: {
  programs.nvf.settings.vim = {
    # Set vi and vim aliases
    viAlias = false;
    vimAlias = true;
    withNodeJs = true;

    # Vim options - matching Kickstart.nvim philosophy
    options = {
      # Line numbers
      number = true;
      # relativenumber = false; # Kickstart has this commented out, uncomment if you want relative numbers

      # Mouse support
      mouse = "a";

      # Don't show mode in command line (shown in statusline)
      showmode = false;

      # Indentation
      autoindent = true;
      smartindent = true;
      breakindent = true; # Enable break indent for wrapped lines
      shiftwidth = 2;
      tabstop = 2;
      softtabstop = 2;
      expandtab = true; # Use spaces instead of tabs

      # Search behavior
      ignorecase = true; # Case-insensitive search
      smartcase = true; # Unless search contains uppercase

      # Sign column
      signcolumn = "yes"; # Always show sign column

      # Update and timeout settings
      updatetime = 250; # Faster completion and diagnostics
      timeoutlen = 300; # Faster key sequence completion

      # Split behavior
      splitright = true; # Vertical splits go to the right
      splitbelow = true; # Horizontal splits go below

      # Whitespace characters
      list = true;
      # listchars set below using vim.opt for table handling

      # Live substitution preview
      inccommand = "split";

      # Cursor line
      cursorline = true;

      # Scrolling
      scrolloff = 10; # Minimum lines above/below cursor

      # Confirm dialog instead of failing commands
      confirm = true;

      # Undo file
      undofile = true; # Save undo history

      # Folding (your existing settings, keeping them)
      foldlevel = 99;
      foldcolumn = "auto:1";

      # Mouse scrolling (your existing settings, keeping them)
      mousescroll = "ver:1,hor:1";
      mousemoveevent = true;

      # Fill characters (your existing settings, keeping them)
      fillchars = "eob:‿,fold: ,foldopen:▼,foldsep:⸽,foldclose:⏵";

      # Wrapping (keeping your preference)
      wrap = false;
    };

    # Setting listchars using luaConfigPre since it needs table syntax
    luaConfigPre = ''
      -- Set listchars for whitespace display
      vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
    '';

    # Global variables
    globals = {
      # Leader keys (matching Kickstart)
      mapleader = " ";
      maplocalleader = " ";

      # Nerd Font (Kickstart default is false, change if you have one)
      have_nerd_font = true;

      # Your existing globals for specific tools
      navic_silence = true;
      suda_smart_edit = 1;

      # Neovide settings (your existing, keeping them)
      neovide_scale_factor = 0.7;
      neovide_cursor_animation_length = 0.1;
      neovide_cursor_short_animation_length = 0;
    };

    # Clipboard configuration (matching Kickstart)
    # Kickstart uses vim.schedule for clipboard, but nvf handles this well
    clipboard = {
      enable = true;
      registers = "unnamedplus";
      providers.wl-copy.enable = true;
    };

    # Theme configuration is now in theme.nix for easier switching
  };
}
