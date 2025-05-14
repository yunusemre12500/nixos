{ pkgs, ... }: {
  imports = [
    ../modules/home-manager/programs/direnv.nix
    ../modules/home-manager/programs/gh.nix
    ../modules/home-manager/programs/git.nix
    ../modules/home-manager/programs/gnupg.nix
    ../modules/home-manager/programs/jq.nix
    ../modules/home-manager/programs/nh.nix
    ../modules/home-manager/programs/obs-studio.nix
    ../modules/home-manager/programs/tmux.nix
    ../modules/home-manager/programs/vscode.nix
    ../modules/home-manager/programs/zed-editor.nix
    ../modules/home-manager/programs/zsh.nix
  ];

  home = {
    stateVersion = "24.11";
    packages = with pkgs; [
      brave
      buildkit
      discord
      insomnia
      iptables
      kubectl
      mongodb-compass
      nerdctl
      openssl
      spotify
      teamspeak3
      vlc
    ];
  };

  programs.home-manager.enable = true;
}
