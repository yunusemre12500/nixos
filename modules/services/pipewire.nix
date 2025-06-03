{ ... }:
{
  services.pipewire = {
    alsa.enable = true;
    enable = true;
    jack.enable = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };
}
