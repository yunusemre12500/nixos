{ ... }: {
    imports = [ ./common.nix ];

    boot.loader.grub = {
        device = "/dev/disk/by-label/BOOT";
        efiSupport = true;
        enable = true;
        version = 2;
    };
}
