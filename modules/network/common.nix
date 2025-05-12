{ config, lib, ... }: {
  boot.kernel.sysctl = lib.mkIf (!config.networking.enableIPv6) {
    "net.ipv6.conf.all.disable_ipv6" = 1;
    "net.ipv6.conf.default.disable_ipv6" = 1;
    "net.ipv6.conf.lo.disable_ipv6" = 1;
  };

  networking = {
    dhcpcd.enable = false;
    enableIPv6 = false;

    firewall = {
      allowPing = false;
      enable = false;
    };
  
    useDHCP = false;
  };

  services.resolved.enable = true;
}
