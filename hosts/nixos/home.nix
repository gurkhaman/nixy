{
  pkgs,
  config,
  ...
}: {
  imports = [
    # Mostly user-specific configuration
    ./variables.nix

    # Programs
    ../../home/programs/alacritty
    ../../home/programs/nvf
    #../../home/programs/neovim
    ../../home/programs/shell
    ../../home/programs/fetch
    ../../home/programs/git
    ../../home/programs/git/signing.nix
    ../../home/programs/spicetify
    ../../home/programs/thunar
    ../../home/programs/lazygit
    ../../home/programs/discord
    ../../home/programs/tailscale
    ../../home/programs/fcitx5
    ../../home/programs/opencode

    # Scripts
    ../../home/scripts # All scripts

    # System (Desktop environment like stuff)
    ../../home/system/hyprland
    ../../home/system/hyprlock
    ../../home/system/hyprpanel
    ../../home/system/hyprpaper
    ../../home/system/zathura
    ../../home/system/mime
    ../../home/system/udiskie
    # ../../home/system/vicinae
    ../../home/system/wofi
    # ../../home/system/hypridle
  ];

  home = {
    inherit (config.var) username;
    homeDirectory = "/home/" + config.var.username;
    packages = with pkgs; [
      # Apps
      obsidian # Note taking app
      textpieces # Manipulate texts
      curtail # Compress images
      resources # Resource monitor
      gnome-clocks # Clocks app
      gnome-text-editor # Basic graphic text editor
      mpv # Video player
      firefox
      zotero

      # Privacy
      session-desktop # Session app, private messages
      ticktick # Privacy friendly todo app

      # Dev
      go
      bun
      nodejs
      python3
      jq
      just
      pnpm
      air
      duckdb
      uv
      claude-code

      # Utils
      zip
      unzip
      optipng
      jpegoptim
      pfetch
      btop
      fastfetch
      gcr

      # Just cool
      peaclock
      cbonsai
      pipes
      cmatrix

      # Backup
      vscode
    ];

    # Import my profile picture, used by the hyprpanel dashboard
    file.".face.icon" = {source = ./profile_picture.png;};

    # Don't touch this
    stateVersion = "24.05";
  };
  services.gnome-keyring = {
    enable = true;
    components = ["secrets"];
  };
  programs.home-manager.enable = true;
}
