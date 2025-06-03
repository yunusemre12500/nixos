{ ... }:
{
  boot = {
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
    loader.systemd-boot = {
      editor = false;
      enable = true;
    };
  };
}
