{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "Webeng-Server" = {
        hostname = "143.248.47.25";
        user = "akharel";
        port = 22;
        identityFile = "~/.ssh/github";
      };

      "Webeng-Server-Admin" = {
        hostname = "143.248.47.25";
        user = "root";
        port = 22;
        identityFile = "~/.ssh/id_rsa_webeng";
      };
    };
  };
}
