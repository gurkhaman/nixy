# NVF Configuration - Kickstart-inspired Neovim setup
{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.nvf.homeManagerModules.default
    ./options.nix # Core vim options and settings
    ./theme.nix # Colorscheme configuration
    ./keymaps.nix # Keybindings (Kickstart-based)
    ./languages.nix # LSP, treesitter, and language support
    ./picker.nix # Telescope/Snacks picker configuration
    ./snacks.nix # Snacks.nvim features
    ./utils.nix # Utility plugins (completion, statusline, etc.)
    ./mini.nix # Mini.nvim modules
  ];

  programs.nvf = {
    enable = true;
    settings.vim = {
      startPlugins = [
        pkgs.vimPlugins.vim-kitty-navigator
      ];
    };
  };
}
