{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    dnsutils
    dracula-theme
    gtk3
    gtk4
    iftop
    pavucontrol
  ];
}
