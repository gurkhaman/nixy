{
  config,
  lib,
  ...
}: {
  imports = [
    # Choose your theme here:
    ../../themes/catppuccin.nix
  ];

  config.var = {
    hostname = "nixos";
    username = "akharel";
    configDirectory =
      "/home/"
      + config.var.username
      + "/.config/nixos"; # The path of the nixos configuration directory

    keyboardLayout = "us";

    location = "Seoul";
    timeZone = "Asia/Seoul";
    defaultLocale = "en_US.UTF-8";
    extraLocale = "ko_KR.UTF-8";

    git = {
      username = "gurkhaman";
      email = "25946015+gurkhaman@users.noreply.github.com";
    };

    autoUpgrade = false;
    autoGarbageCollector = true;
  };

  # Let this here
  options = {
    var = lib.mkOption {
      type = lib.types.attrs;
      default = {};
    };
  };
}
