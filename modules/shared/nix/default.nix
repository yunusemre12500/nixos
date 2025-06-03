{ ... }:
{
  imports = [
    ./gc.nix
    ./store.nix
  ];

  nix = {
    channel.enable = false;
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "flakes"
        "nix-command"
      ];
    };
  };
}
