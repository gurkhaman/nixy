{
  lib,
  pkgs,
  ...
}: {
  programs.nvf.settings.vim = {
    # ============================================================================
    # THEME CONFIGURATION
    # ============================================================================
    # This file makes it easy to switch between different colorschemes.
    # Just uncomment the theme you want to use and comment out the others.

    # ============================================================================
    # CATPPUCCIN (Current - Your Preference)
    # ============================================================================
    # theme = {
    #   enable = true;
    #   name = lib.mkForce "catppuccin";
    #   style = lib.mkForce "mocha"; # Options: latte, frappe, macchiato, mocha
    #   transparent = lib.mkForce true;
    # };
    #
    # # Additional Lua configuration to ensure Catppuccin loads properly
    # luaConfigRC.catppuccin-setup = lib.mkAfter ''
    #   -- Ensure Catppuccin is loaded and configured
    #   local catppuccin_ok, catppuccin = pcall(require, 'catppuccin')
    #   if catppuccin_ok then
    #     catppuccin.setup({
    #       flavour = "mocha",
    #       transparent_background = true,
    #     })
    #     vim.cmd.colorscheme('catppuccin')
    #   end
    # '';

    # ============================================================================
    # TOKYO NIGHT (Kickstart Default)
    # ============================================================================
    # To switch to Tokyo Night, comment out Catppuccin above and uncomment below:
    #
    # theme = {
    #   enable = true;
    #   name = lib.mkForce "tokyonight";
    #   style = lib.mkForce "night"; # Options: night, storm, moon, day
    #   transparent = lib.mkForce false;
    # };
    #
    # Additional Tokyo Night configuration (optional):
    # luaConfigRC.tokyonight-config = lib.mkAfter ''
    #   require('tokyonight').setup({
    #     style = "night",
    #     styles = {
    #       comments = { italic = false },  -- Kickstart disables italic comments
    #     },
    #   })
    # '';

    # ============================================================================
    # OTHER POPULAR THEMES
    # ============================================================================
    # nvf supports many themes out of the box. Here are some popular options:

    # GRUVBOX
    # -------
    # theme = {
    #   enable = true;
    #   name = "gruvbox";
    #   style = "dark";  # Options: dark, light
    # };

    # NORD
    # ----
    # theme = {
    #   enable = true;
    #   name = lib.mkForce "nord";
    # };

    # ONEDARK
    # -------
    # theme = {
    #   enable = true;
    #   name = "onedark";
    #   style = "dark";  # Options: dark, darker, cool, deep, warm, warmer
    # };

    # DRACULA
    # -------
    # theme = {
    #   enable = true;
    #   name = "dracula";
    # };

    # KANAGAWA
    # --------
    # theme = {
    #   enable = true;
    #   name = "kanagawa";
    #   style = "wave";  # Options: wave, dragon, lotus
    # };

    # ROSE-PINE
    # ---------
    theme = {
      enable = true;
      name = lib.mkForce "rose-pine";
      style = lib.mkForce "main"; # Options: main, moon, dawn
      transparent = lib.mkForce true;
    };

    # ============================================================================
    # CUSTOM THEME CONFIGURATION
    # ============================================================================
    # If you want to use a theme not built into nvf, you can add it manually:
    #
    # theme.enable = false;  # Disable nvf's theme management
    #
    # Then add the plugin and configure it:
    # startPlugins = [
    #   pkgs.vimPlugins.your-theme-plugin
    # ];
    #
    # luaConfigRC.custom-theme = lib.mkAfter ''
    #   vim.cmd.colorscheme('your-theme-name')
    # '';

    # ============================================================================
    # THEME-SPECIFIC TWEAKS
    # ============================================================================
    # Some additional options you might want to adjust per theme:

    # Enable/disable transparency (works with most themes)
    # transparent = true;  # Already set in theme config above

    # Adjust for terminal colors
    # If your terminal has a specific colorscheme, you might want to disable
    # Neovim's theme and use terminal colors instead:
    # theme.enable = false;
    # luaConfigRC.terminal-colors = lib.mkAfter ''
    #   vim.cmd([[
    #     highlight Normal guibg=NONE ctermbg=NONE
    #     highlight NormalNC guibg=NONE ctermbg=NONE
    #   ]])
    # '';

    # ============================================================================
    # KICKSTART COMPARISON
    # ============================================================================
    # Kickstart uses Tokyo Night with these settings:
    # - Style: "tokyonight-night"
    # - Italic comments: disabled
    # - Priority: 1000 (loaded first)
    #
    # Your Catppuccin equivalent maintains similar aesthetics while being
    # slightly warmer/softer. Both are excellent dark themes!
    statusline.lualine = {
      enable = true;
      theme = lib.mkForce "auto";
    };
  };
}
