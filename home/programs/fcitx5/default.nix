{
  pkgs,
  lib,
  ...
}: {
  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5.addons = with pkgs; [
      fcitx5-hangul # Korean input
      fcitx5-gtk # GTK integration
      fcitx5-configtool # GUI configuration tool
    ];
    fcitx5.settings.inputMethod = {
      "GroupOrder"."0" = "Default";
      "Groups/0" = {
        Name = "Default";
        "Default Layout" = "us";
        DefaultIM = "hangul";
      };
      "Groups/0/Items/0".Name = "keyboard-us";
      "Groups/0/Items/1".Name = "hangul";
    };
  };

  home.sessionVariables = {
    GTK_IM_MODULE = lib.mkForce "wayland";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
    SDL_IM_MODULE = "fcitx";
  };
}
