{ pkgs, ... }: {
    imports = [
        ../../modules/common.nix
        ../../modules/services/buildkitd.nix
        ../../modules/services/ntpd-rs.nix
        ../../modules/services/pipewire.nix
        ../../modules/services/xserver.nix
        ./hardware-configuration.nix
    ];

    environment.systemPackages = with pkgs; [
        brave
        buildkit
        discord
        fzf
        gh
        insomnia
        iptables
        mongodb-compass
        nerdctl
        protobuf
        spotify
        teamspeak3
        vlc
        vscode
    ];

    nixpkgs.config.allowUnfree = true;

    programs = {
        git.enable = true;
        htop.enable = true;
        obs-studio = {
            enable = true;
            enableVirtualCamera = true;
        };
        zsh = {
            autosuggestions.enable = true;
            enable = true;
            enableBashCompletion = true;
            ohMyZsh = {
                enable = true;
                theme = "agnoster";
            };
            syntaxHighlighting.enable = true;
        };
    };

    users.users.yunus = {
        description = "Yunus Emre ALTINER";
        extraGroups = [ "audio" "networkmanager" "wheel" "video" ];
        linger = true;
        initialPassword = "changeme";
        isNormalUser = true;
        shell = pkgs.zsh;
    };

    virtualisation.containerd.enable = true;
}
