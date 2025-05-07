{ pkgs,  ... }: {
  systemd.services.buildkitd = {
    description = "BuildKit Daemon";
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.buildkit}/bin/buildkitd";
      Restart = "always";
      User = "root";
    };
  };
}
