{ ... }:
{
  boot = {
    enableContainers = false;
    growPartition = true;
    tmp.useTmpfs = false;
    initrd = {
      availableKernelModules = [
        "ahci"
        "nvme"
        "usbhid"
        "usb-storage"
        "xhci_pci"
      ];
    };
    kernelParams = [ "loglevel=3" "quiet" ];
    loader.systemd-boot = {
      editor = false;
      enable = true;
      memtest86.enable = true;
    };
  };
}
