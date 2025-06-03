{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    dracula-theme
    gtk3
    gtk4
    iftop
    pavucontrol
  ];
}
