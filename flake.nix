{
    description = "My first flake.";

    inputs.nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.11";

    nixConfig = {
        experimental-features = [ "flakes" "nix-command" ];
    };

    outputs = { nixpkgs, ... }: let
        system = "x86_64-linux";
    in {
        nixosConfigurations = {
            desktop = nixpkgs.lib.nixosSystem {
                inherit system;

                modules = [ ./hosts/desktop-${system}/configuration.nix ];
            };
            virtualisation-host = nixpkgs.lib.nixosSystem {
                inherit system;

                modules = [ ./hosts/virtualisation-host-${system}/configuration.nix ];
            };
        };
    };
}
