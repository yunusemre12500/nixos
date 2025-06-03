{ ... }:
{
  security = {
    protectKernelImage = true;
    polkit.enable = true;
    rtkit.enable = true;
    sudo.enable = false;
    sudo-rs.enable = true;
  };
}
