{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  # Link your Lua config
  home.file.".config/nvim" = {
    source = ./nvim;
    recursive = true;
  };
}
