{ config, ... }:
{
  hardware = {
    cpu.amd.updateMicrocode = true;
    graphics.enable = true;
    nvidia = {
      modesetting.enable = true;
      open = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      powerManagement.enable = true;
    };
  };
}
