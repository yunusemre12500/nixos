{ ... }:
{
  imports = [ ./common.nix ];

  networking.networkmanager = {
    dhcp = "internal";
    dns = "systemd-resolved";
    enable = true;
  };
}
