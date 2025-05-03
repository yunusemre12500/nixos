{ ... }: {
    services.xserver = {
        desktopManager.gnome.enable = true;
        displayManager.gdm.enable = true;
        enable = true;
        xkb.layout = "tr";
        videoDrivers = [ "nvidia" ];
    };
}
