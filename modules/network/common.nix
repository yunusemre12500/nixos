{ lib, ... }: {
    services.resolved.enable = true;
    networking = {
        dhcpcd.enable = false;
        enableIPv6 = false;
        firewall = {
            allowPing = false;
            enable = false;
        };
        useDHCP = false;
    };
}
