{config, ...}: {
  imports = [
    # Mostly system related configuration
    ../../nixos/nvidia.nix
    ../../nixos/audio.nix
    ../../nixos/bluetooth.nix
    ../../nixos/fonts.nix
    ../../nixos/home-manager.nix
    ../../nixos/nix.nix
    ../../nixos/systemd-boot.nix
    ../../nixos/sddm.nix
    ../../nixos/users.nix
    ../../nixos/utils.nix
    ../../nixos/tailscale.nix
    ../../nixos/hyprland.nix

    # You should let those lines as is
    ./hardware-configuration.nix
    ./variables.nix
  ];

  networking = {
    interfaces.enp4s0 = {
      ipv4.addresses = [
        {
          address = "143.248.49.69";
          prefixLength = 24;
        }
      ];
    };
    defaultGateway = {
      address = "143.248.49.1";
      interface = "enp4s0";
    };
    nameservers = ["1.1.1.1"];
  };

  virtualisation.docker = {
    enable = true;
    daemon.settings.features.cdi = true;
    rootless.daemon.settings.features.cdi = true;
  };
  # hardware.nvidia-container-toolkit.enable = true;
  users.users."${config.var.username}".extraGroups = ["docker"];

  home-manager.users."${config.var.username}" = import ./home.nix;

  # Don't touch this
  system.stateVersion = "24.05";
}
