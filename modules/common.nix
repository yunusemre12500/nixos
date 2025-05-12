{ lib, ... }: {
    boot.initrd.availableKernelModules = [ "ahci" "nvme" "usbhid" "usb-storage" "xhci_pci" ];

  console.keyMap = "trq";

  documentation = {
    doc.enable = false;
    enable = false;
    info.enable = false;
    man.enable = false;
    nixos.enable = false;
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/root";
      fsType = "xfs";
    };
    "/boot" = {
      device = "/dev/disk/by-label/BOOT";
      fsType = "vfat";
      options = [ "dmask=0077" "fmask=0077" ];
    };
  };

  hardware.cpu.amd.updateMicrocode = true;

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings.LC_ALL = "tr_TR.UTF-8";
  };

  nix = {
    extraOptions = ''
        experimental-features = flakes nix-command
    '';
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 1d";
    };

    optimise = {
      automatic = true;
      dates = [ "daily" ];
    };
  };

  powerManagement.cpuFreqGovernor = "performance";

  security = {
    protectKernelImage = true;
    rtkit.enable = true;
    sudo.enable = false;
    sudo-rs.enable = true;
  };

  services.nscd.enable = false;

  system = {
    nssModules = lib.mkForce [];
    stateVersion = "24.11";
  };

  time.timeZone = "Europe/Istanbul";
}
