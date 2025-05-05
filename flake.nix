{
    description = "My first flake.";

    inputs.nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.11";

    nixConfig = {
        experimental-features = [ "flakes" "nix-command" ];
    };

    outputs = { nixpkgs, ... }: let
        pkgs = import nixpkgs {
            inherit system;
        };
        system = "x86_64-linux";
    in {
        devShells.${system} = {
            go = pkgs.mkShell {
                name = "go-development-shell";
                packages = with pkgs; [ go ];
            };
            nodejs = pkgs.mkShell {
                name = "nodejs-development-shell";
                packages = with pkgs; [ nodejs pnpm ];
            };
            rust = pkgs.mkShell {
                name = "rust-development-shell";
                packages = with pkgs; [ cargo rustc ];
            };
        };
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
