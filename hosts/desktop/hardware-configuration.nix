{ config, ... }:
{
  imports = [
    ../../modules/boot-loader/grub.nix
    ../../modules/network/networkmanager.nix
  ];

  hardware = {
    graphics.enable = true;

    nvidia = {
      modesetting.enable = true;
      open = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      powerManagement.enable = true;
    };
  };

  networking = {
    hostName = "yunus-emre-altiner-pc";

    interfaces.eno1 = {
      mtu = 9194;
      useDHCP = true;
    };
  };
}
