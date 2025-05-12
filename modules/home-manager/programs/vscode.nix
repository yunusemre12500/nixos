{ pkgs, ... }: {
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      codezombiech.gitignore
      dbaeumer.vscode-eslint
      eamodio.gitlens
      editorconfig.editorconfig
      esbenp.prettier-vscode
      # github.remotehub
      github.vscode-github-actions
      github.vscode-pull-request-github
      golang.go
      # icrawl.discord-vscode
      jnoortheen.nix-ide
      ms-azuretools.vscode-docker
      ms-kubernetes-tools.vscode-kubernetes-tools
      pkief.material-icon-theme
      redhat.vscode-yaml
      sdras.night-owl
      usernamehw.errorlens
    ];
    userSettings = {
      "editor.minimap.enabled" = false;
      "workbench.colorTheme" = "Night Owl (No Italics)";
      "workbench.startupEditor" = "none";
      "redhat.telemetry.enabled" = false;
    };
  };
}
