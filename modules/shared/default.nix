{ lib, ... }:
{
  imports = [
    ../services
    ./nix
    ./boot.nix
    ./console.nix
    ./disk-layout.nix
    ./environment.nix
    ./hardware.nix
    ./locale.nix
    ./networking.nix
    ./pkgs.nix
    ./programs.nix
    ./security.nix
    ./time.nix
    ./users.nix
    ./xdg.nix
  ];

  documentation = {
    doc.enable = false;
    enable = false;
    info.enable = false;
    man.enable = false;
    nixos.enable = false;
  };

  powerManagement.cpuFreqGovernor = "performance";

  system.nssModules = lib.mkForce [ ];
}
