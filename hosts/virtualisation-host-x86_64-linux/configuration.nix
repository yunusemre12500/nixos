{ ... }: {
    imports = [
        ../../modules/boot-loader/systemd-boot.nix
        ../../modules/network/systemd-networkd.nix
        ../../modules/services/ntpd-rs.nix
        ../../modules/services/openssh.nix
        ../../modules/common.nix
    ];
}
