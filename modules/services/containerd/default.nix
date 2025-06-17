{ lib, pkgs, ... }:
{
  imports = [
    ./config.nix
  ];

  systemd = {
    services.containerd = {
      after = [
        "containerd.socket"
        "dbus.service"
        "network.target"
      ];
      description = "Containerd Container Runtime";
      documentation = [ "https://containerd.io/docs" ];
      environment = lib.mkForce {
        PATH = "${pkgs.runc}/bin:$PATH";
      };
      requires = [ "containerd.socket" ];
      serviceConfig = {
        Delegate = "yes";
        ExecStart = "${pkgs.containerd}/bin/containerd";
        KillMode = "process";
        LimitCORE = "infinity";
        LimitNPROC = "infinity";
        OOMScoreAdjust = -999;
        Restart = "always";
        RestartSec = 5;
        TasksMax = "infinity";
        Type = "notify";
      };
      wantedBy = [ "multi-user.target" ];
    };
    sockets.containerd = {
      description = "Containerd Container Runtime";
      documentation = [ "https://containerd.io/docs" ];
      socketConfig = {
        ListenStream = "%t/containerd/containerd.socket";
        SocketMode = "0660";
      };
      wantedBy = [ "sockets.target" ];
    };
  };
}
