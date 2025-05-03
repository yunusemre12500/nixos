{ ... }: {
    imports = [ ./common.nix ];

    boot.loader.grub = {
        device = "/dev/disk/by-label/root";
        enable = true;
    };
}
