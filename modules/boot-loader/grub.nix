{ ... }: {
    imports = [ ./common.nix ];

    boot.loader.grub = {
        device = "/dev/disk/by-label/BOOT";
        enable = true;
        version = 2;
    };
}
