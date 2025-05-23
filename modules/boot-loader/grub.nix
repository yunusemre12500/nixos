{ ... }:
{
  imports = [ ./common.nix ];

  boot.loader.grub = {
    device = "nodev";
    efiSupport = true;
    enable = true;
  };
}
