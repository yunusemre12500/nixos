{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/common.nix
    ../../modules/services/buildkitd.nix
    ../../modules/services/ntpd-rs.nix
    ../../modules/services/pipewire.nix
    ../../modules/services/xserver.nix
  ];

  users.users.yunus = {
    description = "Yunus Emre ALTINER";
    extraGroups = [
      "audio"
      "input"
      "networkmanager"
      "wheel"
      "video"
    ];
    ignoreShellProgramCheck = true;
    initialPassword = "changeme";
    isNormalUser = true;
    linger = true;
    shell = pkgs.zsh;
  };

  virtualisation.containerd.enable = true;
}
