{ config, lib, ... }:
{
  boot.kernel.sysctl = lib.mkIf (!config.networking.enableIPv6) {
    "net.ipv6.conf.all.disable_ipv6" = 1;
    "net.ipv6.conf.default.disable_ipv6" = 1;
    "net.ipv6.conf.lo.disable_ipv6" = 1;
  };

  networking = {
    dhcpcd.enable = false;
    enableIPv6 = false;
    firewall.enable = true;
    interfaces.eno1.useDHCP = true;
    iproute2.enable = true;
    resolvconf.enable = false;
    useDHCP = false;
    useNetworkd = true;
  };

  systemd.network.enable = true;
  services.resolved = {
    dnssec = "true";
    dnsovertls = "opportunistic";
    enable = true;
  };
}
