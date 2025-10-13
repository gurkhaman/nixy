# This file is used to sign git commits using an SSH key.
{
  # Obviously, change this to your own SSH key.
  home.file.".ssh/allowed_signers".text = "* $(cat ~/.ssh/github.pub)";

  programs.git.extraConfig = {
    commit.gpgsign = true;
    gpg.ssh.allowedSignersFile = "~/.ssh/allowed_signers";
    gpg.format = "ssh";
    user.signingkey = "~/.ssh/github.pub";
  };
}
