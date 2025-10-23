{lib, ...}: {
  programs.alacritty = {
    enable = true;
    settings.font = {
      # normal.family = lib.mkForce "Jetbrains Mono Nerd Font";
      # bold.family = lib.mkForce "Jebrains Mono Nerd Font";
      # italic.family = lib.mkForce "Jetbrains Mono Nerd Font";
      # bold_italic.family = lib.mkForce "Jetbrains Mono Nerd Font";
      size = lib.mkForce 12.0;
    };
  };
}
