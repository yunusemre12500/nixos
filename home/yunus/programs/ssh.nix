{ ... }:
{
  programs.ssh = {
    compression = true;
    serverAliveInterval = 15;
  };
}
