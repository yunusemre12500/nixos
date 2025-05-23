{ pkgs, ... }:
{
  systemd.services.buildkitd = {
    description = "BuildKit Daemon";
    serviceConfig = {
      ExecStart = "${pkgs.buildkit}/bin/buildkitd";
      Restart = "always";
      RestartSec = "5";
    };
    wantedBy = [ "multi-user.target" ];
  };
}
