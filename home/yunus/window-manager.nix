{ ... }:
{
  wayland.windowManager.hyprland = {
    systemd.enable = true;
    xwayland.enable = true;
  };
}
