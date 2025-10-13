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
  };

  home.sessionVariables = {
    GTK_IM_MODULE = lib.mkForce "wayland";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
    SDL_IM_MODULE = "fcitx";
  };
}
