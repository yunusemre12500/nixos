{ ... }:
{
  imports = [ ./common.nix ];

  networking.useNetworkd = true;
  systemd.network.enable = true;
}
