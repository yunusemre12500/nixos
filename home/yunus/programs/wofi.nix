{ ... }:
{
  programs.wofi = {
    enable = true;
    settings = {
      allow_images = true;
      insensitive = true;
      no_actions = true;
      show = "drun";
    };
  };
}
