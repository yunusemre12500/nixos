{ pkgs, ... }:
{
  users.users.yunus = {
    description = "Yunus Emre ALTINER";
    extraGroups = [
      "audio"
      "input"
      "wheel"
      "video"
    ];
    initialPassword = "changeme";
    isNormalUser = true;
    linger = true;
    shell = pkgs.zsh;
  };
}
