{ pkgs, ... }:
{
  imports = [
    ./programs
    ./services
    ./window-manager.nix
    ./xdg.nix
  ];

  home = {
    language = {
      address = "tr_TR.UTF-8";
      base = "tr_TR.UTF-8";
      collate = "tr_TR.UTF-8";
      ctype = "tr_TR.UTF-8";
      measurement = "tr_TR.UTF-8";
      messages = "tr_TR.UTF-8";
      monetary = "tr_TR.UTF-8 ";
      name = "tr_TR.UTF-8";
      numeric = "tr_TR.UTF-8";
      paper = "tr_TR.UTF-8";
      telephone = "tr_TR.UTF-8";
      time = "tr_TR.UTF-8";
    };
    packages = with pkgs; [
      brave
      cilium-cli
      discord
      helmfile
      insomnia
      iptables
      kubectl
      kubectx
      kubernetes-helm
      lens
      mongodb-compass
      nerdctl
      nixd
      nixfmt-rfc-style
      pinentry-gnome3
      spotify
      teamspeak3
      teamspeak6-client
      vlc
    ];
    preferXdgDirectories = true;

    stateVersion = "25.05";
  };
}
