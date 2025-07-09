{ pkgs, ... }:
{
  systemd = {
    services.buildkitd = {
      after = [ "containerd.service" "buildkitd.socket" ];
      description = "BuildKit";
      documentation = [ "https://github.com/moby/buildkit" ];
      requires = [ "containerd.service" "buildkitd.socket" ];
      serviceConfig = {
        ExecStart = "${pkgs.buildkit}/bin/buildkitd";
        Restart = "always";
        RestartSec = 5;
        Type = "notify";
      };
      wantedBy = [ "multi-user.target" ];
    };
    sockets.buildkitd = {
      description = "BuildKit";
      documentation = [ "https://github.com/moby/buildkit" ];
      socketConfig = {
        ListenStream = "%t/buildkit/buildkitd.socket";
        SocketMode = "0660";
      };
      wantedBy = [ "sockets.target" ];
    };
  };
}
