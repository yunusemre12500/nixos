{ pkgs, ... }:
{
  programs.tmux = {
    clock24 = true;
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";
  };
}
