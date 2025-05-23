{ ... }:
{
  programs = {
    zsh = {
      autosuggestion = {
        enable = true;
        strategy = [
          "completion"
          "history"
          "match_prev_cmd"
        ];
      };
      enable = true;
      enableCompletion = true;
      history.ignoreAllDups = true;
      oh-my-zsh = {
        enable = true;
        theme = "agnoster";
      };
      syntaxHighlighting.enable = true;
    };
  };
}
