{ ... }: {
  programs = {
    zsh = {
      autosuggestion = {
        enable = true;
        strategy = [ "completion" ];
      };
      enable = true;
      history.ignoreAllDups = true;
      syntaxHighlighting.enable = true;
    };
  };
}
