{ ... }: {
  imports = [
    ./programs/gh.nix
    ./programs/git.nix
    ./programs/gnupg.nix
    ./programs/jq.nix
    ./programs/obs-studio.nix
    ./programs/tmux.nix
    ./programs/vscode.nix
    ./programs/zed-editor.nix
    ./programs/zsh.nix
  ];
  
  home = {
    homeDirectory = "/home/yunus";
    stateVersion = "24.11";
    username = "yunus";
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
  };

  programs.home-manager.enable = true;
}
