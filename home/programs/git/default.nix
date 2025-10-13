# Git configuration
{config, pkgs, ...}: let
  username = config.var.git.username;
  email = config.var.git.email;
in {
  programs.git = {
    enable = true;
    userName = username;
    userEmail = email;
    ignores = [
      ".cache/"
      ".DS_Store"
      ".idea/"
      "*.swp"
      "*.elc"
      "auto-save-list"
      ".direnv/"
      "node_modules"
      "result"
      "result-*"
    ];
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = "false";
      push.autoSetupRemote = true;
      color.ui = "1";
      credential.helper = "${
          pkgs.git.override { withLibsecret = true; }
        }/bin/git-credential-libsecret";
    };
  };
}
