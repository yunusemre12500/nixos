{ pkgs, ... }:
{
  environment.etc."containerd/config.toml".text = ''
    version = 3
    root = "/var/lib/containerd"
    state = "/var/run/containerd"
    temp = ""
    disabled_plugins = [
      "io.containerd.differ.v1.erofs",
      "io.containerd.internal.v1.tracing",
      "io.containerd.nri.v1.nri",
      "io.containerd.snapshotter.v1.blockfile",
      "io.containerd.snapshotter.v1.btrfs",
      "io.containerd.snapshotter.v1.devmapper",
      "io.containerd.snapshotter.v1.erofs",
      "io.containerd.snapshotter.v1.zfs",
      "io.containerd.tracing.processor.v1.otlp",
      "io.containerd.ttrpc.v1.otelttrpc"
    ]

    [grpc]
      address = "/var/run/containerd/containerd.sock"
      uid = 0
      gid = 0
      max_recv_message_size = 16777216
      max_send_message_size = 16777216

    [ttrpc]
      address = ""
      uid = 0
      gid = 0

    [debug]
      level = ""
      format = ""

    [metrics]
      address = ""
      grpc_histogram = false

    [plugins."io.containerd.cri.v1.images"]
      snapshotter = "overlayfs"
      disable_snapshot_annotations = true
      max_concurrent_downloads = 3
      image_pull_progress_timeout = "5m0s"
      stats_collect_period = 10

      [plugins."io.containerd.cri.v1.images".pinned_images]
        sandbox = "registry.k8s.io/pause:3.10"

      [plugins."io.containerd.cri.v1.images".registry]
        config_path = ""

      [plugins."io.containerd.cri.v1.images".image_decryption]
        key_model = "node"

    [plugins."io.containerd.cri.v1.runtime"]
      enable_selinux = false
      selinux_category_range = 1024
      max_container_log_line_size = 16384
      restrict_oom_score_adj = true
      ignore_image_defined_volumes = true
      enable_unprivileged_ports = true
      enable_unprivileged_icmp = true
      enable_cdi = true
      cdi_spec_dirs = [ "/etc/cdi", "/var/run/cdi" ]

      [plugins."io.containerd.cri.v1.runtime".containerd]
        default_runtime_name = "runc"

        [plugins."io.containerd.cri.v1.runtime".containerd.runtimes.runc]
          runtime_type = "io.containerd.runc.v2"
          sandboxer = "podsandbox"

          [plugins."io.containerd.cri.v1.runtime".containerd.runtimes.runc.options]
            BinaryName = "${pkgs.runc}/bin/runc"
            SystemdCgroup = true

      [plugins."io.containerd.cri.v1.runtime".cni]
        bin_dirs = [ "${pkgs.cni-plugins}/bin" ]
        conf_dir = "/etc/cni/net.d"
        max_conf_num = 1

    [plugins."io.containerd.gc.v1.scheduler"]
      pause_threshold = 0.02
      mutation_threshold = 100
      startup_delay = "100ms"

    [plugins."io.containerd.grpc.v1.cri"]
      disable_tcp_service = true
      stream_server_address = "127.0.0.1"
      stream_idle_timeout = "4h0m0s"

    [plugins."io.containerd.image-verifier.v1.bindir"]
      bin_dir = "/opt/containerd/image-verifier/bin"
      max_verifiers = 10
      per_verifier_timeout = "10s"

    [plugins."io.containerd.internal.v1.opt"]
      path = "/opt/containerd"

    [plugins."io.containerd.metadata.v1.bolt"]
      content_sharing_policy = "shared"
      no_sync = false

    [plugins."io.containerd.monitor.container.v1.restart"]
      interval = "10s"

    [plugins."io.containerd.monitor.task.v1.cgroups"]
      no_prometheus = false

    [plugins."io.containerd.runtime.v2.task"]
      platforms = [ "linux/amd64" ]

    [plugins."io.containerd.service.v1.diff-service"]
      default = [ "walking" ]

    [stream_processors."io.containerd.ocicrypt.decoder.v1.tar"]
      accepts = [ "application/vnd.oci.image.layer.v1.tar+encrypted" ]
      returns = "application/vnd.oci.image.layer.v1.tar"
      path = "ctd-decoder"
      args = [ "--decryption-keys-path", "/etc/containerd/ocicrypt/keys" ]
      env = [ "OCICRYPT_KEYPROVIDER_CONFIG=/etc/containerd/ocicrypt/ocicrypt_keyprovider.conf" ]

    [stream_processors."io.containerd.ocicrypt.decoder.v1.tar.gzip"]
      accepts = [ "application/vnd.oci.image.layer.v1.tar+gzip+encrypted" ]
      returns = "application/vnd.oci.image.layer.v1.tar+gzip"
      path = "ctd-decoder"
      args = [ "--decryption-keys-path", "/etc/containerd/ocicrypt/keys" ]
      env = [ "OCICRYPT_KEYPROVIDER_CONFIG=/etc/containerd/ocicrypt/ocicrypt_keyprovider.conf" ]

    [cgroup]
      path = ""

    [timeouts]
      "io.containerd.timeout.cri.defercleanup" = "1m0s"
      "io.containerd.timeout.metrics.shimstats" = "2s"
      "io.containerd.timeout.shim.cleanup" = "5s"
      "io.containerd.timeout.shim.load" = "5s"
      "io.containerd.timeout.shim.shutdown" = "3s"
      "io.containerd.timeout.task.state" = "2s"
  '';
}
