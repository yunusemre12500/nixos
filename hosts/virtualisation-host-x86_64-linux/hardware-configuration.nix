{ ... }: {
    imports = [
        ../../modules/boot-loader/systemd-boot.nix
        ../../modules/network/systemd-networkd.nix
    ];

    boot.kernelModules = [ "kvm-amd" ];

    # TODO: change when system initialization
    networking.hostName = "virtualisation-host";
}