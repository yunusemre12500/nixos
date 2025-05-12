{ ... }: {
  imports = [ ./common.nix ];

  boot.loader.systemd-boot.enable = true;
}
