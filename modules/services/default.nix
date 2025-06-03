{ ... }:
{
  imports = [
    ./buildkitd
    ./containerd
    ./greetd.nix
    ./pipewire.nix
    ./xserver.nix
  ];

  services.nscd.enable = false;
}
