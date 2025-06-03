{ ... }:
{
  imports = [
    ./buildkitd
    ./containerd
    ./pipewire.nix
    ./xserver.nix
  ];

  services.nscd.enable = false;
}
