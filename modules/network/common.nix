{ config, lib, ... }: {
    services.resolved.enable = true;
    networking = {
        dhcpcd.enable = false;
        enableIPv6 = false;
        firewall = {
            allowPing = false;
            enable = false;
        };
        sysctl = lib.mkIf (!config.networking.enableIPv6) {
            "net.ipv6.conf.all.disable_ipv6" = 1;
            "net.ipv6.conf.default.disable_ipv6" = 1;
            "net.ipv6.conf.lo.disable_ipv6" = 1;
        };
        useDHCP = false;
    };
}
